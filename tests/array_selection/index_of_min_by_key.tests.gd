class JunkObject:
	var value

	@warning_ignore("SHADOWED_VARIABLE")
	func _init(value) -> void:
		self.value = value

	func _to_string() -> String:
		return "JunkObject(%s)" % value


func test_emptyArray_resultsIn_negativeOne() -> TestCaseResult:
	return TestCaseResult.from_equals(-1, ArrayUtility.ArraySelection.index_of_min_by_key([], func(item): return item))


func test_singleItem_returns_one() -> TestCaseResult:
	var items := [5]
	return TestCaseResult.from_equals(0, ArrayUtility.ArraySelection.index_of_min_by_key(items, func(item): return item))


func test_multipleItems_minByValue_returns_indexOfSmallest() -> TestCaseResult:
	var items := [5, 2, 7, 3]
	return TestCaseResult.from_equals(1, ArrayUtility.ArraySelection.index_of_min_by_key(items, func(item): return item))


func test_customObjects_withKeyFunc_returns_indexOfMinObject() -> TestCaseResult:
	var first := JunkObject.new(4)
	var second := JunkObject.new(-1)
	var third := JunkObject.new(2)
	var items := [first, second, third]
	return TestCaseResult.from_equals(1, ArrayUtility.ArraySelection.index_of_min_by_key(items, func(item): return item.value))


func test_allKeysEqual_returns_zero() -> TestCaseResult:
	var first := JunkObject.new(10)
	var second := JunkObject.new(10)
	var items := [first, second]
	return TestCaseResult.from_equals(0, ArrayUtility.ArraySelection.index_of_min_by_key(items, func(_item): return 0))
