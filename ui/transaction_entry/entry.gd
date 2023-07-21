extends Control

var amount_sign: String = '-'
var unit_amount: int = 0
var num_units: int = 0
var total_amount: int = 0

signal total_amount_updated
signal num_units_updated
signal unit_amount_set

func recalc_total():
	total_amount = unit_amount * num_units
	total_amount_updated.emit()

func increase_num_units():
	if num_units >= 999:
		return
	num_units += 1
	recalc_total()
	num_units_updated.emit()

func decrease_num_units():
	if num_units <= 0:
		return
	num_units -= 1
	recalc_total()
	num_units_updated.emit()

func set_unit_amount(amount: int):
	unit_amount = amount
	unit_amount_set.emit()
	recalc_total()

func _on_num_units_text_changed(new_text: String):
	var new_value = int(new_text)
	if new_value > 999 or new_value < 0:
		return
	num_units = new_value
	recalc_total().emit()

func _on_dec_button_pressed():
	decrease_num_units()

func _on_inc_button_pressed():
	increase_num_units()
