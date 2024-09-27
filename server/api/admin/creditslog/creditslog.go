package creditslog

import (
	"cybernetics/internal/model/input/adminin"
	"cybernetics/internal/model/input/form"

	"github.com/gogf/gf/v2/frame/g"
)

// ListReq 查询资产变动列表
type ListReq struct {
	g.Meta `path:"/creditsLog/list" method:"get" tags:"资产变动" summary:"获取资产变动列表"`
	adminin.CreditsLogListInp
}

type ListRes struct {
	form.PageRes
	List []*adminin.CreditsLogListModel `json:"list"   dc:"数据列表"`
}

// ExportReq 导出资产变动列表
type ExportReq struct {
	g.Meta `path:"/creditsLog/export" method:"get" tags:"资产变动" summary:"导出资产变动列表"`
	adminin.CreditsLogListInp
}

type ExportRes struct{}
