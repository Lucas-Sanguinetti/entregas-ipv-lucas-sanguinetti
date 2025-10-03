extends PlayerState


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func enter() -> void:
	character.velocity.y -= character.jump_speed
	character._play_animation("jump")
	
func exit() -> void:
	pass

# Callback derivado de _input
func handle_input(event: InputEvent) -> void:
	pass

func update(delta: float) -> void:
	character._handle_move_input(delta)
	if character.h_movement_direction == 0:
		character._handle_deacceleration(delta)
	character._apply_movement(delta)
	if character.is_on_floor():
		if character.h_movement_direction == 0:
			finished.emit(&"idle")
		finished.emit(&"walk")
	else:
			if character.velocity.y > 0:
				character._play_animation(&"fall")
			else:
				character._play_animation(&"jump")

	
	
func _on_animation_finished(anim_name: StringName) -> void:
	pass

func handle_event(event: StringName, value = null) -> void:
	match event:
		&"hit":
			character._handle_hit(value)
			if character.dead:
				finished.emit(&"dead")
