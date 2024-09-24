package main

import (
	_ "cybernetics/internal/packed"

	"github.com/gogf/gf/v2/os/gctx"

	"cybernetics/internal/cmd"
)

func main() {
	cmd.Main.Run(gctx.GetInitCtx())
}
