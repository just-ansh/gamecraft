extends State
@onready var state_machine: Node = $".."

@export
var idle_state: State
@export
var attack_state: State

var direction
func enter() -> void:
	parent.animations.play("move_"+state_machine.dire)
	super()

func process_physics(delta: float) -> State:
	if Input.is_action_just_pressed("attack"):
		direction=Vector2.ZERO
		return attack_state
	if Input.is_action_pressed("left"):
		direction = Vector2.LEFT
		state_machine.dire="left"
	elif  Input.is_action_pressed("right"):
		direction = Vector2.RIGHT
		state_machine.dire="right"
	elif  Input.is_action_pressed("up"):
		direction = Vector2.UP
		state_machine.dire="up"
	elif  Input.is_action_pressed("down"):
		direction = Vector2.DOWN
		state_machine.dire="down"
	else:
		direction=Vector2.ZERO
	var movement = direction * move_speed
	
	if movement == Vector2.ZERO:
		return idle_state
	
	parent.animations.play("move_"+state_machine.dire)
	parent.velocity = movement
	parent.move_and_slide()
	return null
