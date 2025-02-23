extends Area2D

signal hit
var random_direction = Vector2()
var speed = 15
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	random_direction = Vector2.from_angle(randf() * 2 * PI) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += random_direction * delta


func _on_body_entered(body: Node2D) -> void:
	print("OUILLE")
	hit.emit()
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free 
