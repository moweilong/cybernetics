// =================================================================================
// This is auto-generated by GoFrame CLI tool only once. Fill this file as you wish.
// =================================================================================

package dao

import (
	"cybernetics/internal/dao/internal"
)

// internalAdminPostDao is internal type for wrapping internal DAO implements.
type internalAdminPostDao = *internal.AdminPostDao

// adminPostDao is the data access object for table c9s_admin_post.
// You can define custom methods on it to extend its functionality as you wish.
type adminPostDao struct {
	internalAdminPostDao
}

var (
	// AdminPost is globally public accessible object for table c9s_admin_post operations.
	AdminPost = adminPostDao{
		internal.NewAdminPostDao(),
	}
)

// Fill with you ideas below.