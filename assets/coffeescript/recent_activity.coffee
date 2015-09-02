timeSince = (date)->
  seconds = Math.floor((new Date().getTime() - date)/1000)
  # Y,M,D,H,M,S in milliseconds
  Y = 31536000
  MO = 2592000
  D = 86400
  H = 3600
  MI = 60
  
  switch
    when Math.floor(seconds/Y) is 1 then Math.floor(seconds/Y) + " year ago"  
    when Math.floor(seconds/Y) > 1 then Math.floor(seconds/Y) + " years ago"  
    when Math.floor(seconds/MO) is 1 then Math.floor(seconds/MO) + " month ago"  
    when Math.floor(seconds/MO) > 1 then Math.floor(seconds/MO) + " months ago"  
    when Math.floor(seconds/D) is 1 then Math.floor(seconds/D) + " day ago"  
    when Math.floor(seconds/D) > 1 then Math.floor(seconds/D) + " days ago"
    when Math.floor(seconds/H) is 1 then Math.floor(seconds/H) + " hour ago"  
    when Math.floor(seconds/H) > 1 then Math.floor(seconds/H) + " hours ago"
    when Math.floor(seconds/MI) is 1 then Math.floor(seconds/MI) + " minute ago"  
    when Math.floor(seconds/MI) > 1 then Math.floor(seconds/MI) + " minutes ago"
    else Math.floor(seconds) + " seconds ago"

String::truncate = (n,useWordBoundary)->
  overflow = @.length > n
  s = if overflow then @.substr(0,n-1) else @ 
  s = if useWordBoundary and overflow then s.substr(0,s.lastIndexOf(' ')) + '&hellip;' else @
  return s

processGithubRepoData = (data) ->
  forks = data.forks_count
  stars = data.stargazers_count
  openIssues = data.open_issues
  console.log "Forks: #{ forks }"
  console.log "Stars: #{ stars }" 
  console.log "Open Issues: #{ openIssues }"
  $("#Home-activity").append("<h3>Pupil Repository</h3>
                                <p>#{ forks } Forks</p>
                                <p>#{ openIssues } Open Issues</p>
                                <p>#{ stars } Stars</p>")
  

processGithubEvents = (recentEvents)->
  events = []
  selectedEvents = ["PushEvent","ReleaseEvent","IssuesEvent"]
  filteredEvents = (e for e in recentEvents.data when e.type in selectedEvents)
  for e,i in filteredEvents 
    date = new Date(e.created_at)
    date = timeSince(date)
    # dateStr = [date.getFullYear(),date.getMonth()+1,date.getDate()].join('-')
    dateStr = date
    opacity = "style='opacity:"+String(1-(i*(1/filteredEvents.length)))+";'" 

    if e.type is "PushEvent"
      repoName = e.repo.name.split('/').pop()
      numCommits = if e.payload.distinct_size > 1 then e.payload.distinct_size + " commits" else e.payload.distinct_size + " commit" 
      commitLink = "https://github.com/#{ e.repo.name }/commit/#{ e.payload.head }"
      authorLink = "<a href='#{ 'https://github.com/' + e.actor.login }' target='_blank'>#{ e.actor.login }</a>" 
      events.push("<li #{ opacity }>#{ dateStr}<p>#{ authorLink } pushed <a href='#{ commitLink }' target='_blank'>#{ numCommits }</a> to <strong>#{ repoName }/#{ e.payload.ref.split('/').pop() }</strong></p></li>")
    
    if e.type is "ReleaseEvent"
      repoName = e.repo.name
      tagName = e.payload.release.tag_name
      releaseLink = e.payload.release.html_url
      events.push("<li #{ opacity }>#{ dateStr }<p class='Activity-releaseEvent'><strong>new release </strong> for <strong>#{ repoName } - <a class='Activity-releaseEvent--tag' href='#{ releaseLink }' target='_blank'>#{tagName}</a></p></li>")

    if e.type is "IssuesEvent"
      repoName = repo.split('/').pop()
      actionType = e.payload.action
      issueLink = e.payload.issue.html_url
      issueNumber = e.payload.issue.number
      events.push("<li #{ opacity }>#{ dateStr }<p>issue #{ actionType } at <a href='#{ issueLink }' target='_blank'>#{ repoName + '/#' + issueNumber}</a> - #{ e.payload.issue.title.truncate(60,true) }</p></li>")

  eventString = events.join('')
  $("#Home-activity-list").html("#{ eventString }")

processGithubRepos = (repos)->
  repos = []
  for r in repo
    repos.push("<div class='Grid-cell'>#{ r.name } - commits this week - see latest </div>")

getGithubRepoEvents = (org = "pupil-labs",repo = "pupil")->
  $.ajax
    type: 'GET'
    url:"https://api.github.com/repos/#{ org }/#{ repo }"
    dataType: "jsonp"
    success: (data,textStatus,jqXHR)->
      # sessionStorage.set("github_repo_activity")
      processGithubRepoData(data.data)
      
getGithubOrgEvents = (org = "pupil-labs",pages = 1,per_page = 10)->
  urlQuery = "https://api.github.com/orgs/#{ org }/events?pages=#{ pages }&per_page=#{ per_page }" 
  $.ajax
    type: 'GET'
    url: urlQuery
    dataType: "jsonp"
    success: (data,textStatus,jqXHR)->
      # sessionStorage.set("github_org_events",data)
      processGithubEvents(data)

getGithubOrgRepos = (org='pupil-labs')->
  # /orgs/:org/repos
  $.ajax
    type: 'GET'
    url: "https://api.github.com/orgs/#{ org }/repos"
    dataType: "jsonp"
    success: (data,textStatus,jqXHR)->
      console.log data.data 

getGithubOrgInfo = (org = "pupil-labs")->
  $.ajax
    type: 'GET'
    url: "https://api.github.com/orgs/#{ org }"
    dataType: "jsonp"
    success: (data,textStatus,jqXHR)->
      console.log "Public repos: #{ data.data.public_repos }"

$(document).ready ->
  if $("#Home").length > 0
    # getGithubRepoEvents()
    getGithubOrgEvents()
    # getGithubOrgRepos()
