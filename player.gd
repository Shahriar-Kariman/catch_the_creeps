extends CharacterBody3D

# Speed of the player.
@export var speed = 14
# Ground acceleration.
@export var fall_acceleration = 75

var target_velocity = Vector3.ZERO

func _physics_process(delta):
	var direction = Vector3.ZERO
	# Checking for input.
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
	
	# making the direction constant
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(position + direction, Vector3.UP)
	
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed
	
	if not is_on_floor():
		target_velocity.y = target_velocity.y - (fall_acceleration*delta)
	
	velocity = target_velocity
	move_and_slide()
	handle_collissions()

func handle_collissions():
	for index in range (get_slide_collision_count()):
		var collision = get_slide_collision(index)
		
		if collision.get_collider() == null:
			continue
		if collision.get_collider().is_in_group("mob"):
			var enemy = collision.get_collider()
			enemy.catch()
			break # prevent further duplicate calls?
