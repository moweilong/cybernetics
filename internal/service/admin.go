// ================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// You can delete these comments if you wish manually maintain this interface file.
// ================================================================================

package service

import (
	"context"
	"cybernetics/internal/library/cgorm/handler"
	"cybernetics/internal/model/input/adminin"
	"cybernetics/utility/tree"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/database/gredis"
)

type (
	IAdminDept interface {
		// Model 部门ORM模型
		Model(ctx context.Context, option ...*handler.Option) *gdb.Model
		// Delete 删除
		Delete(ctx context.Context, in *adminin.DeptDeleteInp) (err error)
		// VerifyUnique 验证部门唯一属性
		VerifyUnique(ctx context.Context, in *adminin.VerifyUniqueInp) (err error)
		// Edit 修改/新增
		Edit(ctx context.Context, in *adminin.DeptEditInp) (err error)
		// MaxSort 最大排序
		MaxSort(ctx context.Context, in *adminin.DeptMaxSortInp) (res *adminin.DeptMaxSortModel, err error)
		// View 获取指定部门信息
		View(ctx context.Context, in *adminin.DeptViewInp) (res *adminin.DeptViewModel, err error)
		// List 获取列表
		List(ctx context.Context, in *adminin.DeptListInp) (res *adminin.DeptListModel, err error)
		// GetName 获取部门名称
		GetName(ctx context.Context, id int64) (name string, err error)
		// VerifyDeptId 验证部门ID
		VerifyDeptId(ctx context.Context, id int64) (err error)
		// Option 获取当前登录用户可选的部门选项
		Option(ctx context.Context, in *adminin.DeptOptionInp) (res *adminin.DeptOptionModel, totalCount int, err error)
		// TreeOption 获取部门关系树选项
		TreeOption(ctx context.Context) (nodes []tree.Node, err error)
	}
	IAdminMember interface {
		// AddBalance 增加余额
		AddBalance(ctx context.Context, in *adminin.MemberAddBalanceInp) (err error)
		// AddIntegral 增加积分
		AddIntegral(ctx context.Context, in *adminin.MemberAddIntegralInp) (err error)
		// UpdateCash 修改提现信息
		UpdateCash(ctx context.Context, in *adminin.MemberUpdateCashInp) (err error)
		// UpdateEmail 换绑邮箱
		UpdateEmail(ctx context.Context, in *adminin.MemberUpdateEmailInp) (err error)
		// UpdateMobile 换绑手机号
		UpdateMobile(ctx context.Context, in *adminin.MemberUpdateMobileInp) (err error)
		// UpdateProfile 更新用户资料
		UpdateProfile(ctx context.Context, in *adminin.MemberUpdateProfileInp) (err error)
		// UpdatePwd 修改登录密码
		UpdatePwd(ctx context.Context, in *adminin.MemberUpdatePwdInp) (err error)
		// ResetPwd 重置密码
		ResetPwd(ctx context.Context, in *adminin.MemberResetPwdInp) (err error)
		// VerifyUnique 验证管理员唯一属性
		VerifyUnique(ctx context.Context, in *adminin.VerifyUniqueInp) (err error)
		// Delete 删除用户
		Delete(ctx context.Context, in *adminin.MemberDeleteInp) (err error)
		// Edit 修改/新增用户
		Edit(ctx context.Context, in *adminin.MemberEditInp) (err error)
		// View 获取用户信息
		View(ctx context.Context, in *adminin.MemberViewInp) (res *adminin.MemberViewModel, err error)
		// List 获取用户列表
		List(ctx context.Context, in *adminin.MemberListInp) (list []*adminin.MemberListModel, totalCount int, err error)
		// Status 更新状态
		Status(ctx context.Context, in *adminin.MemberStatusInp) (err error)
		// GenTree 生成关系树
		GenTree(ctx context.Context, pid int64) (level int, newTree string, err error)
		// LoginMemberInfo 获取登录用户信息
		LoginMemberInfo(ctx context.Context) (res *adminin.LoginMemberInfoModel, err error)
		// MemberLoginStat 用户登录统计
		MemberLoginStat(ctx context.Context, in *adminin.MemberLoginStatInp) (res *adminin.MemberLoginStatModel, err error)
		// GetIdByCode 通过邀请码获取用户ID
		GetIdByCode(ctx context.Context, in *adminin.GetIdByCodeInp) (res *adminin.GetIdByCodeModel, err error)
		// Select 获取可选的用户选项
		Select(ctx context.Context, in *adminin.MemberSelectInp) (res []*adminin.MemberSelectModel, err error)
		// GetIdsByKeyword 根据关键词查找符合条件的用户ID
		GetIdsByKeyword(ctx context.Context, ks string) (res []int64, err error)
		// VerifySuperId 验证是否为超管
		VerifySuperId(ctx context.Context, verifyId int64) bool
		// LoadSuperAdmin 加载超管数据
		LoadSuperAdmin(ctx context.Context)
		// ClusterSyncSuperAdmin 集群同步
		ClusterSyncSuperAdmin(ctx context.Context, message *gredis.Message)
		// FilterAuthModel 过滤用户操作权限
		// 非超管用户只能操作自己的下级角色用户，并且需要满足自身角色的数据权限设置
		FilterAuthModel(ctx context.Context, memberId int64) *gdb.Model
	}
)

var (
	localAdminDept IAdminDept
	localAdminMember     IAdminMember
)

func AdminDept() IAdminDept {
	if localAdminDept == nil {
		panic("implement not found for interface IAdminDept, forgot register?")
	}
	return localAdminDept
}

func RegisterAdminDept(i IAdminDept) {
	localAdminDept = i
}

func AdminMember() IAdminMember {
	if localAdminMember == nil {
		panic("implement not found for interface IAdminMember, forgot register?")
	}
	return localAdminMember
}

func RegisterAdminMember(i IAdminMember) {
	localAdminMember = i
}