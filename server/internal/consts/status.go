package consts

import (
	"cybernetics/internal/library/dict"
	"cybernetics/internal/model"
)

func init() {
	dict.RegisterEnums("CodeStatusOptions", "验证码状态选项", CodeStatusOptions)
	dict.RegisterEnums("BlacklistStatusOptions", "黑名单拉黑状态选项", BlacklistStatusOptions)
}

// 状态码
const (
	StatusALL     int = -1 // 全部状态
	StatusEnabled int = 1  // 启用
	StatusDisable int = 2  // 禁用
	StatusDelete  int = 3  // 已删除
)

var StatusSlice = []int{StatusALL, StatusEnabled, StatusDisable, StatusDelete}

// 验证码状态
const (
	CodeStatusNotUsed = 1 // 未使用
	CodeStatusUsed    = 2 // 已使用
)

// CodeStatusOptions 验证码状态选项
var CodeStatusOptions = []*model.Option{
	dict.GenWarningOption(CodeStatusNotUsed, "未使用"),
	dict.GenSuccessOption(CodeStatusUsed, "已使用"),
}

const (
	BlacklistStatusDisable = 1 // 封禁中
	BlacklistStatusEnabled = 2 // 已解封
)

// BlacklistStatusOptions 黑名单拉黑状态选项
var BlacklistStatusOptions = []*model.Option{
	dict.GenWarningOption(BlacklistStatusDisable, "封禁中"),
	dict.GenSuccessOption(BlacklistStatusEnabled, "已解封"),
}
