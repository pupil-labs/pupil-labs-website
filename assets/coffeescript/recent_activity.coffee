
processGithubRepoData = (data) ->
  forks = data.forks_count
  watchers = data.stargazers_count
  openIssues = data.open_issues
  console.log "Forks: #{ forks }"
  console.log "Stars: #{ watchers }" 
  console.log "Open Issues: #{ openIssues }"

getGithubRepoEvents = (org = "pupil-labs",repo = "pupil")->
  $.ajax
    type: 'GET'
    url:"https://api.github.com/repos/#{ org }/#{ repo }"
    dataType: "jsonp"
    success: (data,textStatus,jqXHR)->
      # sessionStorage.set("github_repo_activity")
      processGithubRepoData(data.data)
      
getGithubOrgEvents = (org = "pupil-labs",pages = 1)->
  $.ajax
    type: 'GET'
    url: "https://api.github.com/orgs/#{ org }/events?pages=#{ pages }"
    dataType: "jsonp"
    success: (data,textStatus,jqXHR)->
      # sessionStorage.set("github_org_events",data)
      console.log data

getGithubOrgInfo = (org = "pupil-labs")->
  $.ajax
    type: 'GET'
    url: "https://api.github.com/orgs/#{ org }"
    dataType: "jsonp"
    success: (data,textStatus,jqXHR)->
      console.log "Public repos: #{ data.data.public_repos }"