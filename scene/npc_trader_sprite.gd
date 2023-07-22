extends Sprite2D


func _ready():
	material.set_shader_parameter('line_color', Vector4(1, 1, 1, 0.8))

func _on_npc_trader_mouse_entered():
	material.set_shader_parameter('line_color', Vector4(1, 1, 1, 1))
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)


func _on_npc_trader_mouse_exited():
	material.set_shader_parameter('line_color', Vector4(1, 1, 1, 0.8))
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)

