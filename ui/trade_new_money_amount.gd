extends Label

func refresh_text():
	var available_amount = $'../../..'.available_amount
	var net_diff_amount = $'../../..'.net_diff_amount
	text = str(available_amount + net_diff_amount)


func _ready():
	refresh_text()

func _on_trade_ui_available_amount_updated():
	refresh_text()

func _on_trade_ui_net_diff_amount_updated():
	refresh_text()
