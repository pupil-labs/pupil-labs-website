---
title: Pupil 0.3.5 Release
author: Pupil Dev Team
date: 2013-11-14
subtitle: Another quick release of our recent development work on Pupil. Updates are recommended!
featured_img: "../../../../media/images/blog/v0.3.5_release_tag.png"
---

Another quick release of our recent development work on Pupil. Updates are recommended!

<a href="https://github.com/pupil-labs/pupil/releases/tag/v0.3.5" class="Button">Download v0.3.5</a>

## Improved Pupil Detection
The new Pupil detector is more sophisticated and should preform much better. The False Positive rate (ghost pupils) has been dramatically reduced.

We have used a load of eye recordings and can say that the new detector kill's our old version :-). Of course there is still lots left to improve and we have ideas to push pupil detection to new levels soon. But for now, here the release notes:

  * Pupil detection now pre-filters contours based on curvature properties.
  * Ellipse fitting now utilizes fitting error to discard bad ellipses
  * Our detector now matches and combines contour segments to find a maximally supported ellipse. 
  * The result is now augmented with a confidence measure (from 0 to 1).
  * New debug window for everybody that likes visual feedback from the pupil detector

Please have a look at the following parameters for the pupil detector:
  * pupil_intensity_range determines the degree of darkness required for edges to be considered (have a look at the eye image with algorithm  view active)
  * pupil_min & pupil_max the range of admissible pupil sizes, set accordingly.


## Improved Point Display
GL points now have custom shaders for improved display. This means that Linux users that experienced square points should now see proper circle points.

## Proper Logging
Pupil now uses a proper logging system and stream information into logfiles in the user_settings dir. This should simplify diagnostics and debugging

## Getting the Update
If you want to just use Pupil Software and don't need to make changes to the source code, you can download and run our latest standalone Pupil app bundles from our Github release page.

## Build dependencies
If you want to install dependencies yourself (this means not using the bundle packages), please note the followingchanges/additions:

### Mac

<code>
<pre class="bash">
pip install numexpr
</pre>
</code>

### Linux
Install new version on numpy, numexpr, scipy
<code>
<pre class="bash">
sudo pip install numpy
sudo pip install scipy
sudo pip install numexpr
sudo pip install matplotlib
</pre>
</code>

Install OpenCV 2.4.6.1 and dependencies via script

<code>
<pre class="bash">
curl https://raw.github.com/jayrambhia/Install-OpenCV/master/Ubuntu/2.4/opencv2_4_6_1.sh | sh
</pre>
</code>

Please let us know what you think and let us know if you find any bugs via github issues or on the forum!

## Next steps
We have not yet implemented screen tracking because we decided to first do a few things we think are important improvements (see above). But dont worry, a large part of the next release will be dedicated to screen tracking!
