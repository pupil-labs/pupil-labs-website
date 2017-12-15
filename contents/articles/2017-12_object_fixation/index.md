--- 
title: Real-time object recognition using fixations to control prosthetic hand
date: Fri Dec 15 2017 11:31:00 GMT+0700 (ICT) 
author: Pupil Dev Team 
subtitle: "Real-time object recognition with fixations to control grasps of a robotic prosthetic hand..."
featured_img: "../../../../media/images/blog/object_detection.jpg"
featured_img_thumb: "../../../../media/images/blog/thumb/object_detection.jpg"
---

We are excited to share a project from a Pupil community member, [Jesse Weisberg]((https://github.com/jesseweisberg). Jesse has developed a plugin for Pupil that enables a prosthetic hand to form grasps based on what the wearer is fixating on in the scene in real-time on the CPU (10-15 fps)!

This project is a great demonstration of how to extend Pupil and contribute back to the open source community!

<div class="Feature-video-container-16by9">
  <iframe class="Feature-video u-padTop--2" src="https://www.youtube.com/embed/KYcfLEvbxSc?rel=0" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

<div class="small u-padBottom--2">Robotic Prosthetic Hand Controlled with Object Recognition and Eye-Tracking</div>

The object detection plugin publishes the detected object that is closest to the fixation to a rostopic. An Ardunio Mega 2560 subscribes to the rostopic and controls the linear actuators in an OpenBionics 3D printed hand to form a predefined grasp that is associated with the detected object.

Check out Jesse's Pupil fork on [github](https://github.com/jesseweisberg/pupil). He provides a very well written readme along with demo videos. Or jump straight to his "object detector app" in his [repo](https://github.com/jesseweisberg/pupil/tree/master/pupil_src/shared_modules/object_detector_app).

We hope that others will build on top of Jesse's work and contribute back to his project!

Finally, if you have built something with Pupil, please considering sharing with the community via chat on [DiscordApp](https://pupil-labs.com/chat).