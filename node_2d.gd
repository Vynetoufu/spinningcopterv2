extends Node2D
@onready var plane: Sprite2D = $Plane
@onready var eating_sound: AudioStreamPlayer = $AudioStreamPlayer
@onready var helicopter: Sprite2D = $Helicopter


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#plane.position.x += 200 * delta
	if Input.is_action_pressed("ui_left"):
		plane.rotate(-1.5 * delta)
	if Input.is_action_pressed("ui_right"):
		plane.rotate(1.5 * delta)
	if Input.is_action_just_pressed("ui_accept"):
		eating_sound.play()
		plane.global_position = Vector2(350,150)
	
	var dir: Vector2 = plane.position.direction_to(helicopter.position)
	#plane.position += plane.transform.x * 60 * delta
	plane.translate(dir * 60 * delta)
	helicopter.rotate(1.5 * delta)
	helicopter.move_local_x(60.0 * delta)
	if Input.is_action_pressed("ui_left"):
		helicopter.rotate(-1.5 * delta)
	
