get_world_cam_data = ->
  world_cam_data =
    wnone:
      id: 'wnone'
      title_store: "none"
      description_store: "No world camera"
      title_cart: "World camera: no world camera"
      description_cart: "No world camera"
      weight: 0
    w30:
      id: 'w30'
      title_store: "high resolution"
      description_store: "World camera with beautiful image quality. We recommend this option when you want aesthetically pleasing footage, and are not concerned with size, weight, or speed."
      tech_specs:
        sensor: "1910x1080 @30fps"
        fov: "90 degrees diagonal with auto focus lens." 
        latency: "127.7ms"
        audio: "Record audio with built-in stereo microphone"
      title_cart: "World camera: high resolution"
      description_cart: "Max resolution: 1910x1080 @30fps. FOV 90 degrees diagonal with auto focus lens. 120ms latency."
      weight: 17
      title_video: "Download sample videos"
      link_video: "https://drive.google.com/file/d/0B4Q4b_aBOfU-QW1ncXpkdS02R1k/view?usp=sharing"
    w120:
      id: 'w120'
      title_store: "high speed"
      description_store: "World camera custom built by Pupil Labs. The fastest, smallest, lightest, and most versatile. We recommend this option for most use cases."
      tech_specs:
        sensor: "1920x1080 @30fps, 1280x720 @60fps, 640x480 @120fps"
        fov: "100 degrees diagonal. Lenses are exchangeable: Headset ships with 60deg and 100 deg FOV lenses."
        latency: "5.7ms"
        audio: "Record audio via host device microphone"
      title_cart: "World camera: high speed"
      description_cart: "Variable Resolution: 1920x1080 @30fps, 1280x720 @60fps, 640x480 @120fps. FOV 100 degrees diagonal. Lenses are exchangeable: Headset ships with 60deg and 100 deg FOV lenses. 5.7ms latency."
      weight: 5
      title_video: "Download sample videos"
      link_video: "https://drive.google.com/file/d/0B4Q4b_aBOfU-TmJvSFhFeWp1NEk/view?usp=sharing"
    w3d:
      id: 'w3d'
      title_store: '3d'
      description_store: "Intel RealSense R200 RGBD camera. Provides depth image and monocular RGB color image."
      tech_specs:
        sensor: "See <a href='https://software.intel.com/sites/default/files/managed/d7/a9/realsense-camera-r200-product-datasheet.pdf' target='_blank' rel='nofollow'>Intel R200 data sheet</a> for details"
        fov:"See <a href='https://software.intel.com/sites/default/files/managed/d7/a9/realsense-camera-r200-product-datasheet.pdf' target='_blank' rel='nofollow'>Intel R200 data sheet</a> for details"
        latency: "See <a href='https://software.intel.com/sites/default/files/managed/d7/a9/realsense-camera-r200-product-datasheet.pdf' target='_blank' rel='nofollow'>Intel R200 data sheet</a> for details"
        audio: "Record audio via host device microphone"
      title_cart: "World Camera: 3d"
      description_cart: "Intel RealSense R200. Provides stereo RGB images and depth image."
      weight: 17
      title_video: "Download sample video"
      link_video: "https://drive.google.com/file/d/0Byap58sXjMVfRi13ZUo2MkJTWUE/view?usp=sharing"



  return world_cam_data


