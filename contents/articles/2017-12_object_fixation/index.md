--- 
title: Real-time object recognition using fixations to control prosthetic hand
date: Fri Dec 15 2017 11:31:00 GMT+0700 (ICT) 
author: Pupil Dev Team 
subtitle: "Real-time object recognition with fixations to control grasps of a robotic prosthetic hand..."
featured_img: "../../../../media/images/blog/object_detection.jpg"
featured_img_thumb: "../../../../media/images/blog/thumb/object_detection.jpg"
---

[Jesse Weisberg](https://github.com/jesseweisberg) has made real-time object detection plugin that integrated with Pupil Labs headset to indentify what object the user is currently fixated upon and control a prosthetic hand by forming grasps based on the fixated object.

<div class="Feature-video-container-16by9">
  <iframe class="Feature-video u-padTop--2" src="https://www.youtube.com/embed/MqqQnCbzryA?rel=0" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

<div class="small u-padBottom--2">Robotic Prosthetic Hand Controlled with Object Recognition and Eye-Tracking</div>

The object detection plugin publishes the detected object that is closest to the fixation to a rostopic. The Arduino subscribing to the rostopic, then controls the linear actuators of the prosthetic hand to form a predefined grasp associated with that object stored in the Arduino firmware.

For more information on Jesse Weisberg's plugin, head over to his [github](https://github.com/jesseweisberg/pupil) project.