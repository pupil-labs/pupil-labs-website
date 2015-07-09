---
title: Pupil Capture & Pupil Player - Joint Release v0.3.8
author: Pupil Dev Team
date: 2014-03-25
subtitle: We are happy to announce the release of new bundles for Pupil Capture & Pupil Player (v0.3.8). Bundles contain all the work that has been done in the last month. We have been working on many small but hopefully useful improvements...
---

We are happy to announce the release of new bundles for Pupil Capture & Pupil Player (v0.3.8). Bundles contain all the work that has been done in the last month. We have been working on many small but hopefully useful improvements.

<div class="row">
	<div class="col-sm-12 text-center">
	  <a href="https://github.com/pupil-labs/pupil/releases/tag/v0.3.8" class="Button" target="_blank">Download v0.3.8</a>
	</div>
</div>

##  New features for Pupil Capture

+ Adjustable timebase for capture.  We&apos;ve changed the reference time point for timestamps to now.
+ Screen marker based accuracy test.  Enables one to evaluate gaze accuracy and precision. (See screenshot below)
+ Added option to disable the coarse pupil detector, as it may fail when the subject wears mascara.
+ Detector variables have be tweaked to improve detector effectiveness and speed.
+ Camera capture is now more robust.  If the camera should fail while Pupil Capture is running, (e.g. if a USB cable is disconnected) the software will clean up any ongoing action (recordings etc.) and do a proper shutdown so that data is preserved. 
+ Capture app starts even without cameras connected.  When cameras are not detected Pupil Capture software still starts, but respective windows without cameras will display a test pattern (random color squares).
+ Added option to disable screen updates for world and eye window. This helps weak systems record without dropping frame rate.  
+ Retina screens are now supported.  The mouse cursor is no longer offset.
+ Pupil Server to OSC bridge script. After getting a lot of requests for OSC streams, we made a small script to allow Pupil to interface with OSC devices. Script can be found in [this gist](https://gist.github.com/mkassner/9682161#file-zmq_osc_bridge-py "ZMQ OSC Bridge Script"). 

<div class="text-center">
	<img src="../../../media/images/pupil_accuracy_test.png" class="img-responsive img-rounded" alt="Pupil Accuracy Test">
</div>

## Performance improvements for Pupil Capture
Various small improvements have been made as we are trying to make pupil capture run on smaller and cheaper laptops. Using Ubuntu 13.10 we are now able to make recordings with Pupil Capture on a [2010 11inch Macbook Air](http://www.everymac.com/systems/apple/macbook-air/specs/macbook-air-core-2-duo-1.4-11-late-2010-specs.html "2010 11inch MBAir"). When disabling screen updates we are no longer dropping frames. The CPU of our test machine is a [Intel Core2Duo SU9400](http://cpuboss.com/cpu/Intel-Core2-Duo-SU9400 "Intel Core2 Duo SU9400") -- this means that Pupil should run on any "i" type intel processor now.

This test was done using Linux, we know that some internals on MacOS are slightly less efficient so you may need a little bit more steam if you run MacOS (any recent Mac will do fine though.) If you have tested  minimum specs for Windows please send us an update!

## New features for Pupil Player

+ Marker based surface tracker, has been added but still need some visualization methods
+ Added a simple fixations filter.  Current simple filter, although not scientific, will make the data look better by filtering data based on distance between points.  We are currently working on a proper fixation and saccade classifier -- stay tuned!  
+ Added cross as gaze visualization.
+ Added a simple / hacky gaze offset plugin.
+ Added pupil server plugin.

## Bundle support

+ Ubuntu has been working quite well for a while now, so no real news here.
+ Various fixes have been made to the MacOS bundle for player and capture. Everything should work now. (If not please let us know!)


## Small fixes and improvements

+ Pupil Player now closes via GUI. 
+ The capture class now has proper exceptions
+ Texture upload have be optimized for capture and player
+ Pupil Player meta info reader is more robust
+ Fixed a bug that messed up the log files on MacOS
+ Fixed a bug that led to crashes when entering fullscreen mode.
+ Pupil Player now avoids export overwrites by adding a timestamp to the out file name
+ Many small GUI improvements and more documentation strings
+ Player plugins can no longer make permanent changes to recent pupil positions.
+ Fixed a bug in capture selection list on Linux
+ Pupil player plugins now remember their GUI state.
+ Added support for Logitech c510 camera
+ Pupil Player exporter now logs is a more proper way
+ Various minor fixes and tweaks

## Minor website updates
Minor updates (mostly graphics) to the Pupil project page on the Pupil Labs website.  [Check it out](http://pupil-labs.com/pupil "Pupil").


Thanks to the community for spotting bugs and helping Pupil become better and better!

As always, please report any bugs you may find using the [Github issue system](https://github.com/pupil-labs/pupil/issues "Issues").  And share your work with Pupil on the [Pupil Google Group](https://groups.google.com/forum/#!forum/pupil-discuss "Pupil Google Group")!