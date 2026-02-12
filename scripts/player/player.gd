class_name Player 

extends CharacterBody2D

@onready var animations: AnimatedSprite2D = $AnimatedSprite2D

@onready var state_machine: Node = $"state_machine"

var health = 100

func _ready() -> void:
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

#func _physics_process(delta: float) -> void:
	#var direction= Input.get_vector("left","right","up","down")
	#velocity=direction*50
	#move_and_slide()
	#if direction!=Vector2.ZERO:
		#animated_sprite_2d.play("walk")
	##if animated_sprite_2d.is_playing():
	##	animated_sprite_2d.play("idle")
	#if Input.is_action_just_pressed("attack"):
		#print(1)
		#animated_sprite_2d.play("attack")
		#
