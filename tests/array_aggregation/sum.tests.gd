var _color_equals: Callable = preload("./color_equals.gd").color_equals


func test_empty_returns_zero() -> ScriptTestResult:
	return ScriptTestResult.from_equals(0.0, ArrayAggregation.sum([]))


func test_single_int_returns_value_as_int() -> ScriptTestResult:
	return ScriptTestResult.from_equals(3, ArrayAggregation.sum([3]))


func test_multiple_ints_returns_sum() -> ScriptTestResult:
	var items := [1, 2, 3, 4]
	return ScriptTestResult.from_equals(10, ArrayAggregation.sum(items))


func test_mixed_ints_and_floats_returns_sum() -> ScriptTestResult:
	var items := [1, 2.5, 3, 4.25]
	return ScriptTestResult.from_equals(10.75, ArrayAggregation.sum(items))


func test_negative_numbers_returns_sum() -> ScriptTestResult:
	var items := [-2, 5, -3.5]
	return ScriptTestResult.from_equals(-0.5, ArrayAggregation.sum(items))


func test_vector2_returns_vector_sum() -> ScriptTestResult:
	var items := [Vector2(1, 2), Vector2(-3, 4), Vector2(0.5, -1)]
	return ScriptTestResult.from_equals(Vector2(-1.5, 5), ArrayAggregation.sum(items))


func test_vector3_returns_vector_sum() -> ScriptTestResult:
	var items := [Vector3(1, 2, 3), Vector3(-3, 4, 0.5), Vector3(0, -1, 2)]
	return ScriptTestResult.from_equals(Vector3(-2, 5, 5.5), ArrayAggregation.sum(items))


func test_vector4_returns_vector_sum() -> ScriptTestResult:
	var items := [Vector4(1, 2, 3, 4), Vector4(-3, 4, 0.5, -2), Vector4(0, -1, 2, 1.5)]
	return ScriptTestResult.from_equals(Vector4(-2, 5, 5.5, 3.5), ArrayAggregation.sum(items))


func test_color_returns_color_sum() -> ScriptTestResult:
	var items := [Color(0.1, 0.2, 0.3, 0.4), Color(0.9, -0.2, 0.1, 0.6)]
	return ScriptTestResult.from_equals(Color(1.0, 0.0, 0.4, 1.0), ArrayAggregation.sum(items), "", _color_equals)
