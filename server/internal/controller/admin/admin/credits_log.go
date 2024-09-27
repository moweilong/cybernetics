package admin

import (
	"context"
	"cybernetics/api/admin/creditslog"
	"cybernetics/internal/service"
)

var (
	CreditsLog = cCreditsLog{}
)

type cCreditsLog struct{}

// List 查看资产变动列表
func (c *cCreditsLog) List(ctx context.Context, req *creditslog.ListReq) (res *creditslog.ListRes, err error) {
	list, totalCount, err := service.AdminCreditsLog().List(ctx, &req.CreditsLogListInp)
	if err != nil {
		return
	}

	res = new(creditslog.ListRes)
	res.List = list
	res.PageRes.Pack(req, totalCount)
	return
}

// Export 导出资产变动列表
func (c *cCreditsLog) Export(ctx context.Context, req *creditslog.ExportReq) (res *creditslog.ExportRes, err error) {
	err = service.AdminCreditsLog().Export(ctx, &req.CreditsLogListInp)
	return
}
