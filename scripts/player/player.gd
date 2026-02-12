class_name Player 

extends CharacterBody2D
@onready var health_label: Label = $health_label

@onready var animations: AnimatedSprite2D = $AnimatedSprite2D

@onready var state_machine: Node = $"state_machine"

var health = 100

func _ready() -> void:
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	if health==0:
		get_tree().change_scene_to_file("res://scenes/start_menu.tscn")

func _process(delta: float) -> void:
	state_machine.process_frame(delta)


func _on_hp_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		health-=5
	health_label.text="health:"+str(health)
