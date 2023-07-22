extends Control

var available_amount = 0
var net_diff_amount = 0

signal available_amount_updated
signal net_diff_amount_updated
signal submitted(net_diff_amount: int)

func set_available_amount(amount: int):
	available_amount = amount
	available_amount_updated.emit()

func set_buy_items(items: Array[Dictionary]):
	$'./body_container/buy_container/buy_txn_set'.set_items(items)
	refresh_net_diff_amount()

func set_sell_items(items: Array[Dictionary]):
	$'./body_container/sell_container/sell_txn_set'.set_items(items)
	refresh_net_diff_amount()

func refresh_net_diff_amount():
	var buy_diff_amount = $'./body_container/buy_container/buy_txn_set'.total_diff_amount
	var sell_diff_amount = $'./body_container/sell_container/sell_txn_set'.total_diff_amount
	net_diff_amount = buy_diff_amount + sell_diff_amount
	net_diff_amount_updated.emit()

func _on_buy_txn_set_total_diff_amount_updated():
	refresh_net_diff_amount()

func _on_sell_txn_set_total_diff_amount_updated():
	refresh_net_diff_amount()

func reset():
	set_buy_items([])
	set_sell_items([])

func _on_ok_button_pressed():
	visible = false
	submitted.emit(net_diff_amount)
	reset()
