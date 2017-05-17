--- 
title: Personalized Image-based User Authentication using Wearable Cameras
date: Wed Jan 16 2017 11:18:18 GMT+0700 (ICT) 
author: Pupil Dev Team 
subtitle: "Ngu Nguyen et al., use Pupil to create a personalized user authentication system that generates image based passwords from egocentric video..."
featured_img: "../../../../media/images/blog/user_auth.png"
featured_img_thumb: "../../../../media/images/blog/user_auth.png"
---

Personal devices are a part of our everyday life that operate and store users private data. Such devices face an array of threats that have become a primary concern for users. The existing authentication mechanism requires users to register and remember one static password for each device at a time. However static passwords are vulnerable to various methods of attacks. 

<div class="Grid Grid--center Grid--justifyCenter">
	<img src="../../../../media/images/blog/user_auth.png" style='max-width:70%' class='Feature-image u-padTop--1' alt="Image-Based Authentication Challenges Generated From Egocentric Videos">
</div>

<div class="small u-padTop--1 u-padBottom--2">Demo shows user performing an auth challenge. Selecting images that they have or haven't seen that day. Image Source: Fig 1. Page 2. - [Personalized Image-based User Authentication using Wearable Cameras](https://arxiv.org/pdf/1612.06209.pdf)</div>

[Ngu Nguyen](http://ambientintelligence.aalto.fi/team.html) et al., propose a novel personalized user authentication mechanism that generates an image-based passwords from egocentric videos captured by wearable cameras. 

The increase in wearable cameras and videos generated have also increase the need for egocentric video summarization research to represent the content in a more compact form. It has been shown that gaze data can improve the performance of summarization.

The researchers use Pupil to capture egocentric video and gaze data. Fixations from gaze data can be used to discriminate potentially meaningful or salient segments of the egocentric video. These segments can then be used to split up the video into groups of personalized images used in the auth challenge.

Check out the their full paper [here](https://arxiv.org/pdf/1612.06209.pdf).

If you use Pupil in your research and have published work, please send us a note. We would love to include your work here on the blog and in a list of [work that cites Pupil](https://docs.google.com/spreadsheets/d/1ZD6HDbjzrtRNB4VB0b7GFMaXVGKZYeI0zBOBEEPwvBI/).

