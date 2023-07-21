extends LineEdit

func set_num_units(num_units: int):
	if num_units == 0:
		text = ''
	else:
		text = str(num_units)

func _ready():
	set_num_units($'../..'.num_units)

func _on_entry_num_units_updated():
	set_num_units($'../..'.num_units)