get_eye_cam_data = ->
  eye_cam_data = 
    enone:
      id: 'enone'
      title_store: "none"
      title_cart: "Eye camera: no eye camera"
      description_store: "No eye camera"
      description_cart: "No eye camera"
      weight: 26
    e30:
      id: 'e30'
      title_store: "30hz"
      description_store: "Eye camera with the smallest dimensions. Good for fixation detection."
      tech_specs:
        sensor: "640x480 @30fps"
        illumination: "IR camera with IR illumination (dark pupil tracking)"
        latency: "35.6ms"
      title_cart: "Eye camera: 30hz eye camera"
      description_cart: "Resolution: 640x480 @30fps. IR illumination."
      weight: 30
      title_video: "Download sample video"
      link_video: "https://drive.google.com/file/d/0B4Q4b_aBOfU-N1FOOWVVVHUtVUE/view?usp=sharing"
    e120:
      id: 'e120'
      title_store: "120hz"
      description_store: "Eye camera custom built by Pupil Labs that will resolve a wider range of eye movement motifs"
      tech_specs:
        sensor: "640x480 @120fps"
        illumination: "IR camera with IR illumination (dark pupil tracking)"
        latency: "5.7ms"
      title_cart: "Eye camera: 120hz eye camera"
      description_cart: "Resolution: 640x480 @120fps. IR illumination."
      weight: 31
      title_video: "Download sample video"
      link_video: "https://drive.google.com/file/d/0B4Q4b_aBOfU-OEVUcVlURFJzdkU/view?usp=sharing"
    e120b:
      id: 'e120b'
      title_store: "120hz binocular"
      description_store: "Eye cameras custom built by Pupil Labs with binocular frame for binocular eye detection at high speed. Custom made cameras that will resolve a wider range of eye movement motifs"
      tech_specs:
        sensor: "640x480 @120fps"
        illumination: "IR camera with IR illumination (dark pupil tracking)"
        latency: "5.7ms"
      title_cart: "Eye cameras: 120hz binocular eye cameras"
      description_cart: "2 eye cameras. Resolution: 640x480 @120fps. IR illumination."
      weight: 43
      title_video: "Download sample video"
      link_video: "https://drive.google.com/file/d/0B4Q4b_aBOfU-OEVUcVlURFJzdkU/view?usp=sharing"

get_camera_data = ->
  camera_data = get_eye_cam_data()
  for k,v of get_world_cam_data()
    camera_data[k] = v
  return camera_data

get_world_cam_ids = ->
  return (k for k,v of get_world_cam_data())

get_eye_cam_ids = ->
  return (k for k,v of get_eye_cam_data() when k isnt 'e30')

get_edu_discount_data = ->
  edu_discount_data = 
    id: 'edu'
    title_cart: "Academic Discount"
    description_cart: "For use within an academic (non-commercial) context."

get_vr_ar_product_ids = ->
  return ['hololens_w120_e120b','htcviveb','oculusdk2b','oculusdk2m','epsonbt300b','epsonbt200b']

get_additional_product_ids = ->
  return ['e120upgrade','usbcupgrade','pm_motoz2','support6','support12']


