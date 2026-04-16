var _color_equals: Callable = preload("./color_equals.gd").color_equals


func test_empty_returns_initial_value() -> ScriptTestResult:
	var initial_value := 5
	return ScriptTestResult.from_equals(initial_value, ArrayUtility.ArrayAggregation.sum_type_safe([], initial_value))


func test_single_int_adds_to_initial() -> ScriptTestResult:
	var initial_value := 10
	var items := [3]
	return ScriptTestResult.from_equals(13, ArrayUtility.ArrayAggregation.sum_type_safe(items, initial_value))


func test_multiple_numbers_adds_to_initial_float() -> ScriptTestResult:
	var initial_value := 1.5
	var items := [1, 2.5, -0.5]
	return ScriptTestResult.from_equals(4.5, ArrayUtility.ArrayAggregation.sum_type_safe(items, initial_value))


func test_vector2_adds_to_initial() -> ScriptTestResult:
	var initial_value := Vector2(1, 1)
	var items := [Vector2(2, 3), Vector2(-1, 0.5)]
	return ScriptTestResult.from_equals(Vector2(2, 4.5), ArrayUtility.ArrayAggregation.sum_type_safe(items, initial_value))


func test_color_adds_to_initial() -> ScriptTestResult:
	var initial_value := Color(0.1, 0.2, 0.3, 0.4)
	var items := [Color(0.2, 0.1, 0.0, 0.3)]
	return ScriptTestResult.from_equals(Color(0.3, 0.3, 0.3, 0.7), ArrayUtility.ArrayAggregation.sum_type_safe(items, initial_value), "", _color_equals)


func test_string_concatenation_uses_initial() -> ScriptTestResult:
	var initial_value := ""
	var items := ["a", "b", "c"]
	return ScriptTestResult.from_equals("abc", ArrayUtility.ArrayAggregation.sum_type_safe(items, initial_value))
