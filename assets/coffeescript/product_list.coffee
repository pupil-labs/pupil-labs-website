productList_legacy = [
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
      'audio recording': 'Camera built-in stereo microphone.' 
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
      'audio recording': 'via host device microphone.'
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
    order: 5
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
    id: "product_oculus_mono"
    cost: 800
    label: "Oculus Rift DK2 Monocular Add-on Cup"
    specs: "Add eye tracking to your Oculus Rift DK2 with our 120hz monocular eye tracking add-on. Includes one custom lens cup with: IR mirror, IR LEDs, 1 x 120 Hz eye camera, and USB cables."
    cartlabel: "Oculus Rift DK2 Monocular Add-on Cup"            
    cartSpecs: "1 x 120hz eye tracking add-on cup for Oculus Rift DK2. Includes one custom lens cup with: IR mirror, IR LEDs, 1 x 120 Hz eye camera, and USB cables."    
    dimensions: 0
    weight: 20
    img: "../media/images/additional_products/web/addon_oculus_dk2.png"
    order: 1
  }, {
    id: "product_oculus_bi"
    cost: 1400
    label: "Oculus Rift DK2 Binocular Add-on Cups"
    specs: "Add binocular eye tracking to your Oculus Rift DK2 with our 120hz monocular eye tracking add-on. Includes two custom lens cups with: IR mirors, IR LEDs, 2 x 120 Hz eye camera, and USB cables."
    cartlabel: "Oculus Rift DK2 Binocular Add-on"            
    cartSpecs: "2 x 120hz eye tracking add-on cups for Oculus Rift DK2. Includes two custom lens cups with: IR mirors, IR LEDs, 2 x 120 Hz eye camera, and USB cables."    
    dimensions: 0
    weight: 20
    img: "../media/images/additional_products/web/addon_oculus_dk2.png"
    order: 2
  }, {
    id: "product_epson_bi"
    cost: 350
    label: "Epson Moverio BT-200 Binocular Mount Add-on"
    specs: "2 x camera mounts for Epson Moverio BT-200 with cables. Use with 120hz eye camera upgrade or existing 120hz eye camera from Pupil."
    cartlabel: "Epson Moverio BT-200 eye camera mounts"            
    cartSpecs: "2 x camera mounts for Epson Moverio BT-200 with cables for 120hz cameras. Use with 120hz eye camera upgrade or existing 120hz eye camera from Pupil."    
    dimensions: 0
    weight: 20
    img: "../media/images/additional_products/web/addon_epson_bt200a.png"
    order: 3
  }, {
    id: "product_usb_c"
    cost: 210
    label: "USB-C Clip Upgrade"
    specs: "Upgrade any existing Pupil headset with the new USB-C clip. Comes with USB-C to USB-A cable. Recommended for smooth operation with MacBooks and Android devices. (Phillips screw driver required for upgrade)"
    cartlabel: "USB-C Clip Upgrade"            
    cartSpecs: "USB-C clip upgrade for an existing Pupil headset."    
    dimensions: 0
    weight: 20
    img: "../media/images/additional_products/web/usbc-1.png"
    order: 4
  }, {    
    id: "product_support_6"
    cost: 1000
    label: "6 month support contract"
    specs: "Receive dedicated support and training via email and 4 videos support sessions."
    cartlabel: "Support contract"                
    cartSpecs: "6 month support contract. Email support and 4 videos support sessions."
    img: "../media/graphics/web/support_graphic_6mo_alt.svg"
    order: 6
  }, {
    id: "product_support_12"
    cost: 2000
    label: "12 month support contract"
    specs: "Receive dedicated support and training via email and 8 videos support sessions."
    cartlabel: "Support contract"            
    cartSpecs: "12 month support contract. Email support and 8 videos support sessions."
    img: "../media/graphics/web/support_graphic_12mo_alt.svg"
    order: 7
  }, {
    id: "license_academic"
    cost: -590
    label: "academic use"
    specs: "Discount is granted with valid academic institution billing and/or shipping address, or proof of current academic affiliation."
    cartlabel: "Academic Discount" 
    cartSpecs: "For use within an academic (non-commercial) context."               
  }
]

