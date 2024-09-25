package router

import (
	"context"
	"cybernetics/internal/consts"
	"cybernetics/internal/controller/admin/admin"
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
			admin.Dept, // 部门
		)
	})
}
