func test_empty_array_returns_empty_indices() -> TestCaseResult:
	return TestCaseResult.from_equals([], ArrayUtility.ArraySorting.sorted_indices([]))


func test_single_item_returns_zero_index() -> TestCaseResult:
	return TestCaseResult.from_equals([0], ArrayUtility.ArraySorting.sorted_indices([5]))


func test_multiple_numbers_returns_indices_in_value_order() -> TestCaseResult:
	var items := [5, 2, 7, 3]
	return TestCaseResult.from_equals([1, 3, 0, 2], ArrayUtility.ArraySorting.sorted_indices(items))


func test_already_sorted_numbers_return_original_indices() -> TestCaseResult:
	var items := [1, 2, 3, 4]
	return TestCaseResult.from_equals([0, 1, 2, 3], ArrayUtility.ArraySorting.sorted_indices(items))


func test_reverse_sorted_numbers_return_reversed_indices() -> TestCaseResult:
	var items := [4, 3, 2, 1]
	return TestCaseResult.from_equals([3, 2, 1, 0], ArrayUtility.ArraySorting.sorted_indices(items))


func test_duplicate_values_keep_original_index_order_within_equal_values() -> TestCaseResult:
	var items := [3, 1, 3, 2, 1]
	return TestCaseResult.from_equals([1, 4, 3, 0, 2], ArrayUtility.ArraySorting.sorted_indices(items))


func test_negative_and_positive_numbers_return_indices_in_value_order() -> TestCaseResult:
	var items := [0, -10, 5, -2]
	return TestCaseResult.from_equals([1, 3, 0, 2], ArrayUtility.ArraySorting.sorted_indices(items))


func test_strings_return_indices_in_alphabetical_order() -> TestCaseResult:
	var items := ["pear", "apple", "banana"]
	return TestCaseResult.from_equals([1, 2, 0], ArrayUtility.ArraySorting.sorted_indices(items))


func test_source_array_is_not_mutated() -> TestCaseResult:
	var items := [5, 2, 7, 3]
	ArrayUtility.ArraySorting.sorted_indices(items)
	return TestCaseResult.from_equals([5, 2, 7, 3], items)
