--- 
title: Pupil plugin for Lab Streaming Layer
date: Fri Nov 18 2016 13:37:50 GMT+0700 (ICT) 
author: Pupil Dev Team 
subtitle: "Introducing Pupil LSL relay plugin that relays pupil data, gaze data and notifications to the lab streaming layer..."
featured_img: "../../../../media/images/blog/Lab-Streaming-Layer.jpg"
featured_img_thumb: "../../../../media/images/blog/thumb/Lab-Streaming-Layer.jpg"
---

<div class="Grid Grid--center Grid--justifyCenter">
	<img src="../../../../media/images/blog/Lab-Streaming-Layer.jpg" style="width:50%" class='Feature-image u-padBottom--1' alt="Lab Streaming Layer">
</div>

<div class="small u-padBottom--2">Image Source: [Qusp Product Portfolio](https://qusp.io/projects)</div>

We are excited to introduce the [Pupil + Lab Streaming Layer relay plugin](https://github.com/sccn/labstreaminglayer/tree/master/Apps/PupilLabs). The plugin works with [Pupil Capture](http://docs.pupil-labs.com/#pupil-capture "Pupil Docs - Pupil Capture") to relay pupil data, gaze data, and notifications to LSL. Users can link the data to other inlets in the network.

The [Lab Streaming Layer](https://github.com/sccn/labstreaminglayer) (LSL) is a system that provides unified collection of measurement time series between programs, computers, and devices over a network for distributed signal transport, time synchronization, and data collection. LSL has an extensive range of supported measurement modalities including eye tracking. 

LSL is a great data aquisition tool that is used by a lot of researchers. That is why we developed the Pupil LSL plugin to be maintainable in the long run that allows researchers and developers to have access to all of our data. It also allows the user to turn on and off outlets for pupil, gaze and notification data. The plugin provides the following outlets from primitive data streams and Python Representaion streams:

Primitive data streams

- diameter
- confidence
- timestamp
- norm_pos.x
- norm_pos.y

Python Representation streams
- repr() string of the datum


For more information you can check out the plugin documentation included in the LSL distribution here : [Pupil LSL relay plugin](https://github.com/sccn/labstreaminglayer/tree/master/Apps/PupilLabs)



