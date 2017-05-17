---
title: New Pupil Pro Headset + Capture Software 0.3.7
author: Pupil Dev Team
date: 2014-01-22
subtitle: "We're starting the new year with a lot of energy and some big updates here at Pupil Labs..."
featured_img: "../../../media/images/blog/pro-front-r20-crop.png"
featured_img_thumb: "../../../media/images/blog/thumb/pro-front-r20-crop.png" 
---

We're starting the new year with a lot of energy and some big updates here at Pupil Labs. 

+ We are super excited to announce new **Pupil Pro** mobile eye tracking headsets - with lots of design and camera upgrades! 
+ We have also just wrapped up another Pupil Capture software release - `v0.3.7` - that includes support for the new Pupil Pro cameras, selectable capture in the GUI, and updates to `manual marker` calibration. 
+ And last, but not least, we've migrated the [Pupil wiki to github](http://github.com/pupil-labs/pupil/wiki "Pupil Wiki") and will be editing and improving the content on a rolling basis.

Check out the new Pupil Pro and update to Pupil Capture 0.3.7, and let us know what you think!

<div class="Grid Grid--1of2">
  <div class="Grid-cell">
    <a href="/pupil" class="Button">Check Out Pupil Pro</a>
  </div>
  <div class="Grid-cell">
    <a href="https://github.com/pupil-labs/pupil/releases/tag/v0.3.7" class="Button">Download v0.3.7</a>

  </div>
</div>

## **Pupil Pro** - Mobile Eye Tracking Headset

<div class="Grid Grid--1of2">
  <div class="Grid-cell">
    <img src="../../../media/images/pro-front-r20-crop.png" class="Feature-image" alt="Pupil Pro front">
    <p>
    We've added new - <em>smaller</em> - cameras and have designed new - <em>adjustable</em> - camera mounts for Pupil Pro to better track all eyes.  A smaller camera footprint means that the Eye Camera is less visible within the your field of view, and significantly lighter, and higher resolution image - the eye cam now captures at 640x480 pixel resolution.  
    </p>
  </div>
  <div class="Grid-cell">
   <img src="../../../media/images/pupil-pro-eye-cam-adjustable-arm.png" class="Feature-image" alt="Pupil Pro adjustable Eye Camera arm">
   <p class="col-md-6">
    The adjustable mount can orbit around a ball joint and can be telescope-extended in order to capture better images of the eye, improve tracking robustness, and comfort of the user/wearer.
  </p>
  </div>
</div>

## Changes in Pupil Capture v0.3.7
This update includes a series of improvements and additions to existing features. Here's a summary of what we've been working on.

### Manual Marker Calibration
For those who haven't used manual marker calibration - check out the [calibration page on the wiki](https://github.com/pupil-labs/pupil/wiki/Pupil-Capture#manual-marker-calibration "Manual Marker Calibration") for a quick review. Previously manual marker calibration only supported one concentric circle marker. Now we support two! This enables you to stop calibration simply by showing a slightly different marker. No more need to walk back to the computer when done calibrating - just show the stop marker! 

<div class="Grid Grid--1of2">
  <div class="Grid-cell">
    <img src="../../../media/images/manual_calibration_marker-01.png" class="Feature-image" alt="Calibration Pattern - Start">
    <p>
    <code>circular calibration marker</code> - Used to calibrate as usual. Check the <a href="http://github.com/pupil-labs/pupil/wiki/Pupil-Capture#calibration" alt="Pupil Wiki - Calibration">Pupil Github wiki</a> for instructions.
    </p>
  </div>
  <div class="Grid-cell">
   <img src="../../../media/images/manual_calibration_marker-02.png" class="Feature-image" alt="Pupil Calibration Pattern - Stop">
   <p>
    <code>stop calibration marker</code> - Looks similar to circular calibration marker but has a white center. Show this marker to the World Camera and the calibration will stop.
  </p>
  </div>
</div>

We've also added a progress indicator so the operator can see when the duration of when they are collecting samples. We've also improved detection robustness as some users had trouble with false positives.

### Selectable Capture
During runtime you can now select which camera to capture from (Mac & Linux only for now). This is integrated into the GUI via a drop down menu. Known issues: On Linux you should not select the same capture in more than one window simultaneously, otherwise you can expect a crash.

### Support for the new Pupil Pro headset
A few tweaks have been made to enable the use of new cameras in the Pupil Pro headset. In making these changes we were careful not to drop any other hardware from the support list. So this change really only affects those with a new Pupil Pro headset.

## Wiki Migration to Github
We have been busy coding, designing, taking care of business, and had let the Pupil wiki fall into a depreciated state. It was way past time for a rewrite and major update. We have not only updated many parts of the wiki content but we have also decided to migrate everything to a github wiki, for ease of maintenance.  We're still working on the wiki but, it's already an improvement in terms of format and content (we think!).  Oh yah - we designed some new icons in the process.  [Take a look at the new wiki](http://github.com/pupil-labs/pupil/wiki "Pupil Labs Wiki"), let us know if you'd like to contribute, or where we need to improve!

## Coming Soon
In the last update we said we were going to be working on a browser to visualize captured data and load plugins in order to analyze results from Pupil Capture.  We are...and we've made progress.  We're calling it **Pupil Player**.  We hope to have a release available soon!  In the meantime, you can follow our work the [Pupil Player branch](https://github.com/pupil-labs/pupil/tree/pupil_player "Pupil Player - Git Branch") on github.