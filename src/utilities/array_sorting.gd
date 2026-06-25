static func sorted(items: Array) -> Array:
	var sorted_items = Array(items)
	sorted_items.sort()
	return sorted_items


## Returns a list of the indices of items sorted.
static func sorted_indices(items: Array) -> Array[int]:
	var indices := Array(range(items.size()))

	indices.sort_custom(
		func(index1: int, index2: int) -> bool:
			return items[index1] < items[index2]
	)

	return ArrayUtility.ArrayCast.copy_values(indices, [] as Array[int])
