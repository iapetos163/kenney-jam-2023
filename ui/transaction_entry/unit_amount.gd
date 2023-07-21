extends Label

func refresh_text():
	text = str($'..'.unit_amount)

func _ready():
	refresh_text()


func _on_entry_unit_amount_set():
	refresh_text()
