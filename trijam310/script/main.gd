extends Node2D
@onready var spawn_food_timer: Timer = $Spawn_food_timer
@onready var pv: ProgressBar = $PV
@onready var player: CharacterBody2D = $Player
@onready var spawn_garlic_timer: Timer = $Spawn_garlic_timer
@onready var spawn_area: ColorRect = $spawn_area
var food_scene = preload("res://scene/food.tscn")
var garlic_scene = preload("res://scene/ennemi.tscn")
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Audio.play_music()


# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_spawn_food_timer_timeout() -> void:
	var food = food_scene.instantiate()
	var random_position = Vector2(
		rng.randf_range(spawn_area.position.x, spawn_area.size.x),
		rng.randf_range(spawn_area.position.y, spawn_area.size.y))
	food.position = random_position
	add_child(food)
	food.ate.connect(pv._regen)
	spawn_food_timer.start()


func _on_spawn_garlic_timer_timeout() -> void:
	var garlic = garlic_scene.instantiate()
	var random_position = Vector2(
		rng.randf_range(spawn_area.position.x, spawn_area.size.x),
		rng.randf_range(spawn_area.position.y, spawn_area.size.y))
	garlic.position = random_position
	add_child(garlic)
	garlic.hit.connect(player._on_hit)
	if spawn_garlic_timer.wait_time > .5:
		spawn_garlic_timer.wait_time *=.85
	elif spawn_garlic_timer.wait_time > .2:
		spawn_garlic_timer.wait_time *=.95
	elif spawn_garlic_timer.wait_time > .1:
		spawn_garlic_timer.wait_time *=.999
	spawn_garlic_timer.start()
