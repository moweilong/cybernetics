package auth

import "github.com/go-kratos/kratos/v2/errors"

// ErrAuthFail is a predefined error that represents an authentication failure.
// This error occurs when a token is missing or incorrect.
var ErrAuthFail = errors.New(401, "Authentication failed", "Missing token or token incorrect")
