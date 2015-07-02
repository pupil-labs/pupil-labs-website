# leaving this here in case we do want to read from the json files
# fs = require 'fs'

# wc = '../../contents/store/products/world-cameras.json'

# test = ->
#   x = JSON.parse(fs.readFileSync wc, 'utf8')
#   res = (p.id for p in x)
#   res

# console.log test()

products =
  world_none:
    id: "world_none"
    cost: 0
    label: "none"
    specs: "no world camera"
    dimensions: 0
    weight: 0
    img: "store/config_images/pupil-config-world-none.png"
    video: "#"
    order: 1,  
  
  world_hr:
    id: "world_hr"
    cost: 250
    label: "high resolution"
    specs: "A camera with beautiful image quality. We recommend this option when you want aesthetically pleasing footage, and are not concerned with size, weight, or speed. Max resolution: 1920x1080 @30fps. FOV 90 degrees diagonal with auto focus lens. 120ms latency."
    dimensions: 0
    weight: 0
    img: "store/config_images/pupil-config-world-1080p.png"
    video: "#"
    order: 2,  
  
  world_hs:
    id: "world_hs"
    cost: 250
    label: "high speed"
    specs: "Pupil Labs custom made camera. The fastest,smallest, lightest, and most versatile. We recommend this option for most use cases. 1920x1080 @30fps, 1280x720 @60fps, 640x480 @120fps. FOV 100deg diag (lenses are exchangeable: purchase alternate lenses below). 5.7ms latency."
    dimensions: 0
    weight: 0
    img: "store/config_images/pupil-config-world-120hz.png"
    video: "#"
    order: 3,
  
  eye_none:
    id: "eye_none"
    cost: 150
    label: "none"
    specs: "no eye camera"
    dimensions: 0
    weight: 0
    img: "store/config_images/pupil-config-eye-none.png"
    video: "#"
    order: 1,

  eye_30hz:
    id: "eye_30hz"
    cost: 550
    label: "30hz"
    specs: "Our smallest eye camera. Good for fixation detection. IR camera with IR illumination (dark pupil tracking). 640x480 @30fps."
    dimensions: 0
    weight: 0
    img: "store/config_images/pupil-config-eye-30hz.png"
    video: "#"
    order: 2,

  eye_120hz:
    id: "eye_120hz"
    cost: 800
    label: "120hz"
    specs: "A custom made camera that will resolve a wider range of eye movement motifs. IR camera with IR illumination (dark pupil tracking). 640x480 @120fps."
    dimensions: 0
    weight: 0
    img: "store/config_images/pupil-config-eye-none.png"
    video: "#"
    order: 3,

  eye_120hz_binocular:
    id: "eye_120hz_binocular"
    cost: 1500
    label: "120hz binocular"
    specs: "Binocular frame with high speed cameras for binocular eye detection. Custom made cameras that will resolve a wider range of eye movement motifs. IR camera with IR illumination (dark pupil tracking). 640x480 @120fps."
    dimensions: 0
    weight: 0
    img: "store/config_images/pupil-config-eye-none.png"
    video: "#"
    order: 3,

  product_eye_120hz:
    id: "product_eye_120hz"
    cost: 250
    label: "120hz eye camera"
    specs: "Upgrade to 120hz camera. A custom made camera that will resolve a wider range of eye movement motifs. IR camera with IR illumination (dark pupil tracking). 640x480 @120fps."
    dimensions: 0
    weight: 0
    img: "http://placehold.it/600/111111"
    video: "#"
    order: 1,    

  product_lens_kit:
    id: "product_lens_kit"
    cost: 200
    label: "lens kit"
    specs: "Alternate lenses for 120hz world camera. Wide angle"
    dimensions: 0
    weight: 0
    img: "http://placehold.it/600/111111"
    video: "#"
    order: 2,  

  product_support_6:
    id: "product_support_6"
    cost: 1000
    label: "6 month support contract"
    specs: "6 month support contract. Email support and 4 video support sessions"
    dimensions: 0
    weight: 0
    img: "http://placehold.it/600/111111"
    video: "#"
    order: 3,    

  product_support_12:
    id: "product_support_12"
    cost: 2000
    label: "12 month support contract"
    specs: "12 month support contract. Email support and 8 video support sessions"
    dimensions: 0
    weight: 0
    img: "http://placehold.it/600/111111"
    video: "#"
    order: 4,

  license_academic:
    id: "license_academic"
    cost: 0
    label: "academic use"
    specs: "for use within an academic (non-commercial) context.",

  license_commercial:
    id: "license_commercial"
    cost: 590
    label: "commercial use"
    specs: "commercial license is required if use is not academic."
    order: 1




# res = ([k,v.label] for k,v of products when k.split("_")[0] is "product")

_sumCost = (ids,qty)->
  costs = []
  for id in ids
    console.log id
    costs.push v.cost for k,v of products when v.id is id
  sum = costs.reduce (x,y) -> x+y
  sum *= qty
  sum

_getProductByType = (type="world")->
  [k,v] for k,v of products when k.split("_")[0] is type


console.log _sumCost(["world_none","eye_120hz","license_commercial"],2)
console.log _getProductByType()



