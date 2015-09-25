productList = [
  {
    id: "world_none"
    cost: 0
    label: "none"
    specs:
      info: "No World camera"
    cartlabel: "World camera: no world camera"
    cartSpecs: "No world camera"
    dimensions: 0
    weight: 0
    img: "../media/images/config_images/pupil-config-world-none.jpg"
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
      # audio_recording: 'Camera built-in stereo microphone.' 
    cartlabel: "World camera: high resolution"
    cartSpecs: "Max resolution: 1910x1080 @30fps. FOV 90 degrees diagonal with auto focus lens. 120ms latency"
    dimensions: 0
    weight: 17 # logitec c930e camera
    img: "../media/images/config_images/pupil-config-world-1080p.jpg"
    videos: [
      {
        title: "Download sample videos",
        link: "https://drive.google.com/file/d/0B4Q4b_aBOfU-QW1ncXpkdS02R1k/view?usp=sharing"
      }
    ]
    order: 2
  }, {
    id: "world_hs"
    cost: 250
    label: "high speed"
    specs: 
      info: "World camera custom built by Pupil Labs. The fastest,smallest, lightest, and most versatile. We recommend this option for most use cases." 
      sensor: "1920x1080 @30fps, 1280x720 @60fps, 640x480 @120fps"
      fov: "100 degrees diagonal. Lenses are exchangeable: Headset ships with 60deg and 100 deg FOV lenses."
      latency: "5.7ms"
      # audio_recording: 'via host device microphone.'
    cartlabel: "World camera: high speed"
    cartSpecs: "Variable Resolution: 1920x1080 @30fps, 1280x720 @60fps, 640x480 @120fps. FOV 100 degrees diagonal. Lenses are exchangeable: Headset ships with 60deg and 100 deg FOV lenses. 5.7ms latency."
    dimensions: 0
    weight: 5 # 120hz eye camera world, new 
    img: "../media/images/config_images/pupil-config-world-120hz.jpg"
    videos: [
      {
        title: "Download sample videos",
        link: "https://drive.google.com/file/d/0B4Q4b_aBOfU-TmJvSFhFeWp1NEk/view?usp=sharing"
      }
    ]
    order: 3
  }, {
    id: "eye_none"
    cost: 740,
    label: "none"
    specs: 
      info: "No eye camera"
    cartlabel: "Eye camera: no eye camera"    
    cartSpecs: "no eye camera"    
    dimensions: 0
    weight: 26 # 12 headset frame, 2 harness cable, 12 cable clip weight
    img: "../media/images/config_images/pupil-config-eye-none.jpg"
    order: 1
  }, {
    id: "eye_30hz"
    cost: 1140
    label: "30hz"
    specs: 
      info: "Eye camera with the smallest dimensions. Good for fixation detection." 
      sensor: "640x480 @30fps"
      illumination: "IR camera with IR illumination (dark pupil tracking)"
      latency: "35.6ms"
    cartlabel: "Eye camera: 30hz eye camera"    
    cartSpecs: "Resolution: 640x480 @30fps. IR illumination."    
    dimensions: 0 # 12 headset frame, 2 harness cable, 12 cable clip weight, 3 eye camera (add 1g for just in case)
    weight: 30
    img: "../media/images/config_images/pupil-config-eye-30hz.jpg"
    videos: [
      {
        title: "Download sample video",
        link: "https://drive.google.com/file/d/0B4Q4b_aBOfU-N1FOOWVVVHUtVUE/view?usp=sharing"
      }
    ]
    order: 2
  }, {
    id: "eye_120hz"
    cost: 1390 
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
    videos: [
      {
        title: "Download sample video",
        link: "https://drive.google.com/file/d/0B4Q4b_aBOfU-OEVUcVlURFJzdkU/view?usp=sharing"
      }
    ]      
    order: 3
  }, {
    id: "eye_120hz_binocular"
    cost: 2090 # incl license 1500+590 = 
    label: "120hz binocular"
    specs: 
      info: "Eye cameras custom built by Pupil Labs with binocular frame for binocular eye detection at high speed. Custom made cameras that will resolve a wider range of eye movement motifs" 
      sensor: "640x480 @120fps"
      illumination: "IR camera with IR illumination (dark pupil tracking)"
      latency: "5.7ms"
    cartlabel: "Eye cameras: 120hz binocular eye cameras"    
    cartSpecs: "2 eye cameras. Resolution: 640x480 @120fps. IR illumination."        
    dimensions: 0
    weight: 43 # 16 headset frame, 2 harness cable, 19 cable clip weight, 2x3 eye camera
    img: "../media/images/config_images/pupil-config-eye-120hz-binocular.jpg"
    videos: [
      {
        title: "Download sample video",
        link: "https://drive.google.com/file/d/0B4Q4b_aBOfU-OEVUcVlURFJzdkU/view?usp=sharing"
      }
    ]  
    order: 4
  }, {
    id: "product_eye_120hz"
    cost: 450
    label: "120hz eye camera"
    specs: "Upgrade any existing Pupil headset with our custom made 120hz camera. This is a drop-in replacement. No tools needed. For more info, check out the camera specs in the configurator above."
    cartlabel: "Camera upgrade: 120hz eye camera upgrade"   
    cartSpecs: "Resolution: 640x480 @120fps. IR illumination."                     
    dimensions: 0
    weight: 4 #this is an upgrade to 120hz eye camera, weight is only for new 120hz eye camera
    img: "../media/images/additional_products/web/hs_cam.png"
    videos: [
      {
        title: "Download sample video",
        link: "https://drive.google.com/file/d/0B4Q4b_aBOfU-OEVUcVlURFJzdkU/view?usp=sharing"
      }
    ]  
    order: 1
  }, {
    id: "product_pupil_dev"
    cost: 380
    label: "Pupil Dev"
    specs: "Pupil Dev Headset. Entry level eye tracking headset. Exposed camera boards. Eye camera is not adjustable."
    cartlabel: "Pupil Dev"            
    cartSpecs: "Entry level eye tracking headset."    
    dimensions: 0
    weight: 100
    img: "../media/images/additional_products/web/dev_iso.png"
    order: 0
  }, {
    id: "product_support_6"
    cost: 1000
    label: "6 month support contract"
    specs: "Receive dedicated support and training via email and 4 videos support sessions."
    cartlabel: "Support contract"                
    cartSpecs: "6 month support contract. Email support and 4 videos support sessions."
    img: "../media/graphics/web/support_graphic_6mo_alt.svg"
    order: 3
  }, {
    id: "product_support_12"
    cost: 2000
    label: "12 month support contract"
    specs: "Receive dedicated support and training via email and 8 videos support sessions."
    cartlabel: "Support contract"            
    cartSpecs: "12 month support contract. Email support and 8 videos support sessions."
    img: "../media/graphics/web/support_graphic_12mo_alt.svg"
    order: 4
  }, {
    id: "license_academic"
    cost: -590
    label: "academic use"
    specs: "Discount is granted with valid academic institution billing and/or shipping address, or proof of current academic affiliation."
    cartlabel: "Academic Discount" 
    cartSpecs: "For use within an academic (non-commercial) context."               
  }
]
