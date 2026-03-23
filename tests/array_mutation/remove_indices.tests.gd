func test_empty_indices_no_change() -> ScriptTestResult:
	var items := ["a", "b", "c"]
	ArrayMutation.remove_indices(items, [])
	return ScriptTestResult.from_equals(["a", "b", "c"], items)


func test_single_index() -> ScriptTestResult:
	var items := [10, 20, 30]
	ArrayMutation.remove_indices(items, [1])
	return ScriptTestResult.from_equals([10, 30], items)


func test_multiple_indices() -> ScriptTestResult:
	var items := [0, 1, 2, 3, 4]
	ArrayMutation.remove_indices(items, [1, 3])
	return ScriptTestResult.from_equals([0, 2, 4], items)


func test_unsorted_indices() -> ScriptTestResult:
	var items := [0, 1, 2, 3, 4]
	ArrayMutation.remove_indices(items, [3, 1])
	return ScriptTestResult.from_equals([0, 2, 4], items)


func test_all_items() -> ScriptTestResult:
	var items := ["x", "y"]
	ArrayMutation.remove_indices(items, [0, 1])
	return ScriptTestResult.from_equals([], items)
