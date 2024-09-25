package handler

// handler.
import (
	"github.com/gogf/gf/v2/database/gdb"
)

// Option 预处理选项
type Option struct {
	FilterAuth   bool // 过滤权限
	ForceCache   bool // 强制缓存
	FilterTenant bool // 过滤多租户权限
}

// DefaultOption 默认预处理选项
var DefaultOption = &Option{
	FilterAuth: true,
}

func Model(m *gdb.Model, opt ...*Option) *gdb.Model {
	var option *Option
	if len(opt) > 0 {
		option = opt[0]
	} else {
		option = DefaultOption
	}
	// if option.FilterAuth {
	// 	m = m.Handler(FilterAuth)
	// }
	if option.ForceCache {
		m = m.Handler(ForceCache)
	}
	// if option.FilterTenant {
	// 	m = m.Handler(FilterTenant)
	// }
	return m
}
