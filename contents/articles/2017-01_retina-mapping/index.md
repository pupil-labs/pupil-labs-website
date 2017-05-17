--- 
title: Retinotopic to Spatiotopic Mapping in Blind Patients
date: Wed Feb 01 2017 10:36:53 GMT+0700 (ICT) 
author: Pupil Dev Team 
subtitle: "Pupil eye tracking tools used in conjunction with retinal prothesis measure the accuracy in mapping simulated retinal signals to world coordinates..."
featured_img: "../../../../media/images/blog/epiretinal-array-dark.png"
featured_img_thumb: "../../../../media/images/blog/thumb/epiretinal-array.png" 
---


Current retinal implant systems (see [Argus II](http://www.2-sight.com/g-the-argus-ii-prosthesis-system-pf-en.html)) use images from a scene in order to create electrical stimulations on a patient's retina. These systems have been shown to be helpful in assisting blind people to accomplishing activities of daily living. However, current retinal implant systems have a narrow field of view (18 degrees x 11 degrees for Argus II) which require the participant to move their head in order to scan a scene. Avi Caspi et al., argue that integrating eye tracking to retinal implant systems will will enable patients to use more natural eye movements to scan the scene.

<div align="center">
	<img src="../../../../media/images/blog/thumb/epiretinal-array.png" class='Feature-image u-padBottom--1' alt="Epiretinal Array of Electrodes" style="width: 50%;">
	<div class="small u-padBottom--3">Fundus image of the epiretinal array of 60 electrodes implanted in a patient's eye. [Image source](http://iovs.arvojournals.org/article.aspx?articleid=2597840#149774812)
	</div>
</div>

Avi Caspi et al., demonstrate that, "the brain accurately maps the artificial vision induced by a retinal prothesis based on instantaneous gaze position" and that "remapping based on eye position is feasible and will increase visual stability in prosthetic vision." The researchers combined a modified Pupil headset with the Argus II system in order to develop calibration procedures for the implanted blind patients and measured accuracy in mapping simulated retinal signals to real-world coordinates.

For a sighted individual calibration with a Pupil eye tracker is a quick and easy process. A user looks at a marker in the scene that is simultaneously detected by the world camera. The location of the marker and pupil center are captured and coorelated temporally, and a mapping can be established in order to estimate the gaze of the participant.  

However, "with blind subjects, calibration of eye tracking is not a trivial matter." The researchers developed a calibration procedure by activating specific clusters of electrodes in the retinal implant. For each cluster activated, the researchers then asked the participants to hold a red ball at arm's length and align the red ball with the location of the "light". The red ball was used as a marker that could be tracked in the space of the world camera. The researchers then know the position of the pupil, the location of the stimulus on the retina, and the position of the marker within the world camera space. With these known coordinates the researchers are able to solve a system of equations to establish a 2d mapping from pupil coordinates to gaze coordinates.

The results from the study have shown that the brain has the required signals to process stimulated retinal coordinates based on the crucial step in measuring the position of the eyes relative to the orbit to build a correct representaion of the spatial coordinates accurately.

Check out the their full research paper [here](http://iovs.arvojournals.org/article.aspx?articleid=2597840#149774812).

If you use Pupil in your research and have published work, please send us a note. We would love to include your work here on the blog and in a list of [work that cites Pupil](https://docs.google.com/spreadsheets/d/1ZD6HDbjzrtRNB4VB0b7GFMaXVGKZYeI0zBOBEEPwvBI/).