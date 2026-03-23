class JunkObject:
	var value

	@warning_ignore("SHADOWED_VARIABLE")
	func _init(value) -> void:
		self.value = value	

	func _to_string() -> String:
		return "JunkObject(%s)" % value


func test_bothArraysEmpty_resultsIn_noDifference():
	var source := []
	var to_remove := []
	var expected := []
	return ScriptTestResult.contains_same_items(expected, ArraySetOperations.difference(source, to_remove))


func test_oneSourceItem_noRemove_resultsIn_oneItem():
	var source := ["item1"]
	var to_remove := []
	var expected := ["item1"]
	return ScriptTestResult.contains_same_items(expected, ArraySetOperations.difference(source, to_remove))


func test_oneSourceItem_oneRemove_resultsIn_noDifference():
	var source := ["item1"]
	var to_remove := ["item1"]
	var expected := []
	return ScriptTestResult.contains_same_items(expected, ArraySetOperations.difference(source, to_remove))


func test_threeCustomSourceAndRemoveItems_withSameValue_resultsIn_allValues():
	var source := [
		JunkObject.new(0),
		JunkObject.new(1),
		JunkObject.new(2),
	]

	var to_remove := [
		JunkObject.new(0),
		JunkObject.new(1),
		JunkObject.new(2),
	]

	var expected = source
	return ScriptTestResult.contains_same_items(expected, ArraySetOperations.difference(source, to_remove))


func test_threeCustomSourceAndRemoveItems_withSameValue_withCustomOverride_resultsIn_noDifference():
	var source := [
		JunkObject.new(0),
		JunkObject.new(1),
		JunkObject.new(2),
	]

	var to_remove := [
		JunkObject.new(0),
		JunkObject.new(1),
		JunkObject.new(2),
	]

	var expected := []
	var equals_override = func(a, b): return a.value == b.value
	return ScriptTestResult.contains_same_items(expected, ArraySetOperations.difference(source, to_remove, equals_override))

