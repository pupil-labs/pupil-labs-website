---
title: Pupil v0.3.6 - Marker Tracking
author: Pupil Dev Team
date: 2013-12-09
subtitle: "We've been busy working on a lot of improvements in the last few weeks both on the hardware and software fronts. We're pleased to announce that we've completed a Marker Tracking plugin..."
featured_img: "../../../../media/images/blog/v0.3.6_marker_tracking.png"
featured_img_thumb: "../../../../media/images/blog/thumb/v0.3.6_marker_tracking.png"
---

We've been busy working on a lot of improvements in the last few weeks both on the hardware and software fronts. We're pleased to announce that we've completed a **Marker Tracking** plugin.  This is something that has been on our list for a long time, so we're pretty excited to have it up and running!  Update to v0.3.6, and let us know what you think!

<a href="https://github.com/pupil-labs/pupil/releases/tag/v0.3.6" class="Button">Download v0.3.6</a>

## Marker Tracking
We have implemented a marker tracking plugin so that you can define surfaces within your environment and track surfaces in **realtime**.  We were greatly inspired by the [ArUco marker tracking library](http://www.uco.es/investiga/grupos/ava/node/26 "aruco").  We rolled our own flavor of the ArUco style marker tracking and build upon those ideas to improve performance.  Check out the [square marker detection code](https://github.com/pupil-labs/pupil/blob/marker_tracking/pupil_src/shared_modules/square_marker_detect.py "square marker detect"), it's open source Python and contained all within one file.      

<div class="Feature-video-container-16by9">
  <iframe src="//www.youtube.com/embed/bmqDGE6a9kc?rel=0" frameborder="0" allowfullscreen class="Feature-video"></iframe>
</div>

This plugin currently enables realtime user interaction.  Many people in the Pupil community have been asking about how to control a mouse with your eyes.  Some members Pupil community have [already made lots of progress in this area](http://youtu.be/cIsK4wj8yh4 "Ignacio Pupil Dasher demo"), and we thought we'd build upon that!   

Here's what you can currently do with the marker tracking plugin.

  + Define surfaces within your environment using fiducial markers.  Surfaces can be defined with one or more markers.  
  + Markers - We use a 5x5 square marker.  This is not the same marker that is used by ArUco (they use 7x7). This gives us 64 unique markers. This allows us to make smaller markers that can still be detected.  Markers can be printed on paper, or displayed on the screen.   
  + You can [generate markers with this script](https://github.com/pupil-labs/pupil-helpers/blob/master/make_square_markers.py "Generate square marker script"). Here is a .png of all 64 markers 
  <img alt="All 64 Markers" src="../../../media/images/all_markers.png" width="100%">
  + Within the plugin, you can register surfaces, name them, and edit them.  
  + Registered surfaces are saved automatically, so the next time you run Pupil capture, your surfaces (if they can be seen) will appear when you start the marker tracking plugin.
  + Surfaces defined with more than 2 markers are detected even if some markers go outside the field of vision or are obscured. 
  + We have created a window that shows registered surfaces within the world view and the gaze positions that occur within those surfaces in realtime.  
  + Streaming - Detected surfaces as well as gaze positions relative to the surface can be streamed locally or over the network with pupil server.  See video below.
  + Check out [marker detector plugin code on github](https://github.com/pupil-labs/pupil/blob/marker_tracking/pupil_src/capture/marker_detector.py "Marker detector code on github").

Check out this cool demo video below where we use our gaze to navigate through a 3D environment!

<div class="Feature-video-container-16by9">
  <iframe class="Feature-video" src="//www.youtube.com/embed/qHmfMxGST7A?rel=0" frameborder="0" allowfullscreen></iframe>    
</div>

## Coming Soon
In the near future, defined surfaces can also be used after capture for visualization and analysis.  Think heatmaps or videos that show gaze when it is within a defined surface like different windows on a screen, areas of a website, areas of a newspaper, poster, or magazine.  We are working on a browser that will enable one to visualize captured data and load plugins like marker tracking to analyze results.       
  
Here's what's on our agenda for the browser

  + Load and view capture sessions.  Currently simple player scripts are used to view and visualize data.  We are working on making browser with a better backend and playback control.   
  + Plugins - Browser will use existing plugins to visualize and parse the capture data - both for visualization and analysis.   
  + Marker Tracking - The names and definitions of surfaces are currently saved as events.  In browser marker tracking will be loaded as a plugin, where we will be able to view and save visualizations of gaze within surfaces.     

## Other Changes in v0.3.6
  + Coordinate system - we updated to a normalized coordinate system.  In previous versions of Pupil, what we called the "normalized" coordinate system put the origin - 0,0 - at the center of the image and 1,1 at the top right corner of the image.  We're trying to reduce the number of coordinate systems used between different representations of images.  From now on we only use **two coordinate systems**.  
    + Normalized Space - Origin at the bottom left and 1,1 at the top right.  This is the OpenGL convention and what we find to be an intuitive representation.  This is the coordinate system we use most in Pupil.  Vectors in this coordinate system are specified by a _norm_ prefix or suffix in their variable name. 
    + Image Coordinate System - In some rare cases we use the image coordinate system.  This is mainly for pixel access of the image arrays.  Here one unit is a pixel and the origin is the top left and the bottom right is the maximum x,y.  
  + Simple player scripts updated to work with new normalized coordinate system.  Don't worry, recordings made with the legacy coordinate system will still work.  We simply check the version in the info.csv file and then use the appropriate method for the version with which the capture was made.

## Pupil Tools
We often make small stand-alone scripts, helper functions, or tools for Pupil that are not directly part of the Pupil repository.  However, they are quite useful.  We have made a public gist where we will keep these tools.  Check out the [Pupil Helpers repository](https://github.com/pupil-labs/pupil-helpers/ "pupil-helpers") and feel free to contribute!  