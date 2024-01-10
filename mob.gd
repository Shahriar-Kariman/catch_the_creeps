extends CharacterBody3D

@export var rotation_speed = 1

# Emmit when the player jumped on the mob.
signal caught

func _physics_process(delta):
	transform = transform.rotated_local(up_direction, rotation_speed*delta)

func catch():
	caught.emit() # sends a signal that an enemy has been caught.
	queue_free()
