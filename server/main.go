package main

import (
	"cybernetics/internal/global"
	_ "cybernetics/internal/packed"

	_ "cybernetics/internal/logic"

	"github.com/gogf/gf/v2/os/gctx"

	"cybernetics/internal/cmd"

	_ "github.com/gogf/gf/contrib/drivers/mysql/v2"
	_ "github.com/gogf/gf/contrib/nosql/redis/v2"
)

func main() {
	var ctx = gctx.GetInitCtx()
	global.Init(ctx)
	cmd.Main.Run(ctx)
}
