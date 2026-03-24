# [`ArrayAggregation`](src/array_aggregation.gd)
## `sum(items: Array) -> void`
If items is empty, zero float is returned

## `sum_type_safe(items: Array, initial_value: Variant) -> void`


## `count_each_item(items: Array, key_func: Callable = func(x) -> void`
How many times is each item in the array? (key = item, value = count)

# [`ArrayCast`](src/array_cast.gd)
## `to_string_array(array: Array) -> void`


## `to_dict_array(array: Array) -> void`


## `copy_values(input: Array, out) -> void`


# [`ArrayDebug`](src/array_debug.gd)
## `print_items_on_newlines(items: Array, indent = "    ") -> void`


# [`ArrayMutation`](src/array_mutation.gd)
## `remove_indices(items: Array, indices: Array[int]) -> void`
Removes the values at indices forom items

# [`ArraySelection`](src/array_selection.gd)
## `min_by_key(array: Array, key_func: Callable) -> void`


# [`ArraySetOperations`](src/array_set_operations.gd)
## `unique(list: Array) -> void`


## `difference(source: Array, to_remove: Array, equals_override = EqualsOverride.equals_operator) -> void`
Get all the items in source that aren't in to_remove

## `intersection(items1: Array, items2: Array, key_func: Callable = func(x) -> void`


# [`ArraySorting`](src/array_sorting.gd)
## `sorted(list: Array) -> void`


