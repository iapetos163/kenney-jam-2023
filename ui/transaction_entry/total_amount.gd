extends Label

func refresh_text():
	text = str($'../..'.total_amount)


func _ready():
	refresh_text()

func _on_entry_total_amount_updated():
	refresh_text()
