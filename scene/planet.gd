extends Node2D

signal money_amount_updated

var money_amount = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	$'./trade_ui'.set_available_amount(money_amount)

func _on_trade_ui_submitted(net_diff_amount: int):
	money_amount += net_diff_amount
	$'./trade_ui'.set_available_amount(money_amount)
	money_amount_updated.emit()
