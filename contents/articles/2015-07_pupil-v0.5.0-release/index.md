---
title: Pupil v0.5.0 Release
date: Mon Jul 03 2015 13:31:39 GMT+0700 (ICT)
author: Pupil Dev Team
subtitle: "We are very excited to release our latest set of improvements to the Pupil project with v0.5.x ..."
featured_img: "../../../../media/images/blog/v0.5.0_release_tag.png"
featured_img_thumb: "../../../../media/images/blog/thumb/v0.5.0_release_tag.png"
tag: {"caption":"v0.5.0","icon":"local_offer"}
---

We are very excited to release our latest set of improvements to the Pupil project

<a href="https://github.com/pupil-labs/pupil/releases" class="Button">Download Pupil v0.5.0</a>

## New Features

  - New unified video capture backend: pyUVC - No more patching of Linux. Single USB support everywhere!
  - MJPEG recording option. (Uses no CPU but makes bigger files, currently for Linux only -Mac works when running from source).
  - Fixation detector for Pupil Player.
  - Pupil and gaze data is now also saved in a pickled file. We use this internally for Pupil Player
  - Now you can open a different recording in Pupil Player simply by dragging it onto an existing window.
  - Pupil Player now opens a blank window when started without recording. You can drag and drop a recording into this "dummy" to open a recording.


## Bugfixes and minor Improvements

  - Windows and menus always remember their size and position
  - Settings from previous software versions are ignored.
  - Many minor UI tweaks
  - Mac OS cursor does not hide on resize
  - Fixed bug that occurred on some Ubuntu machines on window resize
  - Simplified HDPI handling
  - Multiple Player export bugfixes
  - Various other bugfixes
  - Now using GLFW3.1
  - Updated and streamlined GLFW bindings
  - Updated pyglui to v0.3

As always, we’d be happy to receive your feedback. If you spot any typos, bugs, or have an idea for a new feature feature - please raise an issue at: [github.com/pupil-labs/pupil/issues](https://github.com/pupil-labs/pupil/issues 'issues on github')

We look forward to seeing what you do with Pupil :)

------
 
## v0.5.4 Update

We just released v0.5.4: 

MJPEG recording is now officially implemented and supported on Mac and Linux both in bundle and running from source. 

Unlike version 0.5.3 we no longer rely on a `ffmpeg` executable to be present for this. Its back to simply download and install the bundle.

<a href="https://github.com/pupil-labs/pupil/releases/tag/v0.5.4" class="Button">Download Pupil v0.5.4</a>

------

## v0.5.5 Hotfix for Pupil Player 

This release fixes a bug that prevented `mjpeg` recordings to be exported. 

<a href="https://github.com/pupil-labs/pupil/releases/tag/v0.5.5" class="Button">Download Pupil Player v0.5.5</a>

