static func print_items_on_newlines(items: Array, indent := "    ") -> void:
	var items_str: String = ""
	for item in items:
		var item_str := "\"%s\"" % item if item is String else str(item)
		items_str += "\n" + indent + item_str
	print("[%s\n]" % items_str)

