package main

import (
	"fmt"

	"github.com/moweilong/cybernetics/pkg/db"
	"github.com/spf13/pflag"
	"gorm.io/gen"
)

const helpText = `Usage: main [flags] arg [arg...]

This is a pflag example.

Flaos:
`

type Querier interface {
	// SELECT * FROM @@table WHERE name = @name AND role = @role
	FilterWithNameAndRole(name string) ([]gen.T, error)
}

var (
	addr     = pflag.StringP("address", "a", "127.0.0.1:3306", "MySQL host address.")
	username = pflag.StringP("username", "u", "cybernetics", "Username to connect to the database.")
	password = pflag.StringP("password", "p", "cybernetics(#)666", "Password to use when connecting to the database.")
	dbname   = pflag.StringP("db", "d", "cybernetics", "Database name to connect to.")

	// outPath   = pflag.String("outpath", "./store", "generated gorm query code's path.").
	modelPath = pflag.StringP("model-pkg-path", "m", "./model", "Generated model code's package name.")
	help      = pflag.BoolP("help", "h", false, "Show this help message.")

	usage = func() {
		fmt.Printf("%s", helpText)
		pflag.PrintDefaults()
	}
)

func main() {
	pflag.Usage = usage
	pflag.Parse()

	if *help {
		pflag.Usage()
		return
	}

	dbOptions := &db.MySQLOptions{
		Addr:     *addr,
		Username: *username,
		Password: *password,
		Database: *dbname,
	}

	dbIns, err := db.NewMySQL(dbOptions)
	if err != nil {
		panic(err)
	}

	// if you want to query without context constrain, set mode gen.WithoutContext ###
	g := gen.NewGenerator(gen.Config{
		// OutPath:      *outPath,
		// OutFile:      filepath.Base(*outPath) + ".go",
		Mode:         gen.WithDefaultQuery | gen.WithQueryInterface,
		ModelPkgPath: *modelPath,
		// if you want to generate index tags from database, set FieldWithIndexTag true
		FieldWithIndexTag: true,
		FieldWithTypeTag:  true,
		// if you need unit tests for query code, set WithUnitTest true
		WithUnitTest: true,
	})

	// reuse the database connection in Project or create a connection here
	// if you want to use GenerateModel/GenerateModelAs, UseDB is necessary or it will panic
	g.UseDB(dbIns)

	g.GenerateModelAs("api_chain", "ChainM", gen.FieldIgnore("placeholder"))
	g.GenerateModelAs("api_minerset", "MinerSetM", gen.FieldIgnore("placeholder"))
	g.GenerateModelAs("api_miner", "MinerM", gen.FieldIgnore("placeholder"))
	g.GenerateModelAs("uc_user", "UserM", gen.FieldIgnore("placeholder"))
	g.GenerateModelAs("uc_secret", "SecretM", gen.FieldIgnore("placeholder"))
	// g.ApplyInterface(func(Querier) {}, model.MinerModel{})

	// execute the action of code generation
	g.Execute()
}
