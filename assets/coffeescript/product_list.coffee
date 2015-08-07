productList = [
  {
    id: "world_none"
    cost: 0
    label: "none"
    specs:
        info: "No World camera"
    cartlabel: "World camera: no world camera"
    cartSpecs: "no world camera"
    dimensions: 0
    weight: 0
    img: "../media/images/config_images/pupil-config-world-none.jpg"
    video: "#"
    order: 1
  }, {
    id: "world_hr"
    cost: 250
    label: "high resolution"
    specs: 
        info: "World camera with beautiful image quality. We recommend this option when you want aesthetically pleasing footage, and are not concerned with size, weight, or speed." 
        sensor: "1910x1080 @30fps" 
        fov: "90 degrees diagonal with auto focus lens." 
        latency: "127.7ms"
    cartlabel: "World camera: high resolution"
    cartSpecs: "Max resolution: 1910x1080 @30fps. FOV 90 degrees diagonal with auto focus lens. 120ms latency"
    dimensions: 0
    weight: 17 # logitec c930e camera
    img: "../media/images/config_images/pupil-config-world-1080p.jpg"
    video: "#"
    order: 2
  }, {
    id: "world_hs"
    cost: 250
    label: "high speed"
    specs: 
        info: "World camera custom built by Pupil Labs. The fastest,smallest, lightest, and most versatile. We recommend this option for most use cases." 
        sensor: "1920x1080 @30fps, 1280x720 @60fps, 640x480 @120fps"
        fov: "100 degrees diagonal (lenses are exchangeable: purchase alternate lenses below)"
        latency: "5.7ms"
    cartlabel: "World camera: high speed"
    cartSpecs: "Variable Resolution: 1920x1080 @30fps, 1280x720 @60fps, 640x480 @120fps. FOV 100deg diag (lenses are exchangeable: purchase alternate lenses below). 5.7ms latency."
    dimensions: 0
    weight: 5 # 120hz eye camera world, new 
    img: "../media/images/config_images/pupil-config-world-120hz.jpg"
    video: "#"
    order: 3
  }, {
    id: "eye_none"
    cost: 150,
    label: "none"
    specs: 
        info: "No eye camera"
    cartlabel: "Eye camera: no eye camera"    
    cartSpecs: "no eye camera"    
    dimensions: 0
    weight: 26 # 12 headset frame, 2 harness cable, 12 cable clip weight
    img: "../media/images/config_images/pupil-config-eye-none.jpg"
    video: "#"
    order: 1
  }, {
    id: "eye_30hz"
    cost: 550
    label: "30hz"
    specs: 
        info: "Eye camera with the smallest dimensions. Good for fixation detection." 
        sensor: "640x480 @30fps"
        illumination: "IR camera with IR illumination (dark pupil tracking)"
        latency: "35.6ms"
    cartlabel: "Eye camera: 30hz eye camera"    
    cartSpecs: "Resolution: 640x480 @30fps. IR illumination."    
    dimensions: 30 # 12 headset frame, 2 harness cable, 12 cable clip weight, 3 eye camera (add 1g for just in case)
    weight: 300
    img: "../media/images/config_images/pupil-config-eye-30hz.jpg"
    video: "#"
    order: 2
  }, {
    id: "eye_120hz"
    cost: 800
    label: "120hz"
    specs: 
        info: "Eye camera custom built by Pupil Labs that will resolve a wider range of eye movement motifs"
        sensor: "640x480 @120fps"
        illumination: "IR camera with IR illumination (dark pupil tracking)" 
        latency: "5.7ms"
    cartlabel: "Eye camera: 120hz eye camera"    
    cartSpecs: "Resolution: 640x480 @120fps. IR illumination."        
    dimensions: 0
    weight: 31 # 12 headset frame, 2 harness cable, 12 cable clip weight, 4 eye camera (add 1g for just in case)
    img: "../media/images/config_images/pupil-config-eye-120hz.jpg"
    video: "#"
    order: 3
  }, {
    id: "eye_120hz_binocular"
    cost: 1500
    label: "120hz binocular"
    specs: 
        info: "Eye cameras custom built by Pupil Labs with binocular frame for binocular eye detection at high speed. Custom made cameras that will resolve a wider range of eye movement motifs" 
        sensor: "640x480 @120fps"
        illumination: "IR camera with IR illumination (dark pupil tracking)"
        latency: "5.7ms"
    cartlabel: "Eye cameras: 120hz binocular eye cameras"    
    cartSpecs: "2 eye cameras. Resolution: 640x480 @120fps. IR illumination."        
    dimensions: 0
    weight: 40 # 16 headset frame, 2 harness cable, 16 cable clip weight, 2x3 eye camera
    img: "../media/images/config_images/pupil-config-eye-120hz-binocular.jpg"
    video: "#"
    order: 4
  }, {
    id: "product_eye_120hz"
    cost: 250
    label: "120hz eye camera"
    specs: "Upgrade to 120hz camera. A custom made camera that will resolve a wider range of eye movement motifs. IR camera with IR illumination (dark pupil tracking). 640x480 @120fps."
    cartlabel: "Camera upgrade: 120hz eye camera upgrade"   
    cartSpecs: "Resolution: 640x480 @120fps. IR illumination."                     
    dimensions: 0
    weight: 4 #this is an upgrade to 120hz eye camera, weight is only for new 120hz eye camera
    img: "http://placehold.it/800x500/444444"
    video: "#"
    order: 1
  }, {
    id: "product_lens_kit"
    cost: 200
    label: "lens kit"
    specs: "Alternate lenses for 120hz world camera. Wide angle."
    cartlabel: "Lens Kit"            
    cartSpecs: "Lens specs"    
    dimensions: 0
    weight: 300
    img: "http://placehold.it/800x500/444444"
    order: 2
  }, {
    id: "product_support_6"
    cost: 1000
    label: "6 month support contract"
    specs: "6 month support contract. Email support and 4 video support sessions."
    cartlabel: "Support contract"                
    cartSpecs: "6 month support contract. Email support and 4 video support sessions."
    img: "http://placehold.it/800x500/444444"
    order: 3
  }, {
    id: "product_support_12"
    cost: 2000
    label: "12 month support contract"
    specs: "12 month support contract. Email support and 8 video support sessions"
    cartlabel: "Support contract"            
    cartSpecs: "12 month support contract. Email support and 8 video support sessions"
    img: "http://placehold.it/800x500/444444"
    order: 4
  }, {
    id: "license_academic"
    cost: 0
    label: "academic use"
    specs: "for use within an academic (non-commercial) context."
    cartlabel: "Academic Use License" 
    cartSpecs: "Permits use within academic (non-commercial) context. Use license bound to headset."               
  }, {
    id: "license_commercial"
    cost: 590
    label: "commercial use"
    specs: "commercial license is required if use is not academic."
    cartlabel: "Commercial Use License"                
    cartSpecs: "Permits use within a context. Use license bound to headset."               
    order: 1
  }
]
