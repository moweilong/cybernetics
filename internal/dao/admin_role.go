// =================================================================================
// This is auto-generated by GoFrame CLI tool only once. Fill this file as you wish.
// =================================================================================

package dao

import (
	"cybernetics/internal/dao/internal"
)

// internalAdminRoleDao is internal type for wrapping internal DAO implements.
type internalAdminRoleDao = *internal.AdminRoleDao

// adminRoleDao is the data access object for table c9s_admin_role.
// You can define custom methods on it to extend its functionality as you wish.
type adminRoleDao struct {
	internalAdminRoleDao
}

var (
	// AdminRole is globally public accessible object for table c9s_admin_role operations.
	AdminRole = adminRoleDao{
		internal.NewAdminRoleDao(),
	}
)

// Fill with you ideas below.
