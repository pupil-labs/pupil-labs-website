---
title: Pupil Capture & Pupil Player - Joint Release v0.3.9
author: Pupil Dev Team
date: 2014-05-21
subtitle: "We are pleased to announce another release of Pupil Player and Pupil Capture software..."
featured_img: "../../../../media/images/blog/v0.3.9_release_tag.png"
featured_img_thumb: "../../../../media/images/blog/thumb/v0.3.9_release_tag.png"
tag: {"caption":"v0.3.9","icon":"local_offer"}
---

We are pleased to announce another release of **Pupil Player** and **Pupil Capture** software. We usually aim to push new features every month, but we had been working on our [Technical Report](http://arxiv.org/abs/1405.0006 "Pervasive Eye Tracking and Mobile Gaze-based Interaction") and improved Pupil Pro Headsets -- available soon! Therefore we skipped one release cycle. Here's the list of new features and fixes:

<a href="https://github.com/pupil-labs/pupil/releases/tag/v0.3.9" class="Button" target="_blank">Download v0.3.9</a>

## Pupil Capture

+ Hardware time-stamping: Running Pupil Pro with Linux now uses hardware timestamps taken by the camera hardware at the start of exposure. Allowing temporal correlation of world and eye cam at unprecedented accuracy.
+ Audio capture. On Mac OS (requires <code>brew install sox</code>) and Ubuntu (just works) we can now record audio alongside video. Audio sources are selectable as a drop-down menu. Saved as world.wav file alongside world.avi. This is still quite beta and we don't do audio playback in player yet.
+ Frame rate for world camera is now forced to 24/30fps irrespective of environment lighting conditions.
+ Various small GUI tweaks and fixes
+ Added named textures for easy upload and re-use on GPU.
+ Settings files and recording data are now cross platform compatible. 

## Pupil Player

+ Offline Marker Tracker: A new plugin as been added, the offline marker tracker. We had gotten many requests for this and hope that you will find it useful! Functionally similar to the Capture marker tracker, this plugin searches all frames in the background and adds useful extras for analysis. Check out the heat-maps and data export! Have a a look at our demo video. Try it out in the latest Pupil player with our demo dataset.
+ Various small GUI tweaks and other bug fixes.
+ Settings files and recording data are now cross platform compatible. 

Check out the offline marker tracking demo video.

<div class="Feature-video-container-16by9">
	<iframe class="Feature-video" src="//www.youtube.com/embed/71S858DPu8w?rel=0" frameborder="0" allowfullscreen></iframe>
</div>

## Bundles

+ Now supporting Ubuntu 14.04
+ MacOS bundles still have some issues with older hardware. 2012+ MacBooks appear to be fine.

Have fun with it and please report bugs you find them. Let us know how it goes on the [Pupil Google Group](https://groups.google.com/forum/#!forum/pupil-discuss "Pupil Google Group").