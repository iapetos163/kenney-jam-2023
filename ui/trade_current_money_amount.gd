extends Label

func refresh_text():
	var available_amount = $'../../..'.available_amount
	text = str(available_amount)


func _ready():
	refresh_text()

func _on_trade_ui_available_amount_updated():
	refresh_text()
