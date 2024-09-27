package storager

import (
	"context"
	"cybernetics/internal/model"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

var config *model.UploadConfig

func SetConfig(c *model.UploadConfig) {
	config = c
}

func GetConfig() *model.UploadConfig {
	return config
}

func GetModel(ctx context.Context) *gdb.Model {
	return g.Model("sys_attachment").Ctx(ctx)
}
