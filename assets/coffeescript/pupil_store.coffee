$ = jQuery

swapImg = (links) ->
	for link in links
		console.log link
		imgId = '#' + $(link).attr('id').split('-',1) + '-img'
		imgSrc = $(link).attr("href")
		# use the href attribute of the link to update the img
		$(imgId).attr("src", imgSrc).show()

updateLinkState = (links) ->
	for link in links
		configType = 'StoreConfig-' + $(link).attr('id').split('-',1)
		activeState = 'StoreConfig--state-active'
		prevSelection = "a[class='#{ configType + " " + activeState }']"
		# remove previously active & add active class to clicked 
		$(prevSelection).removeClass(activeState)
		$(link).addClass(activeState)

updateSubTotal = () ->
	# sum the cost of the active links
	worldLink = "a[class='StoreConfig-world StoreConfig--state-active']"
	eyeLink = "a[class='StoreConfig-eye StoreConfig--state-active']"
	subTotalTxt = "p[class=StoreConfig-subTotal]"

	worldCost = $(worldLink).data('cost')
	eyeCost = $(eyeLink).data('cost')
	# console.log "world: #{ worldCost } eye: #{ eyeCost }"
	subTotal = parseFloat(worldCost) + parseFloat(eyeCost)
	$(subTotalTxt).text(subTotal)

updateConfig = () ->
	link = "a[class^='StoreConfig-']"
	$(link).click (event)->
		event.preventDefault()
		updateLinkState([$(this)])
		swapImg([$(this)])
		updateSubTotal()

selectPreset = () ->
	link = "a[class='Store-nav-link Store-nav-link--preset']"
	$(link).click (event)->
		event.preventDefault()
		# get the id of the preset from the data attribute
		[worldId,eyeId] = $(this).data('preset').split(" ")
		worldLink = "a[id='#{worldId}']"
		eyeLink = "a[id='#{eyeId}']"
		updateLinkState([worldLink, eyeLink])
		swapImg([worldLink, eyeLink])
		updateSubTotal()

$(document).ready ->
	# call updateSubTotal on init to get cost of init items
	updateSubTotal()
	selectPreset()
	updateConfig()