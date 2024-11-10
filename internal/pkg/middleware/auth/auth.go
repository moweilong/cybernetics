package auth

import "context"

type AuthProvider interface {
	Auth(ctx context.Context, token string, obj, act string) (userID string, allowed bool, err error)
}
