@tool
extends Node

## Inspiration for WebXR initializing code credited to XRTools by Bastiaan Olij.

## This signal is emitted when XR becomes active. For OpenXR this corresponds
## with the 'openxr_focused_state' signal which occurs when the application
## starts receiving XR input, and for WebXR this corresponds with the
## 'session_started' signal.
signal xr_started

## This signal is emitted when XR ends. For OpenXR this corresponds with the
## 'openxr_visible_state' state which occurs when the application has lost
## XR input focus, and for WebXR this corresponds with the 'session_ended'
## signal.
signal xr_ended

## If true, the XR interface is automatically initialized
@export var auto_initialize : bool = true

## If true, the XR passthrough is enabled (OpenXR only)
@export var enable_passthrough : bool = false: set = _set_enable_passthrough

## Physics rate multiplier compared to HMD frame rate
@export var physics_rate_multiplier : int = 1

## If non-zero, specifies the target refresh rate
@export var target_refresh_rate : float = 0

# Reference to introduction packed scene as an instantiatated control node.
var intro : AspectRatioContainer

## Current XR Interface.
var xr_interface : XRInterface

## XR active flag
var xr_active : bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	if !Engine.is_editor_hint() and auto_initialize:
		initialize()
		
		# Manually listen for when introduction video has finished.
		intro = $XROrigin3D/XRCamera3D/IntroControl.intro
		intro.finished.connect(_on_intro_finished)

		# Disable visibility to make room for 2D introduction GUI.
		# Visibility is re-enabled once intro is finished.
		$Pantheon.visible = false


# Perform all necessary setup to use WebXR in Godot.
func initialize() -> bool:
	# Check for WebXR interface
	xr_interface = XRServer.find_interface('WebXR')
	if xr_interface:
		return _setup_for_webxr()

	# No XR interface
	xr_interface = null
	print("No XR interface detected")
	return false
		#DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		#Engine.physics_ticks_per_second = 90

# Check for configuration issues
func _get_configuration_warnings() -> PackedStringArray:
	var warnings := PackedStringArray()

	if physics_rate_multiplier < 1:
		warnings.append("Physics rate multiplier should be at least 1x the HMD rate")

	return warnings


# Handle changes to the enable_passthrough property
func _set_enable_passthrough(p_new_value : bool) -> void:
	# Save the new value
	enable_passthrough = p_new_value

	# Only actually start our passthrough if our interface has been instanced
	# if not this will be delayed until initialise is successfully called.
	if xr_interface:
		if enable_passthrough:
			# unset enable_passthrough if we can't start it.
			enable_passthrough = xr_interface.start_passthrough()
		else:
			xr_interface.stop_passthrough()


# Perform WebXR setup
func _setup_for_webxr() -> bool:
	print("WebXR: Configuring interface")

	# Connect the WebXR events
	xr_interface.connect("session_supported", _on_webxr_session_supported)
	xr_interface.connect("session_started", _on_webxr_session_started)
	xr_interface.connect("session_ended", _on_webxr_session_ended)
	xr_interface.connect("session_failed", _on_webxr_session_failed)

	# WebXR currently has no means of querying the refresh rate, so use
	# something sufficiently high
	Engine.physics_ticks_per_second = 144

	# If the viewport is already in XR mode then we are done.
	if get_viewport().use_xr:
		return true

	# This returns immediately - our _webxr_session_supported() method
	# (which we connected to the "session_supported" signal above) will
	# be called sometime later to let us know if it's supported or not.
	xr_interface.is_session_supported("immersive-vr")

	# Report success
	return true


# Handle WebXR session supported check
func _on_webxr_session_supported(session_mode: String, supported: bool) -> void:
	if session_mode == "immersive-vr":
		if supported:
			# WebXR supported - show canvas on web browser to enter WebVR
			$EnterWebXR.visible = true
		else:
			OS.alert("Your web browser doesn't support VR. Sorry!")


# Called when the WebXR session has started successfully
func _on_webxr_session_started() -> void:
	print("WebXR: Session started")

	# Hide the canvas and switch the viewport to XR
	$EnterWebXR.visible = false
	get_viewport().use_xr = true

	# Report the XR starting
	xr_active = true
	emit_signal("xr_started")


# Called when the user ends the immersive VR session
func _on_webxr_session_ended() -> void:
	print("WebXR: Session ended")

	# Show the canvas and switch the viewport to non-XR
	$EnterWebXR.visible = true
	get_viewport().use_xr = false

	# Report the XR ending
	xr_active = false
	emit_signal("xr_ended")


# Called when the immersive VR session fails to start
func _on_webxr_session_failed(message: String) -> void:
	OS.alert("Unable to enter VR: " + message)
	$EnterWebXR.visible = true


# Handle the Enter VR button on the WebXR browser
func _on_enter_webxr_button_pressed() -> void:
	# Configure the WebXR interface
	xr_interface.session_mode = 'immersive-vr'
	xr_interface.requested_reference_space_types = 'bounded-floor, local-floor, local'
	xr_interface.required_features = 'local-floor'
	xr_interface.optional_features = 'bounded-floor'

	# Initialize the interface. This should trigger either _on_webxr_session_started
	# or _on_webxr_session_failed
	if not xr_interface.initialize():
		OS.alert("Failed to initialize WebXR")


# Called when introduction video finishes playing.
func _on_intro_finished() -> void:
	$Pantheon.visible = true
