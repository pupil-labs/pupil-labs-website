get_world_cam_data = ->
  world_cam_data =
    wnone:
      id: 'wnone'
      title_store: "none"
      description_store: "No world camera"
      title_cart: "World camera: no world camera"
      description_cart: "No world camera"
      weight: 0
    # w30:
    #   id: 'w30'
    #   title_store: "high resolution"
    #   description_store: "World camera with beautiful image quality. We recommend this option when you want aesthetically pleasing footage, and are not concerned with size, weight, or speed."
    #   tech_specs:
    #     sensor: "1910x1080 @30fps"
    #     fov: "90 degrees diagonal with auto focus lens."
    #     latency: "127.7ms"
    #     audio: "Record audio with built-in stereo microphone"
    #   title_cart: "World camera: high resolution"
    #   description_cart: "Max resolution: 1910x1080 @30fps. FOV 90 degrees diagonal with auto focus lens. 120ms latency."
    #   weight: 17
    #   title_video: "Download sample videos"
    #   link_video: "https://drive.google.com/file/d/0B4Q4b_aBOfU-QW1ncXpkdS02R1k/view?usp=sharing"
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
    wusbc:
      id: 'wusbc'
      title_store: "usb-c mount"
      description_store: "USB-C plug to connect to a wide range of cameras/sensors. Ships with standard tripod screw and mount. Compatible with Intel RealSense D400 series sensors. (*RealSense sensor not included.)"
      tech_specs:
        sensor: "No camera/sensor included."
      title_cart: "World Camera: USB-C mount"
      description_cart: "USB-C plug to connect to a wide range of cameras/sensors. Ships with standard tripod screw and mount. Compatible with Intel RealSense D400 series sensors. (*RealSense sensor not included.)"
      weight: 2
    # w3d:
    #   id: 'w3d'
    #   title_store: '3d'
    #   description_store: "Intel RealSense R200 RGBD camera. Provides depth image and monocular RGB color image. (Note: This sensor is not compatible with Pupil Mobile)."
    #   tech_specs:
    #     sensor: "See <a href='https://software.intel.com/sites/default/files/managed/d7/a9/realsense-camera-r200-product-datasheet.pdf' target='_blank' rel='nofollow'>Intel R200 data sheet</a> for details"
    #     fov:"See <a href='https://software.intel.com/sites/default/files/managed/d7/a9/realsense-camera-r200-product-datasheet.pdf' target='_blank' rel='nofollow'>Intel R200 data sheet</a> for details"
    #     latency: "See <a href='https://software.intel.com/sites/default/files/managed/d7/a9/realsense-camera-r200-product-datasheet.pdf' target='_blank' rel='nofollow'>Intel R200 data sheet</a> for details"
    #     audio: "Record audio via host device microphone"
    #   title_cart: "World Camera: 3d"
    #   description_cart: "Intel RealSense R200. Provides stereo RGB images and depth image."
    #   weight: 17
    #   title_video: "Download sample video"
    #   link_video: "https://drive.google.com/file/d/0Byap58sXjMVfRi13ZUo2MkJTWUE/view?usp=sharing"



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
    e200:
      id: 'e200'
      title_store: '200hz'
      description_store: 'Eye cameras custom built by Pupil Labs that resolve a wide range of eye movement motifs.'
      tech_specs:
        sensor: "Global Shutter. 200x200 @200fps, 400x400 @120fps"
        illumination: "IR camera with IR illumination (dark pupil tracking)"
        latency: "4.5ms"
      title_cart: "Eye camera: 200hz eye camera"
      description_cart: "Resolution: 200x200 @200fps. IR illumination."
      weight: 29
      title_video: "Download sample video"
      link_video: "#"
    e200b:
      id: 'e200b'
      title_store: "200hz binocular"
      description_store: "Eye cameras custom built by Pupil Labs with binocular frame for binocular eye detection at high speed. Custom made cameras that resolve a wider range of eye movement motifs."
      tech_specs:
        sensor: "Global Shutter. 200x200 @200fps, 400x400 @120fps"
        illumination: "IR camera with IR illumination (dark pupil tracking)"
        latency: "4.5ms"
      title_cart: "Eye cameras: 200hz binocular eye cameras"
      description_cart: "2 eye cameras. Resolution: 200x200 @200fps. IR illumination."
      weight: 32
      title_video: "Download sample video"
      link_video: "https://drive.google.com/file/d/1lSjtWTm3LTHAm7b3NKZmBOBsqetQkkX-/view?usp=sharing"

get_camera_data = ->
  camera_data = get_eye_cam_data()
  for k,v of get_world_cam_data()
    camera_data[k] = v
  return camera_data

get_world_cam_ids = ->
  return (k for k,v of get_world_cam_data())

