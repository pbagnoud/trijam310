extends Node2D

@onready var audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer2D

func play_music():
	audio_stream_player.play()
