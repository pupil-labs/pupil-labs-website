--- 
title: Adapt Rendering to the User's Current Visual Field
date: Mon Jan 09 2017 17:13:14 GMT+0700 (ICT) 
author: Pupil Dev Team 
subtitle: "Daniel Pohl et al., propose to use the user's visual field of the eye gaze for render optimizations and increase performance..." 
featured_img: "../../../../media/images/blog/visfield.png"
featured_img_thumb: "../../../../media/images/blog/thumb/visfield.png" 
---

<img src="../../../../media/images/blog/visfield.png" class='Feature-image u-padBottom--1' alt="Adapt Rendering to the User's Current Visual Field">
Image Source: [Concept for Using Eye Tracking in a Head-Mounted Display to Adapt Rendering to the User's Current Visual Field](https://perceptual.mpi-inf.mpg.de/wp-content/blogs.dir/12/files/2016/11/pohl2016_vrst.pdf)

<br>
Advances in head-mounted displays for further immersion increases the need for performance optimizations to handle rendering workload. [Daniel Pohl](http://www.intel.com/content/www/us/en/research/people/intel-labs-bio-daniel-pohl.html) et al., propose to use the user's visual field of the eye gaze for render optimizations and increase performance.

The research shows that there are lens defect in the current generation of HMD's where certain parts of the screen are not visible. Daniel Pohl et al., have provided a calibraton routine using Pupil Labs's [Oculus Rift DK2 add-on cup](https://pupil-labs.com/store/#vr-ar) in Oculus DK2 head-mounted display to measure these lens effects to find the visual field.

The resulting visual field shows that users can see more of the screen when looking at the center than when looking into the outer areas. This leads to where certain parts that are invisible to the users gaze will be skipped for rendering thus enabling faster frame rates and improves the performance up to 2X.

Check out the their full research paper [here](https://perceptual.mpi-inf.mpg.de/wp-content/blogs.dir/12/files/2016/11/pohl2016_vrst.pdf).

If you use Pupil in your research and have published work, please send us a note. We would love to include your work here on the blog and in a list of [work that cites Pupil](https://docs.google.com/spreadsheets/d/1ZD6HDbjzrtRNB4VB0b7GFMaXVGKZYeI0zBOBEEPwvBI/).