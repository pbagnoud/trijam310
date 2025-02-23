extends Node2D
@onready var spawn_food_timer: Timer = $Spawn_food_timer
@onready var pv: ProgressBar = $PV

@onready var spawn_area: ColorRect = $spawn_area
var food_scene = preload("res://scene/food.tscn")
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
