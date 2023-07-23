extends Area2D

var sprite_mat = preload("res://shader/outline_material.tres")
var sprite: Node2D

func _ready():
	sprite = $'./sprite'
	sprite.material = sprite_mat
	sprite.material.set_shader_parameter('line_color', Vector4(1, 1, 1, 0.8))

func _mouse_enter():
	sprite.material.set_shader_parameter('line_color', Vector4(1, 1, 1, 1))
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _mouse_exit():
	sprite.material.set_shader_parameter('line_color', Vector4(1, 1, 1, 0.8))
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
