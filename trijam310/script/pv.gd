extends ProgressBar

@onready var game_over: Label = $GameOver
@onready var timer: Timer = $Timer

const DYING_SPEED = 30
var REGEN = self.max_value/2
var current_score:float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.value= self.max_value

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	current_score = self.value
	self.value= current_score - DYING_SPEED*delta
	
	#Game Over
	if self.value < 0.01:
		game_over.visible = 1
		timer.start()

func _regen():
	self.value = min(self.value+REGEN,self.max_value)
	
func _on_timer_timeout():
	print("ok")
	get_tree().reload_current_scene()
	
	
