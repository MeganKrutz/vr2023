@tool
extends StaticBody3D


# Play the waving animation when entering scene.
# "metarigAction_002" refers to the waving animation as imported from Blender.
func _ready():
	$TutorMesh/AnimationPlayer.play("metarigAction_002")
