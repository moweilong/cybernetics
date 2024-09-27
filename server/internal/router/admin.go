package router

import (
	"context"
	"cybernetics/internal/consts"
	"cybernetics/internal/controller/admin/admin"
	"cybernetics/internal/controller/admin/common"
	"cybernetics/utility/simple"

	"github.com/gogf/gf/v2/net/ghttp"
)

func Admin(ctx context.Context, group *ghttp.RouterGroup) {
	// 兼容后台登录入口
	group.ALL("/login", func(r *ghttp.Request) {
		r.Response.RedirectTo("/admin")
	})

	group.Group(simple.RouterPrefix(ctx, consts.AppAdmin), func(group *ghttp.RouterGroup) {
		group.Bind(
			common.Site, // 基础
		)
		group.Bind(
			admin.Dept,   // 部门
			admin.Member, // 用户
			admin.Role,   // 路由
			admin.Menu,   // 菜单
			admin.Post,   // 岗位
		)
	})
}
