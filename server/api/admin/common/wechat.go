package common

import (
	"cybernetics/internal/model/input/commonin"

	"github.com/gogf/gf/v2/frame/g"
)

// WechatAuthorizeReq 微信用户授权
type WechatAuthorizeReq struct {
	g.Meta `path:"/wechat/authorize" method:"get" tags:"微信" summary:"微信用户授权"`
	commonin.WechatAuthorizeInp
}

type WechatAuthorizeRes struct {
	*commonin.WechatAuthorizeModel
}

// WechatAuthorizeCallReq 微信用户授权回调
type WechatAuthorizeCallReq struct {
	g.Meta `path:"/wechat/authorizeCall" method:"get" tags:"微信" summary:"微信用户授权"`
	commonin.WechatAuthorizeCallInp
}

type WechatAuthorizeCallRes struct {
	*commonin.WechatAuthorizeCallModel
}
