extends Node2D

signal money_amount_updated

var money_amount = 1000

var buy_items: Array[Dictionary] = [{ 'item_type': 'IRON', 'unit_amount': 15 }]
var sell_items: Array[Dictionary] = [{ 'item_type': 'IRON', 'unit_amount': 10 }]

func _on_trade_ui_submitted(net_diff_amount: int):
	money_amount += net_diff_amount
	money_amount_updated.emit()

func _on_npc_trader_input_event(_viewport: Node, event: InputEvent, _shape_idx: int):
	if event is InputEventMouseButton and event.is_pressed():
		var trade = $'./trade_ui'
		trade.set_available_amount(money_amount)
		trade.set_buy_items(buy_items)
		trade.set_sell_items(sell_items)
		trade.visible = true
