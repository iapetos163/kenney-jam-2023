extends Control

@export
var available_amount: int = 0
var net_diff_amount = 0

signal available_amount_updated
signal net_diff_amount_updated

func set_available_amount(amount: int):
	available_amount = amount
	available_amount_updated.emit()

func refresh_net_diff_amount():
	var buy_diff_amount = $'./body_container/buy_container/buy_txn_set'.total_diff_amount
	var sell_diff_amount = $'./body_container/sell_container/sell_txn_set'.total_diff_amount
	net_diff_amount = buy_diff_amount + sell_diff_amount
	net_diff_amount_updated.emit()

func _on_buy_txn_set_total_diff_amount_updated():
	refresh_net_diff_amount()

func _on_sell_txn_set_total_diff_amount_updated():
	refresh_net_diff_amount()

