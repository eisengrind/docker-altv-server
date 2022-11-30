package helpers

func Ref[T any](t T) *T {
	return &t
}
