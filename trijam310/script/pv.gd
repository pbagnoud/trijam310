extends ProgressBar

@onready var game_over: Label = $GameOver
@onready var timer: Timer = $Timer
@onready var color_rect: ColorRect = $ColorRect
 

const DYING_SPEED = 15
var REGEN = self.max_value/2


var current_score:float
var in_game_over = 0
var run_timer =0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.value= self.max_value

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	current_score = self.value
	self.value= current_score - DYING_SPEED*delta
	if in_game_over != 1:
		run_timer = run_timer+delta

	#Game Over
	if self.value < 0.01 and in_game_over == 0:
		color_rect.visible = 1
		game_over.text="Score = "+str(int(run_timer))
		game_over.visible = 1
		in_game_over = 1
		timer.start()

	

func _regen():
	self.value = min(self.value+REGEN,self.max_value)
	
func _on_timer_timeout():
	get_tree().reload_current_scene()
	
	
