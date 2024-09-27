// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// AdminCreditsLogDao is the data access object for table c9s_admin_credits_log.
type AdminCreditsLogDao struct {
	table   string                 // table is the underlying table name of the DAO.
	group   string                 // group is the database configuration group name of current DAO.
	columns AdminCreditsLogColumns // columns contains all the column names of Table for convenient usage.
}

// AdminCreditsLogColumns defines and stores column names for table c9s_admin_credits_log.
type AdminCreditsLogColumns struct {
	Id          string // 变动ID
	MemberId    string // 管理员ID
	AppId       string // 应用id
	AddonsName  string // 插件名称
	CreditType  string // 变动类型
	CreditGroup string // 变动组别
	BeforeNum   string // 变动前
	Num         string // 变动数据
	AfterNum    string // 变动后
	Remark      string // 备注
	Ip          string // 操作人IP
	MapId       string // 关联ID
	Status      string // 状态
	CreatedAt   string // 创建时间
	UpdatedAt   string // 修改时间
}

// adminCreditsLogColumns holds the columns for table c9s_admin_credits_log.
var adminCreditsLogColumns = AdminCreditsLogColumns{
	Id:          "id",
	MemberId:    "member_id",
	AppId:       "app_id",
	AddonsName:  "addons_name",
	CreditType:  "credit_type",
	CreditGroup: "credit_group",
	BeforeNum:   "before_num",
	Num:         "num",
	AfterNum:    "after_num",
	Remark:      "remark",
	Ip:          "ip",
	MapId:       "map_id",
	Status:      "status",
	CreatedAt:   "created_at",
	UpdatedAt:   "updated_at",
}

// NewAdminCreditsLogDao creates and returns a new DAO object for table data access.
func NewAdminCreditsLogDao() *AdminCreditsLogDao {
	return &AdminCreditsLogDao{
		group:   "default",
		table:   "c9s_admin_credits_log",
		columns: adminCreditsLogColumns,
	}
}

// DB retrieves and returns the underlying raw database management object of current DAO.
func (dao *AdminCreditsLogDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of current dao.
func (dao *AdminCreditsLogDao) Table() string {
	return dao.table
}

// Columns returns all column names of current dao.
func (dao *AdminCreditsLogDao) Columns() AdminCreditsLogColumns {
	return dao.columns
}

// Group returns the configuration group name of database of current dao.
func (dao *AdminCreditsLogDao) Group() string {
	return dao.group
}

// Ctx creates and returns the Model for current DAO, It automatically sets the context for current operation.
func (dao *AdminCreditsLogDao) Ctx(ctx context.Context) *gdb.Model {
	return dao.DB().Model(dao.table).Safe().Ctx(ctx)
}

// Transaction wraps the transaction logic using function f.
// It rollbacks the transaction and returns the error from function f if it returns non-nil error.
// It commits the transaction and returns nil if function f returns nil.
//
// Note that, you should not Commit or Rollback the transaction in function f
// as it is automatically handled by this function.
func (dao *AdminCreditsLogDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
