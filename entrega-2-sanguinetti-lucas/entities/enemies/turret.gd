extends Sprite2D

var player

@export var proyectile_scene:PackedScene

@onready var fire_position:Marker2D = $FirePosition

var projectile_container:Node

func set_values(player, projectile_container):
	self.player = player
	self.projectile_container = projectile_container
	$Timer.start()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	fire()

func fire():
	var projectile:Projectile = proyectile_scene.instantiate()
	projectile_container.add_child(projectile)
	projectile.set_starting_values(fire_position.global_position, (player.global_position - fire_position.global_position).normalized())
	projectile.connect("delete_requested", Callable(self, "on_proyectile_delete_requested"))
	
	
func on_proyectile_delete_requested(projectile):
	projectile_container.remove_child(projectile)
	projectile.queue_free()
