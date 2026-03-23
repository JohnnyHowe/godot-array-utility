class_name ArrayMutation


## Removes the values at indices forom items
static func remove_indices(items: Array, indices: Array[int]) -> void:
	var sorted_indices := ArraySorting.sorted(indices)

	for i in range(sorted_indices.size()):
		var index = sorted_indices[i] - i

		items.remove_at(index)
