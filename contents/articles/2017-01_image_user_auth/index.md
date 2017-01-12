--- 
title: Personalized Image-based User Authentication using Wearable Cameras
date: Wed Jan 11 2017 11:18:18 GMT+0700 (ICT) 
author: Pupil Dev Team 
subtitle: "Ngu Nguyen et al., propose a novel personalized user authentication mechanism that generates an image-based passwords from egocentric videos captured by wearable cameras..."
featured_img: "../../../../media/images/blog/user_auth.png"
featured_img_thumb: "../../../../media/images/blog/user_auth.png"
---

Personal devices are a part of our everyday life that operate and store users private data. Such devices face an array of threats that have become a primary concern for users. The existing authentication mechanism requires users to register and remember one static password for each device at a time. However static passwords are vulnerable to various methods of attacks. 

<img src="../../../../media/images/blog/user_auth.png" class='Feature-image' alt="Image-Based Authentication Challenges Generated From Egocentric Videos">

<div class="small u-padBottom--2">Image Source: Fig 1. Page 2. - [Personalized Image-based User Authentication using Wearable Cameras](https://arxiv.org/pdf/1612.06209.pdf)</div>gul

[Ngu Nguyen](http://ambientintelligence.aalto.fi/team.html) et al., propose a novel personalized user authentication mechanism that generates an image-based passwords from egocentric videos captured by wearable cameras. 

One of the process of generating authentication challenges uses Pupil Lab's [Pupil headset](https://pupil-labs.com/store/#pupil) to capture egocentric videos and gaze data. [Pupil eye tracker](https://pupil-labs.com/store/#pupil) was used to track eye fixations to reveal user's attention which are demonstrated to be useful in [video summarization](http://www.cv-foundation.org/openaccess/content_cvpr_2015/papers/Xu_Gaze-Enabled_Egocentric_Video_2015_CVPR_paper.pdf) to provide information of wearer's visual behavior.

Whenever eye fixations appear in the timeline, frames that are possible to discriminate are then selected and split into segments and grouped to form fresh and personalized image-based user authentication mechanism. The image-based mechanisms are evaluated to be comparable to static approaches while decreasing security vulnerabilities.

Check out the their full research paper [here](https://arxiv.org/pdf/1612.06209.pdf).

If you use Pupil in your research and have published work, please send us a note. We would love to include your work here on the blog and in a list of [work that cites Pupil](https://docs.google.com/spreadsheets/d/1ZD6HDbjzrtRNB4VB0b7GFMaXVGKZYeI0zBOBEEPwvBI/).