get_product_database = ->
  world_cam_data = get_world_cam_data()
  eye_cam_data = get_eye_cam_data()
  edu_discount = get_edu_discount_data()
  pupil_img_path = "../media/images/store_pupil/web"
  vr_ar_img_path = "../media/images/store_vr_ar"
  additional_product_path = "../media/images/store_additional_products" 

  product_db = 
    pupil_wnone_e30:
      cost: 1140
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.wnone 
        eye_camera: eye_cam_data.e30
      img: [pupil_img_path,'pupil_wnone_e30.jpg'].join('/')
    pupil_wnone_e120:
      cost: 1390
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.wnone
        eye_camera: eye_cam_data.e120
      img: [pupil_img_path,'pupil_wnone_e120.jpg'].join('/')     
    pupil_wnone_e120b:
      cost: 2090
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.wnone
        eye_camera: eye_cam_data.e120b
      img: [pupil_img_path,'pupil_wnone_e120b.jpg'].join('/')     
    pupil_wnone_e30_edu:
      cost: 550
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.wnone
        eye_camera: eye_cam_data.e30
        discount: edu_discount
      img: [pupil_img_path,'pupil_wnone_e30.jpg'].join('/')     
    pupil_wnone_e120_edu:
      cost: 800
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.wnone
        eye_camera: eye_cam_data.e120
        discount: edu_discount
      img: [pupil_img_path,'pupil_wnone_e120.jpg'].join('/')        
    pupil_wnone_e120b_edu:
      cost: 1500
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.wnone
        eye_camera: eye_cam_data.e120b
        discount: edu_discount
      img: [pupil_img_path,'pupil_wnone_e120b.jpg'].join('/')        
    pupil_w30_enone:
      cost: 1190
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w30
        eye_camera: eye_cam_data.enone
      img: [pupil_img_path,'pupil_w30_enone.jpg'].join('/')
    pupil_w30_e30:
      cost: 1390
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w30
        eye_camera: eye_cam_data.e30
      img: [pupil_img_path,'pupil_w30_e30.jpg'].join('/')
    pupil_w30_e120:
      cost: 1640
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w30
        eye_camera: eye_cam_data.e120
      img: [pupil_img_path,'pupil_w30_e120.jpg'].join('/')
    pupil_w30_enone_edu:
      cost: 600
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w30
        eye_camera: eye_cam_data.enone
        discount: edu_discount
      img: [pupil_img_path,'pupil_w30_enone.jpg'].join('/')
    pupil_w30_e30_edu:
      cost: 800
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w30
        eye_camera: eye_cam_data.e30
        discount: edu_discount
      img: [pupil_img_path,'pupil_w30_e30.jpg'].join('/')
    pupil_w30_e120_edu:
      cost: 1050
      title_product: 'Pupil Headset'
      description: 'World camera: high resolution 30hz world camera\nEye camera: 120hz eye camera\nAcademic discount'
      sub_products:
        world_camera: world_cam_data.w30
        eye_camera: eye_cam_data.e120
        discount: edu_discount
      img: [pupil_img_path,'pupil_w30_e120.jpg'].join('/')
    pupil_w120_enone:
      cost: 1190
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w120
        eye_camera: eye_cam_data.enone
      img: [pupil_img_path,'pupil_w120_enone.jpg'].join('/')
    pupil_w120_e30:
      cost: 1390
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w120
        eye_camera: eye_cam_data.e30
        discount: edu_discount
      img: [pupil_img_path,'pupil_w120_e30.jpg'].join('/')
    pupil_w120_e120:
      cost: 1640
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w120
        eye_camera: eye_cam_data.e120
      img: [pupil_img_path,'pupil_w120_e120.jpg'].join('/')
    pupil_w120_e120b:
      cost: 2340
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w120
        eye_camera: eye_cam_data.e120b
      img: [pupil_img_path,'pupil_w120_e120b.jpg'].join('/')        
    pupil_w120_enone_edu:
      cost: 600
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w120
        eye_camera: eye_cam_data.enone
        discount: edu_discount
      img: [pupil_img_path,'pupil_w120_enone.jpg'].join('/')
    pupil_w120_e30_edu:
      cost: 800
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w120
        eye_camera: eye_cam_data.e30
        discount: edu_discount
      img: [pupil_img_path,'pupil_w120_e30.jpg'].join('/')        
    pupil_w120_e120_edu:
      cost: 1050
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w120
        eye_camera: eye_cam_data.e120
        discount: edu_discount
      img: [pupil_img_path,'pupil_w120_e120.jpg'].join('/')        
    pupil_w120_e120b_edu:
      cost: 1750
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w120
        eye_camera: eye_cam_data.e120b
        discount: edu_discount
      img: [pupil_img_path,'pupil_w120_e120b.jpg'].join('/')

    pupil_w3d_enone:
      cost: 1540
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w3d
        eye_camera: eye_cam_data.enone
      img: [pupil_img_path,'pupil_w3d_enone.jpg'].join('/') 
    pupil_w3d_e120:
      cost: 1990
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w3d
        eye_camera: eye_cam_data.e120
      img: [pupil_img_path,'pupil_w3d_e120.jpg'].join('/') 
    pupil_w3d_e120b:
      cost: 2690
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w3d
        eye_camera: eye_cam_data.e120b
      img: [pupil_img_path,'pupil_w3d_e120b.jpg'].join('/')   

    pupil_w3d_enone_edu:
      cost: 950
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w3d
        eye_camera: eye_cam_data.enone
        discount: edu_discount
      img: [pupil_img_path,'pupil_w3d_enone.jpg'].join('/') 
    pupil_w3d_e120_edu:
      cost: 1400
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w3d
        eye_camera: eye_cam_data.e120
        discount: edu_discount
      img: [pupil_img_path,'pupil_w3d_e120.jpg'].join('/') 
    pupil_w3d_e120b_edu:
      cost: 2100
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w3d
        eye_camera: eye_cam_data.e120b
        discount: edu_discount
      img: [pupil_img_path,'pupil_w3d_e120b.jpg'].join('/')  

    oculusdk2m:
      cost: 800
      title_product: 'Oculus Rift DK2 Add-on'
      title_store: 'Oculus Rift DK2 Monocular Add-on Cup'
      description_store: "Add eye tracking to your Oculus Rift DK2 with our 120hz monocular eye tracking add-on. Includes one custom lens cup with: IR mirror, IR LEDs, 1 x 120 Hz eye camera, and USB cables."
      description_cart: "Monocular Oculus Rift DK2 add-on cup with 1 x 120hz eye camera."
      img: [vr_ar_img_path,'oculusdk2m.jpg'].join('/')
    oculusdk2b:
      cost: 1400
      title_product: 'Oculus Rift DK2 Add-on'
      title_store: 'Oculus Rift DK2 Binocular Add-on Cup'
      description_store: "Add binocular eye tracking to your Oculus Rift DK2 with our 120hz binocular eye tracking add-on. Includes two custom lens cups with: IR mirror, IR LEDs, 2 x 120 Hz eye cameras, and USB cables."
      description_cart: "Binocular Oculus Rift DK2 add-on cup with 2 x 120hz eye camera."
      img: [vr_ar_img_path,'oculusdk2m.jpg'].join('/')
    epsonbt200b:
      cost: 550
      title_product: 'Epson Moverio BT-200 Eye Camera Mounts'
      title_store: 'Epson Moverio BT-200 Binocular Mount Add-on'
      description_store: "Binocular camera mounts for Epson Moverio BT-200 with USBC Clip. Use with the 120hz eye camera upgrades or existing 120hz eye cameras from a Pupil headset."
      description_cart: "Binocular camera mounts for Epson Moverio BT-200 with USBC Clip. Use with the 120hz eye camera upgrades or existing 120hz eye cameras from a Pupil headset."
      img: [vr_ar_img_path,'epsonbt200b.jpg'].join('/')   
    epsonbt300b:
      cost: 550
      title_product: 'Epson Moverio BT-300 Eye Camera Mounts'
      title_store: 'Epson Moverio BT-300 Binocular Mount Add-on'
      description_store: "Binocular camera mounts for Epson Moverio BT-300 with USBC clip. Use with the 120hz eye camera upgrades or existing 120hz eye cameras from a Pupil headset."
      description_cart: "Binocular camera mounts for Epson Moverio BT-200 with USBC clip. Use with the 120hz eye camera upgrades or existing 120hz eye cameras from a Pupil headset."
      img: [vr_ar_img_path,'addon_epson_bt300b.jpg'].join('/')         
    htcviveb:
      cost: 1400
      title_product: 'HTC Vive Binocular Add-on'
      title_store: 'HTC Vive Binocular Add-on'
      description_store: "Add binocular eye tracking to your HTC Vive VR Headset. Includes binocular 120hz eye tracking cameras, clip-on attachment rings with IR illuminators and USB connector clip. No tools required!"
      description_cart: "120hz binocular eye tracking add-on for your HTC Vive VR Headset."
      img: [vr_ar_img_path,'htcviveb.jpg'].join('/')   
    hololens_w120_e120b:
      cost: 1750
      title_product: 'HoloLens Binocular Add-on'
      title_store: 'HoloLens Binocular Add-on'
      description_store: "Add binocular eye tracking to your Microsoft HoloLens AR headset. Includes binocular 120hz eye tracking cameras, high speed world camera, clip on attachment mounts, and USB connector clip."
      description_cart: "120hz binocular eye tracking add-on with high speed world camera for your Microsoft HoloLens AR headset."
      img: [vr_ar_img_path,'addon_hololens.jpg'].join('/')   
    hololens_wnone_e120b:
      cost: 1400
      title_product: 'HoloLens Binocular Add-on'
      title_store: 'HoloLens Binocular Add-on'
      description_store: "Add binocular eye tracking to your Microsoft HoloLens AR headset. Includes binocular 120hz eye tracking cameras, clip on attachment mounts, and USB connector clip."
      description_cart: "120hz binocular eye tracking add-on for your Microsoft HoloLens AR headset."
      img: [vr_ar_img_path,'addon_hololens.jpg'].join('/')   
    usbcupgrade:
      cost: 210
      title_product: 'USB-C Clip Upgrade'
      title_store: 'USB-C Clip Upgrade'
      description_store: 'Upgrade any existing Pupil headset with the new USB-C clip. Comes with USB-C to USB-A cable.'
      description_cart: 'USB-C clip upgrade for an existing Pupil Headset. Comes with USB-C to USB-A cable.'
      img: [additional_product_path,'usbcupgrade.jpg'].join('/')         
    e120upgrade:
      cost: 450
      title_product: '120hz Eye Camera'
      title_store: "120hz Eye Camera"
      description_store: "Upgrade any existing Pupil headset with our custom made 120hz camera. This is a drop-in replacement. No tools needed. For more info, check out the camera specs in the configurator above."
      description_cart: "Camera upgrade: 120hz eye camera upgrade"
      img: [additional_product_path,'e120upgrade.jpg'].join('/')   
    w3dupgrade:
      cost: 550
      title_product: '3d World Camera'
      title_store: "3d World Camera"
      description_store: "Upgrade any existing Pupil headset with a 3d world camera. Intel RealSense R200 RGBD camera. Provides stereo RGB images and depth image. For more info, check out the camera specs in the configurator above. Ships with USB connector cable."
      description_cart: "World camera: Intel RealSense R200 RGBD camera. Provides stereo RGB images and depth image."
      img: [additional_product_path,'w3dupgrade.jpg'].join('/')   
    pm_nexus5x:
      cost: 350
      title_product: 'Pupil Mobile Bundle'
      title_store: "Pupil Mobile Bundle"
      description_store: "Connect your Pupil headset to the Nexus 5x. Record video locally on the Nexus 5x, or stream video over Wifi. The Nexus 5x comes with a sports arm band, USBC-USBC cable, and is pre-loaded with the Pupil Mobile app. "
      description_cart: "Nexus 5x pre-loaded with Pupil Mobile app, sports arm band, and USBC-USBC cable. Connects to Pupil headsets via USBC-USBC cable."
      img: [additional_product_path,'pm_nexus5x.jpg'].join('/')   
    pm_motoz2:
      cost: 650
      title_product: 'Pupil Mobile Bundle'
      title_store: "Pupil Mobile Bundle"
      description_store: "Connect your Pupil headset to the Moto Z2 play. Record up to 4 hours of video locally on the phone, or stream video and sensor data over Wifi. The bundle comes with: Moto Z2 Play (black), hot-swappable Moto power pack, 64gb SD card, USBC-USBC cable, and is pre-loaded with the Pupil Mobile app."
      description_cart: "Moto Z2 Play (black), hot-swappable Moto power pack, 64gb SD card, USBC-USBC cable, and is pre-loaded with the Pupil Mobile app. Connects to Pupil headset via USBC cable (included)."
      img: [additional_product_path,'pm_nexus5x.jpg'].join('/')   
    support6:
      cost: 1000
      title_product: 'Support Contract'
      title_store: '6 Month Support Contract'
      description_store: '6 month support contract. 3 one hour video support sessions and email support.'
      description_cart: '6 month support contract. 3 one hour video support sessions and email support.'
      img: [additional_product_path,'support6.svg'].join('/')   
    support12:
      cost: 2000
      title_product: 'Support Contract'
      title_store: '12 Month Support Contract'
      description_store: '12 month support contract. 7 one hour video support sessions and email support.'
      description_cart: '12 month support contract. 7 one hour video support sessions and email support.'
      img: [additional_product_path,'support12.svg'].join('/')   

  return product_db



updateLegacyProductIds_ = (ids) ->
  # list of product ids
  map = 
    world_none: 'pupil_wnone'
    world_hr: 'pupil_w30'
    world_hs: 'pupil_w120'
    eye_none: 'enone'
    eye_30hz: 'e30'
    eye_120hz: 'e120'
    eye_120hz_binocular: 'e120b'
    product_eye_120hz: 'e120upgrade'
    product_oculus_mono: 'oculusdk2m'
    product_oculus_bi: 'oculusdk2b'
    product_epson_bi: 'epsonbt200b'
    product_support_6: 'support6'
    product_support_12: 'support12'
    license_academic: 'edu'
    product_usb_c: 'usbcupgrade'
    product_htc_vive_bi: 'htcviveb'
    w3dupgrade: 'w3dupgrade'
  res = []
  i = 0
  while i < ids.length
    if ids[i] of map
      res.push map[ids[i]]
    i++
  res.join '_'


get_config_images = ->
  db = get_product_database()
  return (db[k]['img'] for k of db when k.split("_").length == 3) 
