--- 
title: FaceVR: Real-Time Facial Reenactment and Eye Gaze Control in VR
date: Thu Nov 17 2016 10:49:16 GMT+0700 (ICT) 
author: Pupil Dev Team 
subtitle: ""
featured_img_thumb: ""
---

We introduce FaceVR, a novel method for gaze-aware facial reenactment
in the Virtual Reality (VR) context. 

The key component
of FaceVR is a robust algorithm to perform real-time facial motion
capture of an actor who is wearing a head-mounted display (HMD),
as well as a new data-driven approach for eye tracking from monocular
videos. 


In addition to these face reconstruction components,
FaceVR incorporates photo-realistic re-rendering in real time, thus
allowing artificial modifications of face and eye appearances. 

For
instance, we can alter facial expressions, change gaze directions, or
remove the VR goggles in realistic re-renderings. 

In a live setup with a source and a target actor, we apply these newly-introduced algorithmic components. 

We assume that the source actor is wearing a VR device, and we capture his facial expressions and eye movement in real-time.

For the target video, we mimic a similar tracking
process; however, we use the source input to drive the animations
of the target video, thus enabling gaze-aware facial reenactment. 

To render the modified target video on a stereo display, we augment
our capture and reconstruction process with stereo data. In the end,
FaceVR produces compelling results for a variety of applications,
such as gaze-aware facial reenactment, reenactment in virtual reality,
removal of VR goggles, and re-targeting of somebody’s gaze
direction in a video conferencing call.







FaceVR is gaze-aware facial reenactment in virtual reality. A real-time performance capture system to drive the digital reconstruction of a person's face. A facial reenactment that can transfer facial expressions and realistic eye appearance between a source and a target actor video.

Facial expressions and eye movement is captured and streamed in real-time while the source actor is wearing a VR headset. To construct a 3D face, an RGB-D camera was used to capture the facial performance of the source actor and [Pupil's Oculus Rift DK2 add-on cup]() was used to track the actor's eye within the HMD.

The source actor's facial and gaze data is then used to drive the animations of the target video, therefore enabling gaze-aware facial reenactment.






This is done by an actor wearing a head-mounted display with Pupil HMD add-on to capture the actor's facial expressions and eye movement. The captured data is then streamed in real-time to drive the photo-realistic facial animation.





Source actor experiences VR, while wearing the Oculus DK2 headset.

The source actor is tracked using a RGB-D sensor and Pupil's Oculus Rift DK2 add-on cup and augment the digital facial reconstruction with markers. 

The target actor footage is captured with stereo webcames.

<!-- Transfer the source expression to the target video and re-render and composite the modified face in photo-realistic render.
 -->










In this work, we have presented FaceVR, a novel approach for realtime
gaze-aware facial reenactment in the context of virtual reality.
The key components of FaceVR are robust face reconstruction and
tracking, data-driven eye tracking, and photo-realistic re-rendering
of facial content on stereo displays. Therefore, we are able to show
a variety of exciting applications, such as re-targeting of gaze directions
in video chats, virtual removal of VR goggles in video streams,
and most importantly, facial reenactment with gaze awareness in
VR. We believe that this work is a stepping stone in this new field,
demonstrating some of the possibilities of the upcoming virtual reality
technology. In addition, we are convinced that this is not the end
of the line, and we believe that there will be even more exciting future
work targeting photo-realistic video editing in order to improve
the VR experience, as well as many other related applications.