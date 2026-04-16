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


## Intentionally untyped "out" and return.
## This allows the duck typing.
static func map_as(array: Array, selection_func: Callable, out):
	for item in array:
		out.append(selection_func.call(item))
	return out


static func shuffle(array: Array, rng: RandomNumberGenerator) -> void:
	for i in array.size() - 2:
		var j := rng.randi_range(i, array.size() - 1)
		var tmp = array[i]
		array[i] = array[j]
		array[j] = tmp
