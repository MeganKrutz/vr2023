# Foley Prep VR Project Summer 2023
 VR Training module for the explanation of Foley Prep's tokenomics system for Foley
 tutors and students.

 Made in Godot 4.1 and [Godot XR Tools](https://github.com/GodotVR/godot-xr-tools) by Bastiaan Olij.

![Demo of Program](src/images/demo.gif)

 ## Usage
 ### Prerequisites
 - Windows 10/11.
 - Meta Quest 2 with USB-C cable to use Quest Link. Connecting via Bluetooth with Airlink can be used in place of a USB-C cable.
 - [Oculus App](https://www.meta.com/help/quest/articles/getting-started/getting-started-with-rift-s/install-oculus-pc-app/) to connect Quest 2 to PC.
 - foleyvr.exe as downloaded from releases.

 ### How to launch
 - Launch the Oculus App.
 - Connect Meta Quest 2 to PC using either Quest Link or Air Link, and allow "connected device" (your PC) to access files.
 - Access "Quick Settings" on the menu bar, and select "Quest Link".
 - Select "launch" once your PC is successfully found.
 - After the loading screen finishes, select the monitor icon to open your desktop.
 - Launch the executable foleyvr.exe to enter the project.

 ### Controls
 For basic movement, use the right control stick to move forwards, backwards, and strafe left to right.
 Use the left control stick to change camera direction by 45°.

 Use the left trigger button to aim and teleport to a specified location.
 Use the grip buttons to reach out and pick up items off pedestals.

 Hold down right trigger in front of a pedestal to activate a hold button.
 Hold down the button to completion to activate an instructive video.

 ## Source File Organization
 - animations - OGVs/Scenes for video content.
 - images - Assets for image content (including this repository).
 - objects - .GLBs/Scenes for all solid objects (including pickable objects).
 - player - Scenes relevant for setting up player input.
 - sounds - Sound effect assets.

