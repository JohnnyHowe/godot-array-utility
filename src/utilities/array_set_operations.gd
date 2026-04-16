static func unique(list: Array) -> Array:
	return Set.new(list).get_all_values()


## Get all the items in source that aren't in to_remove
static func difference(source: Array, to_remove: Array, equals_override := EqualsOverride.equals_operator) -> Array:
	var result = []
	for source_item in source:
		if not to_remove.any(func(item): return equals_override.call(source_item, item)):
			result.append(source_item)
	return result


static func intersection(items1: Array, items2: Array, key_func: Callable = func(x): return x) -> Array:
	var items1_count := ArrayUtility.ArrayAggregation.count_each_item(items1)

	var result := []
	for item in items2:
		var key = key_func.call(item)

		if items1_count.get(key, 0) > 0:
			items1_count[key] -= 1
			result.append(key)

	return result

