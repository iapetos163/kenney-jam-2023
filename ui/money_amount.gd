extends Label

func refresh_text():
	text = str($'/root/root'.money_amount)

func _ready():
	refresh_text()

func _on_root_money_amount_updated():
	refresh_text()
