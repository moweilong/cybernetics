// ================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// You can delete these comments if you wish manually maintain this interface file.
// ================================================================================

package service

import (
	"context"
	"cybernetics/internal/model/input/commonin"
)

type (
	ICommonWechat interface {
		// Authorize 微信用户授权
		Authorize(ctx context.Context, in *commonin.WechatAuthorizeInp) (res *commonin.WechatAuthorizeModel, err error)
		AuthorizeCall(ctx context.Context, in *commonin.WechatAuthorizeCallInp) (res *commonin.WechatAuthorizeCallModel, err error)
		// GetOpenId 从缓存中获取临时openid
		GetOpenId(ctx context.Context) (openId string, err error)
		GetCacheKey(typ string, ak string) string
		// CleanTempMap 清理临时map
		CleanTempMap(ctx context.Context)
	}
)

var (
	localCommonWechat ICommonWechat
)

func CommonWechat() ICommonWechat {
	if localCommonWechat == nil {
		panic("implement not found for interface ICommonWechat, forgot register?")
	}
	return localCommonWechat
}

func RegisterCommonWechat(i ICommonWechat) {
	localCommonWechat = i
}
