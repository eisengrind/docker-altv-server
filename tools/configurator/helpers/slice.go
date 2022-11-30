package helpers

func Contains[T comparable](ts []T, t T) bool {
	for _, x := range ts {
		if x == t {
			return true
		}
	}

	return false
}
