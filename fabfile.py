from fabric.api import *
import fabric.contrib.project as project
import os
import sys
import SimpleHTTPServer
import SocketServer
import fabric_helpers

# Local path configuration (can be absolute or relative to fabfile)
env.deploy_path = 'output'
DEPLOY_PATH = env.deploy_path

# setup fabric helper file location
env.fab_helpers_path = 'fabric_helpers'
FAB_HELPERS = env.fab_helpers_path

# Remote server configuration
production = 'root@localhost:22'
dest_path = '/var/www'

# Rackspace Cloud Files configuration settings
env.cloudfiles_username = 'my_rackspace_username'
env.cloudfiles_api_key = 'my_rackspace_api_key'
env.cloudfiles_container = 'my_cloudfiles_container'

@task
def clean():
    if os.path.isdir(DEPLOY_PATH):
        local('rm -rf {deploy_path}'.format(**env))
        local('mkdir {deploy_path}'.format(**env))
    
    # remove .pyc files from the local dir    
    local('rm -rf *.pyc')

@task
def build():
    local('pelican -s pelicanconf.py')

@task
def rebuild():
    clean()
    build()

@task
def regenerate():
    local('pelican -r -s pelicanconf.py')

@task
def serve(port=8000):
    os.chdir(env.deploy_path)

    PORT = port
    class AddressReuseTCPServer(SocketServer.TCPServer):
        allow_reuse_address = True

    server = AddressReuseTCPServer(('', PORT), SimpleHTTPServer.SimpleHTTPRequestHandler)

    sys.stderr.write('Serving on port {0} ...\n'.format(PORT))
    server.serve_forever()

@task
def reserve():
    build()
    serve()

@task
def preview():
    local('pelican -s publishconf.py')

@task
def cf_upload():
    rebuild()
    local('cd {deploy_path} && '
          'swift -v -A https://auth.api.rackspacecloud.com/v1.0 '
          '-U {cloudfiles_username} '
          '-K {cloudfiles_api_key} '
          'upload -c {cloudfiles_container} .'.format(**env))

# convenience functions for file creation with current date and slugs with no whitespace
@task
def new_post(title):
    fn = fabric_helpers.new_post(title)
    sys.stderr.write("New blog article created: {}".format(title))

@task
def new_page(title):
    fn = fabric_helpers.new_page(title)
    sys.stderr.write("New page created: {}".format(title))


@hosts(production)
def publish():
    local('pelican -s publishconf.py')
    project.rsync_project(
        remote_dir=dest_path,
        exclude=".DS_Store",
        local_dir=DEPLOY_PATH.rstrip('/') + '/',
        delete=True,
        extra_opts='-c',
    )

