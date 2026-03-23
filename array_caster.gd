class_name ArrayCaster


static func to_string_array(array: Array) -> Array[String]:
	return copy_values(array, [] as Array[String])


static func to_dict_array(array: Array) -> Array[Dictionary]:
	return copy_values(array, [] as Array[Dictionary])


static func copy_values(input: Array, out):
	for value in input: out.append(value)
	return out