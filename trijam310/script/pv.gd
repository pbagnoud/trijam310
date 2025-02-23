extends ProgressBar

const DYING_SPEED = 8
var current_score:float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.value= self.max_value

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	current_score = self.value
	self.value= current_score - DYING_SPEED*delta
	
