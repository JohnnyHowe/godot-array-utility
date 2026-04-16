class JunkObject:
	var value

	@warning_ignore("SHADOWED_VARIABLE")
	func _init(value) -> void:
		self.value = value

	func _to_string() -> String:
		return "JunkObject(%s)" % value


func test_empty_returns_empty() -> Array[ScriptTestResult]:
	return ScriptTestResult.contains_same_items([], ArrayUtility.ArraySetOperations.unique([]))


func test_no_duplicates_returns_same_items() -> Array[ScriptTestResult]:
	var items := [1, 2, 3]
	return ScriptTestResult.contains_same_items(items, ArrayUtility.ArraySetOperations.unique(items))


func test_duplicates_ints_returns_unique_items() -> Array[ScriptTestResult]:
	var items := [1, 2, 1, 3, 2, 2]
	return ScriptTestResult.contains_same_items([1, 2, 3], ArrayUtility.ArraySetOperations.unique(items))


func test_custom_objects_same_string_value_deduped() -> Array[ScriptTestResult]:
	var items := [
		JunkObject.new(1),
		JunkObject.new(1),
		JunkObject.new(2)
	]
	var results := ArrayUtility.ArraySetOperations.unique(items)
	var expected := [items[0], items[2]]
	return ScriptTestResult.contains_same_items(expected, results, func(a, b): return a.value == b.value)
