package blacklist

import (
	"cybernetics/internal/model/input/form"
	"cybernetics/internal/model/input/sysin"

	"github.com/gogf/gf/v2/frame/g"
)

// ListReq 查询列表
type ListReq struct {
	g.Meta `path:"/blacklist/list" method:"get" tags:"黑名单" summary:"获取黑名单列表"`
	sysin.BlacklistListInp
}

type ListRes struct {
	List []*sysin.BlacklistListModel `json:"list"   dc:"数据列表"`
	form.PageRes
}

// ViewReq 获取信息
type ViewReq struct {
	g.Meta `path:"/blacklist/view" method:"get" tags:"黑名单" summary:"获取指定信息"`
	sysin.BlacklistViewInp
}

type ViewRes struct {
	*sysin.BlacklistViewModel
}

// EditReq 修改/新增
type EditReq struct {
	g.Meta `path:"/blacklist/edit" method:"post" tags:"黑名单" summary:"修改/新增黑名单"`
	sysin.BlacklistEditInp
}

type EditRes struct{}

// DeleteReq 删除
type DeleteReq struct {
	g.Meta `path:"/blacklist/delete" method:"post" tags:"黑名单" summary:"删除黑名单"`
	sysin.BlacklistDeleteInp
}

type DeleteRes struct{}

// StatusReq 更新状态
type StatusReq struct {
	g.Meta `path:"/blacklist/status" method:"post" tags:"黑名单" summary:"更新黑名单状态"`
	sysin.BlacklistStatusInp
}

type StatusRes struct{}
