extends Control

func refresh_viz():
	visible = $'..'.total_amount > 0

# Called when the node enters the scene tree for the first time.
func _ready():
	refresh_viz()

func _on_entry_total_amount_updated():
	refresh_viz()
