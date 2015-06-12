$ = jQuery


swapImg = (link) ->
	imgId = '#' + $(link).attr('id').split('-',1) + '-img'
	imgSrc = $(link).attr("href")
	# use the href attribute of the link to update the img
	$(imgId).attr("src", imgSrc).show()

updateLinkState = (link) ->
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
		updateLinkState($(this))
		swapImg($(this))
		updateSubTotal()

$(document).ready ->
	updateSubTotal()
	updateConfig()