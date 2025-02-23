extends Area2D
signal ate




func _on_body_entered(body: Node2D) -> void:
	emit_signal('ate')
	print('mangé')
	queue_free()
