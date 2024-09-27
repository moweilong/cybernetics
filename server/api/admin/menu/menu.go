package menu

import (
	"cybernetics/internal/model/input/adminin"
	"cybernetics/internal/model/input/form"

	"github.com/gogf/gf/v2/frame/g"
)

// EditReq 修改/新增菜单
type EditReq struct {
	g.Meta `path:"/menu/edit" method:"post" tags:"菜单" summary:"修改/新增菜单"`
	adminin.MenuEditInp
}

type EditRes struct{}

// DeleteReq 删除菜单
type DeleteReq struct {
	g.Meta `path:"/menu/delete" method:"post" tags:"菜单" summary:"删除菜单"`
	adminin.MenuDeleteInp
}

type DeleteRes struct{}

// ListReq 获取菜单列表
type ListReq struct {
	g.Meta `path:"/menu/list" method:"get" tags:"菜单" summary:"获取菜单列表"`
	adminin.MenuListInp
}

type ListRes struct {
	*adminin.MenuListModel
	form.PageRes
}
