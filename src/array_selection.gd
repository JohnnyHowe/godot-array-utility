class_name ArraySelection


static func min_by_key(array: Array, key_func: Callable) -> Variant:
	if array.size() == 0:
		return null
	var min_item = array[0]
	var min_value = key_func.call(array[0])
	for item in array:
		var value = key_func.call(item)
		if value < min_value:
			min_value = value
			min_item = item
	return min_item
