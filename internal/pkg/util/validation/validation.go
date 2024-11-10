package validation

import "github.com/moweilong/cybernetics/internal/pkg/known"

func IsAdminUser(userID string) bool {
	return userID == known.AdminUserID
}