get_eye_cam_ids = ->
  return (k for k,v of get_eye_cam_data() when k isnt 'e30' and k isnt 'e120b' and k isnt 'e120')

get_edu_discount_data = ->
  edu_discount_data =
    id: 'edu'
    title_cart: "Academic Discount"
    description_cart: "For use within an academic (non-commercial) context."

get_vr_ar_product_ids = ->
  return ['hololens_w120_e200b', 'htcvive_e200b', 'epsonbt300_w120_e200b']

get_additional_product_ids = ->
  return ['camera_e200l','camera_e200r','pm_motoz3','support_6','support_12']


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
    pupil_wnone_e200:
      cost: 1590
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.wnone
        eye_camera: eye_cam_data.e200
      img: [pupil_img_path,'pupil_wnone_e200.jpg'].join('/')
    pupil_wnone_e120b:
      cost: 2090
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.wnone
        eye_camera: eye_cam_data.e120b
      img: [pupil_img_path,'pupil_wnone_e120b.jpg'].join('/')
    pupil_wnone_e200b:
      cost: 2490
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.wnone
        eye_camera: eye_cam_data.e200b
      img: [pupil_img_path,'pupil_wnone_e200b.jpg'].join('/')
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
    pupil_wnone_e200_edu:
      cost: 1000
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.wnone
        eye_camera: eye_cam_data.e200
        discount: edu_discount
      img: [pupil_img_path,'pupil_wnone_e200.jpg'].join('/')
    pupil_wnone_e120b_edu:
      cost: 1500
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.wnone
        eye_camera: eye_cam_data.e120b
        discount: edu_discount
      img: [pupil_img_path,'pupil_wnone_e120b.jpg'].join('/')
    pupil_wnone_e200b_edu:
      cost: 1900
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.wnone
        eye_camera: eye_cam_data.e200b
        discount: edu_discount
      img: [pupil_img_path,'pupil_wnone_e200b.jpg'].join('/')

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
    pupil_w30_e200:
      cost: 1840
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w30
        eye_camera: eye_cam_data.e200
      img: [pupil_img_path,'pupil_w30_e200.jpg'].join('/')
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
    pupil_w30_e200_edu:
      cost: 1250
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w30
        eye_camera: eye_cam_data.e200
        discount: edu_discount
      img: [pupil_img_path,'pupil_w30_e200.jpg'].join('/')

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
      img: [pupil_img_path,'pupil_w120_e30.jpg'].join('/')
    pupil_w120_e120:
      cost: 1640
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w120
        eye_camera: eye_cam_data.e120
      img: [pupil_img_path,'pupil_w120_e120.jpg'].join('/')
    pupil_w120_e200:
      cost: 1840
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w120
        eye_camera: eye_cam_data.e200
      img: [pupil_img_path,'pupil_w120_e200.jpg'].join('/')
    pupil_w120_e120b:
      cost: 2340
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w120
        eye_camera: eye_cam_data.e120b
      img: [pupil_img_path,'pupil_w120_e120b.jpg'].join('/')
    pupil_w120_e200b:
      cost: 2740
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w120
        eye_camera: eye_cam_data.e200b
      img: [pupil_img_path,'pupil_w120_e200b.jpg'].join('/')
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
    pupil_w120_e200_edu:
      cost: 1250
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w120
        eye_camera: eye_cam_data.e200
        discount: edu_discount
      img: [pupil_img_path,'pupil_w120_e200.jpg'].join('/')
    pupil_w120_e120b_edu:
      cost: 1750
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w120
        eye_camera: eye_cam_data.e120b
        discount: edu_discount
      img: [pupil_img_path,'pupil_w120_e120b.jpg'].join('/')
    pupil_w120_e200b_edu:
      cost: 2150
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w120
        eye_camera: eye_cam_data.e200b
        discount: edu_discount
      img: [pupil_img_path,'pupil_w120_e200b.jpg'].join('/')

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
    pupil_w3d_e200:
      cost: 2190
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w3d
        eye_camera: eye_cam_data.e200
      img: [pupil_img_path,'pupil_w3d_e200.jpg'].join('/')
    pupil_w3d_e120b:
      cost: 2690
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w3d
        eye_camera: eye_cam_data.e120b
      img: [pupil_img_path,'pupil_w3d_e120b.jpg'].join('/')
    pupil_w3d_e200b:
      cost: 3090
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w3d
        eye_camera: eye_cam_data.e200b
      img: [pupil_img_path,'pupil_w3d_e200b.jpg'].join('/')

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
    pupil_w3d_e200_edu:
      cost: 1600
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w3d
        eye_camera: eye_cam_data.e200
        discount: edu_discount
      img: [pupil_img_path,'pupil_w3d_e200.jpg'].join('/')
    pupil_w3d_e120b_edu:
      cost: 2100
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w3d
        eye_camera: eye_cam_data.e120b
        discount: edu_discount
      img: [pupil_img_path,'pupil_w3d_e120b.jpg'].join('/')
    pupil_w3d_e200b_edu:
      cost: 2500
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.w3d
        eye_camera: eye_cam_data.e200b
        discount: edu_discount
      img: [pupil_img_path,'pupil_w3d_e200b.jpg'].join('/')

    pupil_wusbc_enone:
      cost: 1540
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.wusbc
        eye_camera: eye_cam_data.enone
      img: [pupil_img_path,'pupil_wusbc_enone.jpg'].join('/')
    pupil_wusbc_e200:
      cost: 2190
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.wusbc
        eye_camera: eye_cam_data.e200
      img: [pupil_img_path,'pupil_wusbc_e200.jpg'].join('/')
    pupil_wusbc_e200b:
      cost: 3090
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.wusbc
        eye_camera: eye_cam_data.e200b
      img: [pupil_img_path,'pupil_wusbc_e200b.jpg'].join('/')

    pupil_wusbc_enone_edu:
      cost: 950
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.wusbc
        eye_camera: eye_cam_data.enone
        discount: edu_discount
      img: [pupil_img_path,'pupil_wusbc_enone.jpg'].join('/')
    pupil_wusbc_e200_edu:
      cost: 1600
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.wusbc
        eye_camera: eye_cam_data.e200
        discount: edu_discount
      img: [pupil_img_path,'pupil_wusbc_e200.jpg'].join('/')
    pupil_wusbc_e200b_edu:
      cost: 2500
      title_product: 'Pupil Headset'
      sub_products:
        world_camera: world_cam_data.wusbc
        eye_camera: eye_cam_data.e200b
        discount: edu_discount
      img: [pupil_img_path,'pupil_wusbc_e200b.jpg'].join('/')

    oculusdk2_e120:
      cost: 800
      title_product: 'Oculus Rift DK2 Add-on'
      title_store: 'Oculus Rift DK2 Monocular Add-on Cup'
      description_store: "Add eye tracking to your Oculus Rift DK2 with our 120hz monocular eye tracking add-on. Includes one custom lens cup with: IR mirror, IR LEDs, 1 x 120 Hz eye camera, and USB cables."
      description_cart: "Monocular Oculus Rift DK2 add-on cup with 1 x 120hz eye camera."
      img: [vr_ar_img_path,'oculusdk2m.jpg'].join('/')
    oculusdk2_e120b:
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
    epsonbt300_w120_e200b:
      cost: 1750
      title_product: 'Epson Moverio BT-300 Add-on'
      title_store: 'Epson Moverio BT-300 Binocular Mount Add-on'
      description_store: "Binocular camera mounts for Epson Moverio BT-300 and world camera mount. Ships with USBC clip, 2 x 200hz eye cameras, and 1 x high speed world camera."
      description_cart: "Binocular camera mounts for Epson Moverio BT-300 and world camera mount. Ships with USBC clip, 2 x 200hz eye cameras, and 1 x high speed world camera."
      img: [vr_ar_img_path,'addon_epson_bt300b.jpg'].join('/')
    htcvive_e120b:
      cost: 1400
      title_product: 'HTC Vive Binocular Add-on'
      title_store: 'HTC Vive Binocular Add-on'
      description_store: "Add binocular eye tracking to your HTC Vive and Vive PRO VR headset. Includes binocular 120hz eye tracking cameras, clip-on attachment rings with IR illuminators and USB connector clip. No tools required!"
      description_cart: "120hz binocular eye tracking add-on for your HTC Vive and Vive PRO VR headset."
      img: [vr_ar_img_path,'htcviveb.jpg'].join('/')
    htcvive_e200b:
      cost: 1400
      title_product: 'HTC Vive Binocular Add-on'
      title_store: 'HTC Vive Binocular Add-on'
      description_store: "Add binocular eye tracking to your HTC Vive and Vive PRO VR headset. Includes binocular 200hz eye tracking cameras, clip-on attachment rings with IR illuminators and USB connector clip. No tools required!"
      description_cart: "200hz binocular eye tracking add-on for your HTC Vive and Vive PRO VR headset."
      img: [vr_ar_img_path,'htcvive_e200b.jpg'].join('/')
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
    hololens_w120_e200b:
      cost: 1750
      title_product: 'HoloLens Binocular Add-on'
      title_store: 'HoloLens Binocular Add-on'
      description_store: "Add binocular eye tracking to your Microsoft HoloLens AR headset. Includes binocular 200hz eye tracking cameras, high speed world camera, clip on attachment mounts, and USB connector clip."
      description_cart: "200hz binocular eye tracking add-on with high speed world camera for your Microsoft HoloLens AR headset."
      img: [vr_ar_img_path,'addon_hololens_e200.jpg'].join('/')
    hololens_wnone_e200b:
      cost: 1400
      title_product: 'HoloLens Binocular Add-on'
      title_store: 'HoloLens Binocular Add-on'
      description_store: "Add binocular eye tracking to your Microsoft HoloLens AR headset. Includes binocular 200hz eye tracking cameras, clip on attachment mounts, and USB connector clip."
      description_cart: "200hz binocular eye tracking add-on for your Microsoft HoloLens AR headset."
      img: [vr_ar_img_path,'addon_hololens_e200.jpg'].join('/')
    hub_usbc:
      cost: 210
      title_product: 'USB-C Clip Update'
      title_store: 'USB-C Clip Update'
      description_store: 'Update older micro USB Pupil headsets with the new USB-C clip. Comes with USB-C to USB-A cable.'
      description_cart: 'USB-C clip upgrade older micro USB Pupil headsets. Comes with USB-C to USB-A cable.'
      img: [additional_product_path,'usbcupgrade.jpg'].join('/')
    camera_e120:
      cost: 450
      title_product: '120hz Eye Camera'
      title_store: "120hz Eye Camera"
      description_store: "Update any existing Pupil headset with our custom made 120hz camera. This is a drop-in replacement. No tools needed. For more info, check out the camera specs in the configurator above."
      description_cart: "Camera upgrade: 120hz eye camera upgrade"
      img: [additional_product_path,'e120upgrade.jpg'].join('/')
    camera_e200r:
      cost: 650
      title_product: '200hz Eye Camera (Right Eye)'
      title_store: "200hz Eye Camera (Right Eye)"
      description_store: "Upgrade any existing Pupil headset with our custom made 200hz camera. This is a drop-in replacement for a right eye camera. No tools needed. For more info, check out the camera specs in the configurator above."
      description_cart: "Camera upgrade: 200hz eye camera upgrade"
      img: [additional_product_path,'e200upgrade.jpg'].join('/')
    camera_e200l:
      cost: 650
      title_product: '200hz Eye Camera (Left Eye)'
      title_store: "200hz Eye Camera (Left Eye)"
      description_store: "Upgrade any existing Pupil headset with our custom made 200hz camera. This is a drop-in replacement for a left eye camera. No tools needed. For more info, check out the camera specs in the configurator above."
      description_cart: "Camera upgrade: 200hz eye camera upgrade"
      img: [additional_product_path,'e200upgrade_left.jpg'].join('/')
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
      description_store: "Connect your Pupil headset to the Moto Z2 play. Record up to 4 hours of video locally on the phone, or stream video and sensor data over Wifi. The bundle comes with: Moto Z2 Play (black), hot-swappable Moto power pack, 64gb SD card, USBC-USBC cable, and is pre-loaded with the Pupil Mobile app. (Note: Pupil headsets with 3d world camera are not compatible with Pupil Mobile)."
      description_cart: "Moto Z2 Play (black), hot-swappable Moto power pack, 64gb SD card, USBC-USBC cable, and is pre-loaded with the Pupil Mobile app. Connects to Pupil headset via USBC cable (included)."
      img: [additional_product_path,'pm_nexus5x.jpg'].join('/')
    pm_motoz3:
      cost: 750
      title_product: 'Pupil Mobile Bundle'
      title_store: "Pupil Mobile Bundle"
      description_store: "Connect your Pupil headset to the Moto Z3 play. Record up to 4 hours of video locally on the phone, or stream video and sensor data over Wifi. The bundle comes with: Moto Z3 Play (blue), hot-swappable Moto power pack, 64gb SD card, USBC-USBC cable, and is pre-loaded with the Pupil Mobile app. (Note: Pupil headsets with 3d world camera are not compatible with Pupil Mobile)."
      description_cart: "Moto Z3 Play (blue), hot-swappable Moto power pack, 64gb SD card, USBC-USBC cable, and is pre-loaded with the Pupil Mobile app. Connects to Pupil headset via USBC cable (included)."
      img: [additional_product_path,'pm_nexus5x.jpg'].join('/')
    support_6:
      cost: 1000
      title_product: 'Support Contract'
      title_store: '6 Month Support Contract'
      description_store: '6 month support contract. 3 one hour video support sessions and email support.'
      description_cart: '6 month support contract. 3 one hour video support sessions and email support.'
      img: [additional_product_path,'support6.svg'].join('/')
    support_12:
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
    htcviveb: 'htcvive_e120b'
    oculusdk2b: 'oculusdks_e120b'
    oculusdk2m: 'oculusdk2_e120'
    epsonbt300b_e120b: 'epsonbt300_wnone_e200b'
    support6: 'support_6'
    support12: 'support_12'
    e120upgrade: 'camera_e120'
    e200upgrade: 'camera_e200'
    usbcupgrade: 'hub_usbc'

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