get_world_cam_data = ->
  world_cam_data =
    wnone:
      id: 'wnone'
      title_store: "none"
      description_store: "No world camera"
      title_cart: "World camera: no world camera"
    w30:
      id: 'w30'
      title_store: "high resolution"
      description_store: "World camera with beautiful image quality. We recommend this option when you want aesthetically pleasing footage, and are not concerned with size, weight, or speed."
      specs_sensor: "1910x1080 @30fps"
      specs_fov: "90 degrees diagonal with auto focus lens." 
      specs_latency: "127.7ms"
      specs_audio: "Record audio with built-in stereo microphone"
      title_cart: "World camera: high resolution"
      description_cart: "Max resolution: 1910x1080 @30fps. FOV 90 degrees diagonal with auto focus lens. 120ms latency."
      weight: 17
      title_video: "Download sample videos"
      link_video: "https://drive.google.com/file/d/0B4Q4b_aBOfU-QW1ncXpkdS02R1k/view?usp=sharing"
    w120:
      id: 'w120'
      title_store: "high speed"
      description_store: "World camera custom built by Pupil Labs. The fastest, smallest, lightest, and most versatile. We recommend this option for most use cases."
      specs_sensor: "1920x1080 @30fps, 1280x720 @60fps, 640x480 @120fps"
      specs_fov: "100 degrees diagonal. Lenses are exchangeable: Headset ships with 60deg and 100 deg FOV lenses."
      specs_latency: "5.7ms"
      specs_audio: "Record audio via host device microphone"
      title_cart: "World camera: high speed"
      description_cart: "Variable Resolution: 1920x1080 @30fps, 1280x720 @60fps, 640x480 @120fps. FOV 100 degrees diagonal. Lenses are exchangeable: Headset ships with 60deg and 100 deg FOV lenses. 5.7ms latency."
      weight: 5
      title_video: "Download sample videos"
      link_video: "https://drive.google.com/file/d/0B4Q4b_aBOfU-TmJvSFhFeWp1NEk/view?usp=sharing"

  return world_cam_data

get_world_cam_ids = ->
  return (k for k,v of get_world_cam_data())

console.log get_world_cam_ids()

get_eye_cam_data = ->
  eye_cam_data = 
    enone:
      id: 'enone'
      title_store: "none"
      title_cart: "Eye camera: no eye camera"
      weight: 26
    e30:
      id: 'e30'
      title_store: "30hz"
      description_store: "Eye camera with the smallest dimensions. Good for fixation detection."
      specs_sensor: "640x480 @30fps"
      specs_illumination: "IR camera with IR illumination (dark pupil tracking)"
      specs_latency: "35.6ms"
      title_cart: "Eye camera: 30hz eye camera"
      description_cart: "Resolution: 640x480 @30fps. IR illumination."
      weight: 30
      title_video: "Download sample video"
      link_video: "https://drive.google.com/file/d/0B4Q4b_aBOfU-N1FOOWVVVHUtVUE/view?usp=sharing"
    e120:
      id: 'e120'
      title_store: "120hz"
      description_store: "Eye camera custom built by Pupil Labs that will resolve a wider range of eye movement motifs"
      specs_sensor: "640x480 @120fps"
      specs_illumination: "IR camera with IR illumination (dark pupil tracking)"
      specs_latency: "5.7ms"
      title_cart: "Eye camera: 120hz eye camera"
      description_cart: "Resolution: 640x480 @120fps. IR illumination."
      weight: 31
      title_video: "Download sample video"
      link_video: "https://drive.google.com/file/d/0B4Q4b_aBOfU-OEVUcVlURFJzdkU/view?usp=sharing"
    e120b:
      id: 'e120b'
      title_store: "120hz binocular"
      description_store: "Eye cameras custom built by Pupil Labs with binocular frame for binocular eye detection at high speed. Custom made cameras that will resolve a wider range of eye movement motifs"
      specs_sensor: "640x480 @120fps"
      specs_illumination: "IR camera with IR illumination (dark pupil tracking)"
      specs_latency: "5.7ms"
      title_cart: "Eye cameras: 120hz binocular eye cameras"
      description_cart: "2 eye cameras. Resolution: 640x480 @120fps. IR illumination."
      weight: 43
      title_video: "Download sample video"
      link_video: "https://drive.google.com/file/d/0B4Q4b_aBOfU-OEVUcVlURFJzdkU/view?usp=sharing"

get_edu_discount_data = ->
  edu_discount_data = 
    id: 'edu'
    title_cart: "Academic Discount"
    description_cart: "For use within an academic (non-commercial) context."

get_vr_ar_product_ids = ->
  return ['oculusdk2m','oculusdk2b','epsonbt200b']

get_additional_product_ids = ->
  return ['e120upgrade','support6','support12','usbcupgrade']

