extends State
@onready var state_machine: Node = $".."

@export
var move_state: State
@export
var attack_state: State

func enter() -> void:
	super()
	parent.animations.play("idle_"+ state_machine.dire)
	parent.velocity = Vector2.ZERO

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("attack"):
		return attack_state
	if Input.is_action_just_pressed('left') or Input.is_action_just_pressed('right') or Input.is_action_just_pressed('up'
	) or Input.is_action_just_pressed('down'):
		return move_state
	return null
