package admin

import (
	"context"
	"cybernetics/api/admin/menu"
	"cybernetics/internal/service"
)

// Menu 菜单
var (
	Menu = cMenu{}
)

type cMenu struct{}

// Delete 删除
func (c *cMenu) Delete(ctx context.Context, req *menu.DeleteReq) (res *menu.DeleteRes, err error) {
	err = service.AdminMenu().Delete(ctx, &req.MenuDeleteInp)
	return
}

// Edit 更新
func (c *cMenu) Edit(ctx context.Context, req *menu.EditReq) (res *menu.EditRes, err error) {
	err = service.AdminMenu().Edit(ctx, &req.MenuEditInp)
	return
}

// List 获取列表
func (c *cMenu) List(ctx context.Context, req *menu.ListReq) (res menu.ListRes, err error) {
	res.MenuListModel, err = service.AdminMenu().List(ctx, &req.MenuListInp)
	return
}
