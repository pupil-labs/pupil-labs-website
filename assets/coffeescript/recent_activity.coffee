
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
    dateStr = [date.getFullYear(),date.getMonth()+1,date.getDate()].join('-')
    opacity = "style='opacity:"+String(1-(i*(1/filteredEvents.length)))+";'" 

    if e.type is "PushEvent"
      repoName = e.repo.name.split('/').pop()
      "#{ e.type + ' - ' + dateStr + ' - ' + repoName + ' - ' + e.payload.head }"
      commitLink = "https://github.com/#{ e.repo.name }/commit/#{ e.payload.head }" 
      events.push("<li #{ opacity }>#{ dateStr + ' - ' }commit to <a href='#{ commitLink }' target='_blank'>#{ repoName }</a></li>")
    
    if e.type is "ReleaseEvent"
      repoName = e.repository.name
      tagName = e.release.tag_name
      releaseLink = e.release.html_url
      events.push("<li #{ opacity }>#{ dateStr + ' - ' }new release - <a href='#{ releaseLink }' target='_blank'>#{repoName + ' - ' + tagName}</a></li>")

    if e.type is "IssuesEvent"
      actionType = e.payload.action
      issueLink = e.payload.issue.html_url
      issueNumber = e.payload.issue.number
      repoName = e.repo.name.split('/').pop()
      events.push("<li #{ opacity }>#{ dateStr + ' - ' }issue #{ actionType } - <a href='#{ issueLink }' target='_blank'>#{ repoName + ' issue # ' + issueNumber }</a></li>")

  eventString = events.join('')
  $("#Home-activity").append("<ul>#{ eventString }</ul>")

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
      
getGithubOrgEvents = (org = "pupil-labs",pages = 1)->
  $.ajax
    type: 'GET'
    url: "https://api.github.com/orgs/#{ org }/events?pages=#{ pages }"
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
