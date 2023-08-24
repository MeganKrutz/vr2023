# Foley Prep VR Project Summer 2023
 VR Training module for the explanation of Foley Prep's tokenomics system for Foley
 tutors and students.

 Made in Godot 4.1 and [Godot XR Tools](https://github.com/GodotVR/godot-xr-tools) by Bastiaan Olij.

 This version of the project is configured to work as a WebXR webpage app.

![Demo of Program](src/images/demo.gif)

 ## Usage
 ### Prerequisites
 - Meta Quest 2

 For running off a PC browser (Recommended):
 - Either Edge, Firefox, or Chrome, updated to a version with WebXR support.
 - USB-C cable to use Quest Link. Connecting via Bluetooth with Airlink can be used in place of a USB-C cable.
 - [Oculus App](https://www.meta.com/help/quest/articles/getting-started/getting-started-with-rift-s/install-oculus-pc-app/) to connect Quest 2 to PC.

 ### How to launch

 To launch the web applet, either a PC web browser can be used, or the built-in Meta Quest Browser.
 The former is recommended for optimal performance.

 PC Browser with Quest Link:
 - Navigate to (WEBSITE), where  the app is hosted.
 - Launch the Oculus App.
 - Connect Meta Quest 2 to PC using either Quest Link or Air Link, and allow "connected device" (your PC) to access files.
 - Access "Quick Settings" on the menu bar, and select "Quest Link".
 - Select "launch" once your PC is successfully found.
 - After the loading screen finishes, select "Desktop" (monitor icon) to open your desktop.
 - Press "Enter VR" to enter the project.

 Launching off of built-in Meta Quest Browser:
 - On the home screen, select "App Library" on the bottom bar.
 - Open the "Meta Quest Browser"
 - Navigate to (WEBSITE), where the app is hosted.
 - Press "Enter VR" to enter the project.

 At any time, you may press the home button on the Quest right controller to exit the app.

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

