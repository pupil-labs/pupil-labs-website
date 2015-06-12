$ = jQuery


swapImg = (link) ->
	imgId = '#' + $(link).attr('id').split('-',1) + '-img'
	imgSrc = $(link).attr("href")
	$(imgId).attr("src", imgSrc).show()

updateLinkState = (link) ->
	# make the selector more specific
	configType = 'StoreConfig-' + $(link).attr('id').split('-',1)
	activeState = 'StoreConfig--state-active'
	prevSelection = "a[class='#{ configType + " " + activeState }']"
	$(prevSelection).removeClass(activeState)
	$(link).addClass(activeState)

updateConfig = () ->
	link = "a[class^='StoreConfig-']"
	$(link).click (event)->
		event.preventDefault()
		updateLinkState($(this))
		swapImg($(this))

$(document).ready ->
	updateConfig()