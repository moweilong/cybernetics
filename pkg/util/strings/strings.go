package strings

func StringIn(str string, array []string) bool {
	return FindString(array, str) > -1
}

func FindString(array []string, str string) int {
	for index, s := range array {
		if str == s {
			return index
		}
	}

	return -1
}
