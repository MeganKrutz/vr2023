@tool
extends StaticBody3D


# Play the waving animation when entering scene.
# "metarig_001Action_001" refers to the waving animation as imported from Blender.
func _ready():
	$StudentMesh/AnimationPlayer.play("metarig_001Action_001")
