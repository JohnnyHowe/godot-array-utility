class JunkObject:
	var value

	@warning_ignore("SHADOWED_VARIABLE")
	func _init(value) -> void:
		self.value = value

	func _to_string() -> String:
		return "JunkObject(%s)" % value


func test_emptyArray_resultsIn_null() -> ScriptTestResult:
	return ScriptTestResult.from_equals(null, ArrayUtility.ArraySelection.min_by_key([], func(item): return item))


func test_singleItem_returns_item() -> ScriptTestResult:
	var items := [5]
	return ScriptTestResult.from_equals(5, ArrayUtility.ArraySelection.min_by_key(items, func(item): return item))


func test_multipleItems_minByValue_returns_smallest() -> ScriptTestResult:
	var items := [5, 2, 7, 3]
	return ScriptTestResult.from_equals(2, ArrayUtility.ArraySelection.min_by_key(items, func(item): return item))


func test_customObjects_withKeyFunc_returns_minObject() -> ScriptTestResult:
	var first := JunkObject.new(4)
	var second := JunkObject.new(-1)
	var third := JunkObject.new(2)
	var items := [first, second, third]
	return ScriptTestResult.from_equals(second, ArrayUtility.ArraySelection.min_by_key(items, func(item): return item.value))


func test_allKeysEqual_returns_firstItem() -> ScriptTestResult:
	var first := JunkObject.new(10)
	var second := JunkObject.new(10)
	var items := [first, second]
	return ScriptTestResult.from_equals(first, ArrayUtility.ArraySelection.min_by_key(items, func(_item): return 0))
