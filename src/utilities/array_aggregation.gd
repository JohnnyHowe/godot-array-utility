## If items is empty, zero float is returned
static func sum(items: Array) -> Variant:
	if items.size() == 0:
		return 0.0

	var result = items[0]
	for i in range(1, items.size()):
		result += items[i]

	return result


static func sum_type_safe(items: Array, initial_value: Variant) -> Variant:
	var result = initial_value
	for item in items:
		result += item
	return result


## How many times is each item in the array? (key = item, value = count)
static func count_each_item(items: Array, key_func: Callable = func(x): return x) -> Dictionary:
	var counts = {}
	for item in items:
		var key = key_func.call(item)
		if not counts.has(key):
			counts[key] = 0
		counts[key] += 1
	return counts

