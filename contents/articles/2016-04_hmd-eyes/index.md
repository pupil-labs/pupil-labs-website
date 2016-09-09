---
 title: Eye Tracking + Head Mounted Displays
 date: Thu Apr 28 2016 13:59:00 GMT+0700 (ICT)
 author: Pupil Dev Team
 subtitle: We propose a community driven, open source suite of software building blocks for eye tracking in Head Mounted Displays...
 featured_img: "../../../../media/images/blog/plopski_itoh_corneal-reflection.png"
 featured_img_thumb: "../../../../media/images/blog/thumb/plopski_itoh_corneal-reflection.png"
 --- 

After receiving many requests from the community, we have taken the first steps towards supporting eye tracking in Virtual Reality and Augmented Reality (VR/AR) head mounted displays (HMDs) with the release of eye tracking add-ons for Oculus DK2 and Epson Moverio BT-200. We are committed to bringing eye tracking to VR/AR HMDS, and plan to create new hardware for the latest VR and AR hardware when it hits the market. 

<img src="../../../../media/images/blog/plopski_itoh_corneal-reflection.png" class='Feature-image' alt="Plopski, Itoh, et al. Corneal Imaging">
Corneal reflection of an HMD screen. Image by Alexander Plopski, Yuta Itoh, et al. See their paper: [Corneal-Imaging Calibration for Optical See-Through Head-Mounted Displays](http://campar.in.tum.de/pub/itoh2015vr2/itoh2015vr2.pdf)

## Blackbox vs Open Source Building Blocks
Now that we have the hardware, the next step is to develop software for eye tracking in HMDs. Based on what we have learned from our community and our experience in experience developing Pupil, we believe that eye tracking in HMDs will not be a “one size fits all” solution. The various applications for eye tracking with AR and VR are extremely diverse and vastly unexplored. 

While other tools/frameworks may already exist for eye tracking in HMDs, the majority of the code remains closed – a blackbox – inhibiting those who want to learn more or make their own tools.  

This is why we propose a community driven, open source suite of software  **building blocks for eye tracking HMDs.**

In this first draft we propose to create software building blocks for:

+ Detecting pupil positions in images. This is quite similar to what we do already in Pupil Capture. 
+ Mapping pupil positions into the world/scene. 
+ Calibration; For HMDs this is very different from how calibration works in Pupil Capture. 
+ Other features that are needed for specific research and applications (eye ball location, slippage, ...)

As a researcher or developer exploring applications you want use eye tracking without having to develop the tool from start to finish. With building blocks like this becomes easier to put to together highly specific code for hmd eye tracking so you can concentrate your effort on the application and not the tool.

If you research and develop novel methods for eye tracking for HMDs, you may be interested in contributing your implementations so that others can test, evaluate, exchange, and improve.

## Build a community around Open-Source eye tracking for HMDs

Our goal is to work with and support a community of researchers and developers in creating reusable open-source software modules for eye tracking in HMDs. We know that many developers have already thought of or implemented eye tracking software for HMDs and instead of re-inventing wheels, we should form a community to share knowledge and tools. Pupil Labs will contribute to this project and assume a moderator/admin role but we hope that others will join and contribute to this collaborative endeavour.

We want to have collaboration built in to the project from the start. We really admire the way that ZeroMQ has built up a community and maintained an open source project. We propose to use the [Collective Code Construction Contract (C4.1)](http://rfc.zeromq.org/spec:22/C4.1), as it clearly and concisely defines structure and roles for a community driven project. 

We propose to use the [LGPLv3](http://www.gnu.org/licenses/lgpl-3.0.en.html) license, because it is permissive for use in commercial and non-commercial contexts while encouraging community contributions.

## No Hardware or Platform Lock-In

As with Pupil Capture and Pupil Player we are aiming for open standards and support of DIY and other research hardware. The libraries should not bind you to specific hardware. You can choose what to run it with.

No obligation and lock-in to use Pupil Labs hardware on a technical or licence level: We are happy if you like our hardware, and the revenue is used to fund ongoing software and hardware development, but we feel strongly that community contributions should be owned wholly by the community.

## The first steps

We are just getting started, and have created a repository for this work called hmd-eyes. See it on github: https://github.com/pupil-labs/hmd-eyes.

We added a mission.md file that shall outline the mission statement and key requirement of our collaborative project. We also added a collaboration.md file that outlines our proposed rules of collaboration and best practices.

For IM style chats we linked a Gitter room here: https://gitter.im/pupil-labs/hmd-eyes?utm_source=share-link&utm_medium=link&utm_campaign=share-link

Also sign up to the public email group if you want to post and be updated on the project here: https://groups.google.com/forum/#!forum/hmd-eyes


We would like to invite anyone who is interested in contributing to meet us via <a href="mailto:info@pupil-labs.com">email</a>, a private or a public hangouts call. In this initial phase the community should flesh a feature/wishlist, start contributing via pull requests. We are always happy to give involved members to become maintainers with write access to the repository.




