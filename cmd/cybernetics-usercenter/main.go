// usercenter is the user center of the cybernetics cloud platform.
package main

import (
	// Importing the package to automatically set GOMAXPROCS.
	_ "go.uber.org/automaxprocs/maxprocs"

	"github.com/moweilong/cybernetics/cmd/cybernetics-usercenter/app"
)

func main() {
	// Creating a new instance of the usercenter application and running it
	app.NewApp().Run()
}
