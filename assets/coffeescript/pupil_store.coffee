$ = jQuery

$(document).ready ->
	console.log "Ready to serve!"

$(document).ready ->
	link = "a[class^='option-']"
	# worldLink = "a[id^='world-']" 
	$(link).click (event)->
		event.preventDefault()
		# see if it is eye or world
		# console.log $(this).attr('id').split('-',1)
		imgId = '#' + $(this).attr('id').split('-',1) + '-img'
		imgSrc = $(this).attr("href")
		$(imgId).attr("src", imgSrc).show()
