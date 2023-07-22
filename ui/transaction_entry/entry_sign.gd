extends Label

func refresh_text():
	text = $'../..'.amount_sign

func _ready():
	refresh_text()

func _on_entry_unit_amount_set():
	refresh_text()
