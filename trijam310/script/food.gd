extends CharacterBody2D
signal ate

func _on_player_collision(area: Area2D) -> void:
	emit_signal('ate')
	print('mangé')
	queue_free()
