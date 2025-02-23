extends Area2D
signal ate

var old: bool = false


func _on_body_entered(body: Node2D) -> void:
	emit_signal('ate')
	print('mangé')
	queue_free()


func _on_uptime_timeout() -> void:
	if old :
		print("disparu")
		queue_free()
	else :
		$Sprite2D.frame = 1
		old = true
