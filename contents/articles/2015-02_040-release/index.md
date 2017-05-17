---
title: Pupil 0.4.0 Release
author: Pupil Dev Team
date: 2015-02-25
subtitle: "We are very excited to release our latest set of improvements to the Pupil project. This is the biggest release so far. We have created 5 new libraries and made over 300 commits to the Pupil source..."
featured_img: "../../../../media/images/blog/v0.4.0_release_tag.png"
featured_img_thumb: "../../../../media/images/blog/thumb/v0.4.0_release_tag.png"
tag: {"caption":"v0.4.0","icon":"local_offer"}
---

We are very excited to release our latest set of improvements to the Pupil project. This is the biggest release so far. We have created 5 new libraries and made over 300 commits to the Pupil source.  

<a href="https://github.com/pupil-labs/pupil/releases/tag/v0.4.0"  class="Button"target="_blank">Download Pupil v0.4.0</a>


We want to thank everyone who contributed to the source code, raised issues, commented on code, and sent feedback! The Pupil project is getting better every day!

## A new look and feel

One of the first things that you’ll notice in v0.4 is the user interface (UI). The UI is something we’ve been wanting improve for a long time. The reason it’s taken us so long is because we have a number of constraints to satisfy:

+ Mouse and touch - Pupil needs to work well with both mouse and touch interactions.
+ Screen size and pixel density - Pupil should be able to work well with a variety of screen sizes and pixel densities. From small high pixel density screens to very large desktop monitors.
+ Compatibility and performance - The UI needs to be cross platform and very efficient.
+ Design - Fine grain control of the design -- UI elements, fonts, colors, user feedback, and more.
+ Accessibility - The UI should be equally friendly to users and developers
+ Longevity - The UI should be able to grow and develop alongside Pupil.

Not wanting to reinvent the wheel, we searched for an existing graphical user interface (GUI) library, but couldn’t find anything that satisfied our constraints.

So we created [pyglui](http://github.com/pupil-labs/pyglui) -- an Open Source  OpenGL UI library for python projects. We use it for both Pupil Capture and Pupil Player. Pyglui is written in [cython](http://cython.org), giving it the perfect blend of python integration and typing and C speed. This was a lot of work and we are very happy it all came together.


<img src="../../../../media/images/v04_world_eye_composite_screenshot.png" class='Feature-image' alt="Pupil Capture World and Eye window screenshots v0.4.0">

While making pyglui we also had to deal with OpenGL font rendering for Python and fast GL calls for Python. So we wrote [pyfontstash](http://github.com/pupil-labs/pyfontstash) -- a Python binding for [fontstash](https://github.com/memononen/fontstash) (developed by Mikko Mononen). And we wrote [cygl](http://github.com/pupil-labs/cygl) -- a cython OpenGL library that uses GLEW. Cygl is used throughout Pupil Capture and Player alongside pyglui to speed up GL function calls.

All three libraries are maintained by Pupil Labs under a [MIT license](https://github.com/pupil-labs/pyglui/blob/master/LICENSE).

We hope the others will use pyglui, pyfontstash, and cygl in their projects and contribute back to the codebase!

## Linux video

For Linux we have completely rewritten the video capture module. It is now a separate python library called [pyv4l2](https://github.com/pupil-labs/pyv4l2). Its very technical but you can read more about it on the readme. Bottom line: its faster, more flexible, and more robust.

## Windows video

While this is still very much work in progress we did not want to leave this part out. We created a Python binding for [VideoInput](http://www.codeproject.com/Articles/776058/Capturing-Live-video-from-Web-camera-on-Windows-an) -- git repository is [here](ssh://git@git.codeproject.com/evgeny-pereguda/videoinput) -- which in turn uses the Media Foundation. Its not quite done but already functional enough to be tested. From now on the Windows bundle is finally functionally equivalent to the Linux and Mac version!

The new Library is called [pyVideoInput](https://github.com/pupil-labs/pyvideoinput/), is maintained by Pupil Labs and released under a [CPOL license](https://github.com/pupil-labs/pyvideoinput/blob/master/LICENSE).

## Windows bundle

There has been a lot of demand for Pupil on Windows. And we plan to release a bundle as soon as the Windows video library is production ready.

## Binocular mode

We have been using both words “binocular” and “bilateral” to refer to a setup that captures both eyes. From here onwards we will use the term binocular for any setup with two eye cameras and monocular for single eye camera setups.

There are already a few binocular headsets being used in the wild -- and we’re gearing up to fully support binocular Pupil headsets. We used to maintain a separate branch just for binocular setups, but now we have integrated this functionality into the the main branch of Pupil. You can now start Pupil Capture from source code, in binocular mode by passing `binocular` as an argument when starting Pupil Capture. Example: `python main.py binocular` -- will launch two eye processes.

We’ve done a lot of restructuring to appropriately deal with different calibrations and gaze mapping strategies that we will implement in the near future.

## New recording format

We now record pupil and gaze data separately. We have added pupil diameter as a recorded value by default.

Have a look at the updated data format on the wiki [here](https://github.com/pupil-labs/pupil/wiki/Data-format).

## Pupil Player - Batch exporter

You can now use the batch exporter plugin in Pupil Player to apply visualizations and export to an entire directory of recordings.

## Developer notes

The notes below are not important for non-developers. If you are working with the source code, be aware that v0.4 changes have been merged with master. If you are developing your own plugins you should [read the wiki](https://github.com/pupil-labs/pupil/wiki/Plugin%20Guide) for changes to the following:

*Major changes*

+ Changes to the plugin class
+ New frame class
+ New plugin manager
+ `recent_pupil_positions` is now an event. Within a plugins update fn they can be accessed via `events[‘pupil_positions’]`
+ Gaze mapping now happens in a dedicated plugin. This plugin must be instantiated by the calibration plugin when it is finished. 
+ Gaze positions are now treated separately from pupil_posisitons. If a gaze position in available you will find it in `events[‘gaze’]`
+ The eye process will always report a pupil_position. If no pupil was found confidence is `0` and the measurement should be ignored. 
+ `Pupil confidence threshold` is now part of `world.py`. Gaze mapping plugins shall only map gaze if the pupil positions ‘confidence’ is above the user set `pupil_confidece_threshold`.

*Minor changes*

+ Window size is now remembered
+ Pupil confidence is now set in world the world window
+ Graphs in the top left show diagnostics: CPU load, framerate, and pupil confidence.
+ Screen Marker calibration has been improved with user-settable marker size and speed.

## Feedback 

As always, we’d be happy to receive your feedback. If you spot any typos, bugs, or have an idea for a new feature feature - please raise an issue at: github.com/pupil-labs/pupil/issues

We look forward to seeing what you do with Pupil :)