get_product_database = ->
  world_cam_data = get_world_cam_data()
  eye_cam_data = get_eye_cam_data()
  edu_discount = get_edu_discount_data()

  product_db = 
    pupil_wnone_e30:
      cost: 1140
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.wnone 
        eye_camera: eye_cam_data.e30
    pupil_wnone_e120:
      cost: 1390
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.wnone
        eye_camera: eye_cam_data.e120
    pupil_wnone_e120b:
      cost: 2090
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.wnone
        eye_camera: eye_cam_data.e120b
    pupil_wnone_e30_edu:
      cost: 550
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.wnone
        eye_camera: eye_cam_data.e30
        discount: edu_discount
    pupil_wnone_e120_edu:
      cost: 800
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.wnone
        eye_camera: eye_cam_data.e120
        discount: edu_discount
    pupil_wnone_e120b_edu:
      cost: 1500
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.wnone
        eye_camera: eye_cam_data.e120b
        discount: edu_discount
    pupil_w30_enone:
      cost: 990
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w30
        eye_camera: eye_cam_data.enone
    pupil_w30_e30:
      cost: 1390
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w30
        eye_camera: eye_cam_data.e30
    pupil_w30_e120:
      cost: 1640
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w30
        eye_camera: eye_cam_data.e120
    pupil_w30_enone_edu:
      cost: 400
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w30
        eye_camera: eye_cam_data.enone
        discount: edu_discount
    pupil_w30_e30_edu:
      cost: 800
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w30
        eye_camera: eye_cam_data.e30
        discount: edu_discount
    pupil_w30_e120_edu:
      cost: 1050
      title_product: 'Pupil Headset'
      description: 'World camera: high resolution 30hz world camera\nEye camera: 120hz eye camera\nAcademic discount'
      sub_products:
        world_camera: world_cam_data.w30
        eye_camera: eye_cam_data.e120
        discount: edu_discount
    pupil_w120_enone:
      cost: 990
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w120
        eye_camera: eye_cam_data.enone
    pupil_w120_e30:
      cost: 1390
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w120
        eye_camera: eye_cam_data.e30
        discount: edu_discount
    pupil_w120_e120:
      cost: 1640
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w120
        eye_camera: eye_cam_data.e120
    pupil_w120_e120b:
      cost: 2340
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w120
        eye_camera: eye_cam_data.e120b
    pupil_w120_enone_edu:
      cost: 400
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w120
        eye_camera: eye_cam_data.enone
        discount: edu_discount
    pupil_w120_e30_edu:
      cost: 800
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w120
        eye_camera: eye_cam_data.e30
        discount: edu_discount
    pupil_w120_e120_edu:
      cost: 1050
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w120
        eye_camera: eye_cam_data.e120
        discount: edu_discount
    pupil_w120_e120b_edu:
      cost: 1750
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w120
        eye_camera: eye_cam_data.e120b
        discount: edu_discount
    oculusdk2m:
      cost: 800
      title_product: 'Oculus Rift DK2 Add-on'
      title_store: 'Oculus Rift DK2 Monocular Add-on Cup'
      description_store: "Add eye tracking to your Oculus Rift DK2 with our 120hz monocular eye tracking add-on. Includes one custom lens cup with: IR mirror, IR LEDs, 1 x 120 Hz eye camera, and USB cables."
      description_cart: "Monocular Oculus Rift DK2 add-on cup with 1 x 120hz eye camera."
    oculusdk2b:
      cost: 1400
      title_product: 'Oculus Rift DK2 Add-on'
      title_store: 'Oculus Rift DK2 Binocular Add-on Cup'
      description_store: "Add binocular eye tracking to your Oculus Rift DK2 with our 120hz binocular eye tracking add-on. Includes two custom lens cups with: IR mirror, IR LEDs, 2 x 120 Hz eye cameras, and USB cables."
      description_cart: "Binocular Oculus Rift DK2 add-on cup with 2 x 120hz eye camera."
    epsonbt200b:
      cost: 350
      title_product: 'Epson Moverio BT-200 eye camera mounts'
      title_store: 'Epson Moverio BT-200 Binocular Mount Add-on'
      description_store: "Binocular camera mounts for Epson Moverio BT-200 with USB cables. Use with the 120hz eye camera upgrades or existing 120hz eye cameras from a Pupil headset."
      description_cart: "Binocular camera mounts for Epson Moverio BT-200 with USB cables. Use with the 120hz eye camera upgrades or existing 120hz eye cameras from a Pupil headset."
    e120upgrade:
      cost: 450
      title_product: '120hz Eye Camera'
      title_store: "120hz Eye Camera"
      description_store: "Upgrade any existing Pupil headset with our custom made 120hz camera. This is a drop-in replacement. No tools needed. For more info, check out the camera specs in the configurator above."
      description_cart: "Camera upgrade: 120hz eye camera upgrade"
    support6:
      cost: 1000
      title_product: 'Support Contract'
      title_product: '6 Month Support Contract'
      description_store: '6 month support contract. 4 video support sessions and email support.'
      description_cart: '6 month support contract. 4 video support sessions and email support.'
    support12:
      cost: 2000
      title_product: 'Support Contract'
      title_product: '12 Month Support Contract'
      description_store: '12 month support contract. 4 video support sessions and email support.'
      description_cart: '12 month support contract. 4 video support sessions and email support.'
    usbcupgrade:
      cost: 210
      title_product: 'USB-C Clip Upgrade'
      title_store: 'USB-C Clip Upgrade'
      description_store: 'Upgrade any existing Pupil headset with the new USB-C clip. Comes with USB-C to USB-A cable.'
      description_store: 'USB-C clip upgrade for an existing Pupil Headset. Comes with USB-C to USB-A cable.'

  return product_db

