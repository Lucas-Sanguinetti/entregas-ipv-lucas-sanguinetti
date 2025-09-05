extends Sprite2D


@onready var fire_Position:Marker2D = $FirePosition

@export var projectile_scene:PackedScene

var projectile_container:Node



func fire():
	var projectile_instance:Projectile = projectile_scene.instantiate()
	projectile_container.add_child(projectile_instance)
	projectile_instance.set_starting_values(fire_Position.global_position, (fire_Position.global_position - global_position).normalized())
	projectile_instance.connect("delete_requested", Callable(self, "on_proyectile_delete_requested"))
	
	
func on_proyectile_delete_requested(projectile):
	projectile_container.remove_child(projectile)
	projectile.queue_free()
