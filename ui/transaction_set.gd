extends Control

signal total_diff_amount_updated

@export_enum('BUY', 'SELL')
var transaction_type: String

var Entry = preload("res://ui/transaction_entry/transaction_entry.tscn")

# { item_type: 'IRON', unit_amount: 10 }
var items: Array[Dictionary] = []
var entry_nodes: Array[Node] = []

var total_diff_amount = 0

func create_entry(item: Dictionary, y_offset: int):
	var node: Control = Entry.instantiate()
	node.set_size(Vector2(331, 32))
	node.set_offset(SIDE_TOP, y_offset)
	node.set_unit_amount(item['unit_amount'])
	node.connect('total_amount_updated', _on_entry_total_amount_updated)
	add_child(node)
	return node

func set_items(items_arr: Array[Dictionary]):
	items = items_arr
	for node in entry_nodes:
		node.queue_free()
	entry_nodes = []
	var y_offset = 0
	for item in items:
		entry_nodes.append(create_entry(item, y_offset))
		y_offset += 48

func _on_entry_total_amount_updated():
	var sum = 0
	for entry in entry_nodes:
		sum += entry.total_amount
	if transaction_type == 'BUY':
		sum *= -1
	total_diff_amount = sum
	total_diff_amount_updated.emit()
