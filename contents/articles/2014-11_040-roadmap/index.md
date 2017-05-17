---
title: Roadmap for v0.4.0 and Hardware Updates
author: Pupil Dev Team
date: 2014-11-14
subtitle: "Its been a while since we've posted any development updates. The reason for the silence is because we've been busy developing new hardware, and are preparing for major changes in the upcoming v0.4.0 releases for Pupil Capture and Pupil Player..."
featured_img: "../../../../media/images/blog/demo_screenshot_20141124.png"
featured_img_thumb: "../../../../media/images/blog/thumb/demo_screenshot_20141124.png"
---

Its been a while since we've posted any development updates. The reason for the silence is because we've been busy developing new hardware, and are preparing for major changes in the upcoming v0.4.0 releases for Pupil Capture and Pupil Player. 

## Software - v0.4.0 Roadmap
We'd like to share our roadmap with you in order to give you an idea of what to expect for v0.4.0 and to get the community involved in the next release. 

Our development notes are notes below, and you can check out the [v0.4.0 milestones](https://github.com/pupil-labs/pupil/milestones/v0.4) on github. 

+ **GUI** - We will be replacing the current GUI with our very own GUI written from scratch. We've gotten a lot of feedback on the current GUI ([AntTweakBar](http://anttweakbar.sourceforge.net/doc/)), and we've been wanting to replace it for a while now - because we would like to have more control over the design and user experience as well as codebase. We're calling our new GUI **pyglui**, and it's open source (MIT license) and is designed to be a cross platform drop in GUI for Python coders. Source code is on [github](https://github.com/pupil-labs/pyglui).   
	+ Pupil Capture and Pupil Player will both use the new GUI. We hope that it will improve the user experience and accomodate a wider range of screen sizes/density.  
	+ The new GUI is similar to our current GUI AntTweakBar (ATB) but truly Python compatible. This means no need for ctyped variables.
	+ Uses render-to-texture for ultra low cpu when static.
	+ Designed to be used with glfw but should also run with other window managers as well.
	+ Requires OpenGL 1.1 with extensions for blending and framebufferobjects (FBO).
	+ Uses [pyfontstash](https://github.com/pupil-labs/pyfontstash) for rendering text. Cython bindings we made for Mikko Mononen awesome [fontstash](https://github.com/memononen/fontstash) library.
+ **Bilateral Support** - We're preparing everything for more generalized calibration and mapping, including volumetric mapping and bilateral mapping. Also in order to support bilateral/binocular headsets Pupil Capture will load automatically in bilateral mode when two eye cameras are detected. Check out work in progress on the [bilateral branch](https://github.com/pupil-labs/pupil/tree/bilateral) 
+ Windows - We've had a lot of requests for a Windows bundles in the past. We already have community members running Pupil Capture on Windows from source. Now we're working on a proper bundle for Windows. 
+ Plugin Autoloader - Pupil Capture will remember which plugins were opened last, and reopen them the next time you start the software. 
+ Dependency loader - Automatically load a plugin if it is required by another plugin, or warn if it is not loaded. We already doing something like this in Pupil Player - this will allow for an even more modular codebase where plugins can specify their dependencies. 

<img src="../../../media/images/demo_screenshot_20141124.png" class='Feature-image' alt="pyglui screenshot on Nov 24, 2014">

*Development screenshot of pyglui... coming soon to Pupil!*

## Hardware
We've continued to make a lot of minor changes to Pupil headsets like improved cable routing for Pupil Pro, and changes to nose bridge geometry to accommodate more users. But we're really excited to announce that we're going to be able to offer high speed eye cameras with frame-rates up to 120 frames per second. Higher frame rate eye capture will not only improve the pupil detection and therefore eye tracking performance, but also may allows us to detect more eye movement motifs! The high speed cameras should be available before the end of the year, and can be a drop in replacement/additional camera for existing Pupil Pro headsets.    

Bilateral - we mentioned above that we're developing software support for bilateral headsets, now we're gearing up to officially offer bilateral Pupil Pro headsets! We've been making bilateral headsets as custom builds for a while now for research groups, but never offered them officially because Pupil Capture did not officially support bilateral tracking, calibration, and mapping.

## Community 
**Pupil Google Group** - We're really happy to see so many members of the Pupil community contributing to the [Pupil Google Group](https://groups.google.com/forum/#!forum/pupil-discuss), asking questions, answering questions, and sharing progress. Keep the questions coming! Continue updating us on your progress in your own research - Pupil grows because of the community. 

**Pupil Wiki** - It's exciting to see contributions to the [Pupil Wiki](https://github.com/pupil-labs/pupil/wiki). The wiki is open to contributions from anyone. If you spot an error, find an area that needs improvement or updating, or a topic that isn't addressed - just make an edit.

**Forks** - There are currently 56 forks! If you want to make changes to Pupil Capture or Pupil Player, make a fork. It would be great to see more community contributed code.    

**Issues** - We're making an effort to use [issues on github](https://github.com/pupil-labs/pupil/issues) not just for bug reports, but also as a way to track our development progress. If you do find a bug, make sure to create an issue.  