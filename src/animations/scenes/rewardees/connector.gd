@tool
extends StaticBody3D


# Play the waving animation when entering scene.
# "metarig_002Action" refers to the waving animation as imported from Blender.
func _ready():
	$ConnectorMesh/AnimationPlayer.play("metarig_002Action")
