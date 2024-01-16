extends Node

@export var EnemyTemplate: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_spawn_timer_timeout():
	var mob = EnemyTemplate.instantiate()
	var groundSize = $Ground/MeshInstance3D.mesh.size
	mob.position.x = (randf()*groundSize.x) - groundSize.x/2
	mob.position.z = (randf()*groundSize.z) - groundSize.z/2
	mob.caught.connect($UserInterface/ScoreLabel._on_mob_caught)
	add_child(mob)
