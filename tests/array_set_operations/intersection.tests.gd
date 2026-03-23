func test_emptyArrays_resultIn_empty():
	return ScriptTestResult.contains_same_items([], ArraySetOperations.intersection([], []))


func test_firstContainsOne_secondEmpty_resultIn_empty():
	return ScriptTestResult.contains_same_items([], ArraySetOperations.intersection([0], []))


func test_firstEmpty_secondContainsOne_resultIn_empty():
	return ScriptTestResult.contains_same_items([], ArraySetOperations.intersection([], [0]))


func test_sameItemInEach_resultsIn_oneItem():
	return ScriptTestResult.contains_same_items([0], ArraySetOperations.intersection([0], [0]))
