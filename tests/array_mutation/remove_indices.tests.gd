func test_empty_indices_no_change() -> TestCaseResult:
	var items := ["a", "b", "c"]
	ArrayUtility.ArrayMutation.remove_indices(items, [])
	return TestCaseResult.from_equals(["a", "b", "c"], items)


func test_single_index() -> TestCaseResult:
	var items := [10, 20, 30]
	ArrayUtility.ArrayMutation.remove_indices(items, [1])
	return TestCaseResult.from_equals([10, 30], items)


func test_multiple_indices() -> TestCaseResult:
	var items := [0, 1, 2, 3, 4]
	ArrayUtility.ArrayMutation.remove_indices(items, [1, 3])
	return TestCaseResult.from_equals([0, 2, 4], items)


func test_unsorted_indices() -> TestCaseResult:
	var items := [0, 1, 2, 3, 4]
	ArrayUtility.ArrayMutation.remove_indices(items, [3, 1])
	return TestCaseResult.from_equals([0, 2, 4], items)


func test_all_items() -> TestCaseResult:
	var items := ["x", "y"]
	ArrayUtility.ArrayMutation.remove_indices(items, [0, 1])
	return TestCaseResult.from_equals([], items)
