---
title: Pupil 0.3.4 Release
author: Pupil Dev Team
date: 2013-10-21
subtitle: We have been busy working on Pupil in the last month and want to share updates!
---

We have been busy working on Pupil in the last month and want to share updates!

<p><a href="https://github.com/pupil-labs/pupil/releases/tag/v0.3.4" class="Button">Download v0.3.4</a></p>

We are putting work into Pupil pretty much every day.  Here is a summary:

###GLFW3
  * We upgraded to GLFW3 which comes with multi-window and monitor support and many more good things
  * This means that we change a dependency [see install instructions](https://code.google.com/p/pupil/wiki/Installing_Dependecies installation instructions on the wiki)
###Pupil Streaming
  * We're using [0MQ](http://zeromq.org/ "Zero M Q documentation") so that Pupil Capture can now stream gaze coordinates locally and via network.
  * See [wiki for documentation](https://code.google.com/p/pupil/wiki/Streaming_Data streaming data on wiki) 
###UI work
  * Say goodbye to the Player window!  We decided to get rid of a permanent window for calibration.  Now the window is created only when needed.
  * Say hello to Plug-in windows.  We can now create any number of windows (calibration) on any screen and even in Fullscreen!

###New data format
This change was introduced a few weeks ago, and the wiki already reflects the new change.  Data is now always timestamped.
Eye and World are correlated in time using the timestamps and only when needed during playback and calibration.

###Slow transition: Google Code to Github
We are slowly moving to Github but we will keep everything mirrored on google code as well.

For now the codebase is hosted on [Google code](http://code.google.com/p/pupil) and [Github](http://github.com/pupil-labs/pupil)

###Pupil as a bundled Application
We know many users don't need to modify Pupil source code and have run into trouble installing all the necessary dependencies. This is why we are creating bundled applications -- check it out for yourself!

  * Go to [our Github releases](https://github.com/pupil-labs/pupil/releases/) and download the standalone application for your platform --currently Mac/Ubuntu only.
  * Installation is super easy.  It only requires unzipping the downloaded folder. Thats it!
  * While it is easy to unzip the folder, please understand that this is very beta. Please send feedback!

###Master = Dev
We think that most members of the Pupil community will want to run the bundled version and not have to fiddle around with dependencies.  Therefore, we are going to do development in the master and sometimes create special branches for features. 

  * Branch switching scripts are removed. 
  * Master will hold most of the latest development code.  It is expected work most of the time.
  * New features and experiments will live in dedicated branches and merge once they are mature or become obsolete.

Continue the discussion on the [Pupil-Discuss Google group](https://groups.google.com/d/msg/pupil-discuss/NVnYO_45pT8/FA5v07RJZqoJ "cross post on google groups")