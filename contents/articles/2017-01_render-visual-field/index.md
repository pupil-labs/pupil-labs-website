--- 
title: Adapting Rendering to the User's Current Visual Field
date: Wed Jan 25 2017 17:13:14 GMT+0700 (ICT) 
author: Pupil Dev Team 
subtitle: "Daniel Pohl et al., use Pupil Labs' Oculus DK2 add-on to propose a rendering technique for HMDs that is optimized based on the user's current visual field..." 
featured_img: "../../../../media/images/blog/visfield.png"
featured_img_thumb: "../../../../media/images/blog/thumb/eyefield.jpg" 
---

Advances in head-mounted displays for further immersion increases the need for performance optimizations to handle rendering workload. [Daniel Pohl](http://www.intel.com/content/www/us/en/research/people/intel-labs-bio-daniel-pohl.html) et al., propose to use the user's visual field of the eye gaze to optimize the area of the virtual scene that is rendered.

<img src="../../../../media/images/blog/visfield.png" class='Feature-image u-padTop--1' alt="Adapt Rendering to the User's Current Visual Field">

<div class="small u-padBottom--2">Image Source: [Concept for Using Eye Tracking in a Head-Mounted Display to Adapt Rendering to the User's Current Visual Field](https://perceptual.mpi-inf.mpg.de/wp-content/blogs.dir/12/files/2016/11/pohl2016_vrst.pdf)</div>

The researchers have developed a calibration routine using Pupil Lab's [Oculus Rift DK2 add-on cup](https://pupil-labs.com/store/#vr-ar). Their calibration routine enables one to determine an individual user's visual field. The calibration demonstrates that users can actually see more of the VR environment when fixating on the center of a calibration area than when fixating on outer areas (due to lens defects).

By knowing a user's visual field, one can optimize the rendering pipeline to skip areas that are not seen. This will enable faster frame rates (up to 2x performance gains) and lower perceived latency, and therefore a more immersive VR experience.

Check out the their full research paper [here](https://perceptual.mpi-inf.mpg.de/wp-content/blogs.dir/12/files/2016/11/pohl2016_vrst.pdf).

If you use Pupil in your research and have published work, please send us a note. We would love to include your work here on the blog and in a list of [work that cites Pupil](https://docs.google.com/spreadsheets/d/1ZD6HDbjzrtRNB4VB0b7GFMaXVGKZYeI0zBOBEEPwvBI/).