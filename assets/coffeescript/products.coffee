_products = productList
_configImgs = configImgs

# jsonToCoffeeObj = (file)->
#   parsedJSON = JSON.parse(file)
#   return parsedJSON

# objectify = (json)->
#   obj = {}
#   for k,v of json
#     obj[k] = v
#   return obj

# construct this once
# list of js objects
# _products = jsonToCoffeeObj(productJSON)


getConfigImgList = ->
  return _configImgs

getConfigImgByIds = (ids)->
  src = (i.img for i in getConfigImgList() when i.ids is ids)
  return src

getProducts = ->
  return _products

getProductsSum = (ids,qty=1)->
  vals = (i.cost for i in getProducts() when i.id in ids)
  vals = _sumAll(vals)
  vals *= qty
  vals

getProductWeight = (ids)->
  vals = (i.weight for i in getProducts() when i.id in ids)
  vals = _sumAll(vals)
  vals

_sumAll = (vals)->
  vals.reduce (a,b) -> a + b

getProductsFiltered = (type="world",sortKey="order",sortReverse=false)->
  res = (i for i in getProducts() when i.id.split("_")[0] is type)
  if sortBy
    res.sort (a,b)->
      sortBy(sortKey,a,b,sortReverse)
  return res

getOrderSpecTxt = (orderItems)->
  specs = []
  for i in orderItems
    prod = getProductById(i)
    specs.push("<h4>"+prod.cartlabel+"</h4>")
    specs.push("<p class='LicenseSpecs-txt'>"+prod.cartSpecs+"</p>")
  html = specs.join(" ")
  return html

getConfigImageUrls = ->
  urls = (i.img for i in getProducts() when i.id.split("_")[0] is 'world' or i.id.split("_")[0] is 'eye') 
  return urls

getConfigImagesByIds = (orderItems)->
  if orderItems.length > 1
    # it is pupil config item
    eye_img = null
    world_img = null
    for i in orderItems
      prod = getProductById(i)
      try
        prodId = prod.id.split('_')[0]
      catch e
        console.log e
      
      if prodId is 'eye'
        eye_img = "<img src='#{ prod.img }'class='Feature-image Feature-image--configEye'>"
      
      if prodId is 'world'
        world_img = "<img src='#{ prod.img }'class='Feature-image Feature-image--configWorld'>"
    return eye_img + world_img
  else
    # it is a simple product
    console.log getProductById(orderItems[0]).img
    productImg = "<img src='#{ getProductById(orderItems[0]).img }' class='Feature-image Feature-image--configEye'>"
    return productImg


getProductById = (uid)->
  prod = i for i in getProducts() when i.id is uid
  return prod

sortBy = (key, a, b, r=false) ->
  # http://stackoverflow.com/questions/9796764/how-do-i-sort-an-array-with-coffeescript
  r = if r then 1 else -1
  return -1*r if a[key] > b[key]
  return +1*r if a[key] < b[key]
  return 0

# console.log getProductsFiltered('eye','cost',true)
# console.log getProductsSum(['world_hs','eye_30hz','license_academic'],2)

