package main

import (
	_ "cybernetics/internal/packed"

	_ "cybernetics/internal/logic"

	"github.com/gogf/gf/v2/os/gctx"

	"cybernetics/internal/cmd"

	_ "github.com/gogf/gf/contrib/drivers/mysql/v2"
)

func main() {
	cmd.Main.Run(gctx.GetInitCtx())
}
