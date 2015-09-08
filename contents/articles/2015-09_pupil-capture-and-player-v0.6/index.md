---
 title: Pupil Capture and Player v0.6 Release
 date: Tue Sep 08 2015 15:25:54 GMT+0700 (ICT)
 author: Pupil Dev Team
 summary: Pupil Capture and Pupil Player v0.6 release notes. New features include Pupil Sync, visible logging feedback, and restructred video capture.
 ---

 ### New Features
 
  - **Pupil Sync** -- Synchronise and control recording and timebase across all Pupil Capture instances running in the same network. We think this will be useful for multiuser and multi-camera setups. (You can run Pupil Capture with a webcam (we recommend c930e) to incorporate additional synchronised recordings from other viewpoints.)
  - Added **visible logging feedback** within the World window. 
  - You can **auto load your own plugin** while running from the application bundle. Check out documentation on the [wiki]
  - **Restructured video capture** -- Pupil Capture now checks if a camera is already in use and allows to switch between all connected cameras and an additional 'fake capture'. You can now start Pupil Capture, connect the headset later and select the camera you want while the program runs. Multiple sessions of Pupil Capture can now be opened without it trying to open cameras that are already in use from a running Pupil Capture session.

  - Added slider enabling one to adjust the minimum marker size. This way you can **use much smaller markers**.

### Changes for developers
  - Recording meta info has been made more robust
  - Added a `time spent between frames` message in `events` for better counters and animations.
  - Added plugin notification scheme. Use `notify_all` to let other plugins know what your plugin does. Listen to other plugins with `on_notify`. It all happens [here](https://github.com/pupil-labs/pupil/blob/master/pupil_src/shared_modules/plugin.py#L82-L88) and [here](https://github.com/pupil-labs/pupil/blob/master/pupil_src/shared_modules/plugin.py#L105-L113)


Installation of Bundles is the usual. Windows release will trail this release by about a week. Please let us know if you spot anything buggy or have great ideas for improvement (small and big).