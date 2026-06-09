func test_empty() -> TestCaseResult:
	var items = []
	var counts = ArrayUtility.ArrayAggregation.count_each_item(items)
	return TestCaseResult.new(counts == {})


func test_single_int() -> TestCaseResult:
	var items = [0]
	var counts = ArrayUtility.ArrayAggregation.count_each_item(items)
	return TestCaseResult.new(counts == {0: 1})


func test_double_up_int_only() -> TestCaseResult:
	var items = [0, 0]
	var counts = ArrayUtility.ArrayAggregation.count_each_item(items)
	return TestCaseResult.new(counts == {0: 2})


func test_multiple_different_int_including_doubleups() -> TestCaseResult:
	var items = [0, 1, 2, 3, 4, 4, 2, 5]
	var counts = ArrayUtility.ArrayAggregation.count_each_item(items)
	return TestCaseResult.new(counts == {0: 1, 1: 1, 2: 2, 3: 1, 4: 2, 5: 1})
