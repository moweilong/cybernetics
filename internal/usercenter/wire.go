//go:build wireinject
// +build wireinject

// The build tag makes sure the stub is not built in the final build.

package usercenter

//go:generate go run -mod=mod github.com/google/wire/cmd/wire

import (
	"github.com/go-kratos/kratos/v2"
	"github.com/google/wire"

	"github.com/moweilong/cybernetics/internal/pkg/bootstrap"
	"github.com/moweilong/cybernetics/internal/pkg/validation"
	"github.com/moweilong/cybernetics/internal/usercenter/auth"
	"github.com/moweilong/cybernetics/internal/usercenter/biz"
	"github.com/moweilong/cybernetics/internal/usercenter/server"
	"github.com/moweilong/cybernetics/internal/usercenter/service"
	"github.com/moweilong/cybernetics/internal/usercenter/store"
	customvalidation "github.com/moweilong/cybernetics/internal/usercenter/validation"
	"github.com/moweilong/cybernetics/pkg/db"
	genericoptions "github.com/moweilong/cybernetics/pkg/options"
)

// wireApp builds and returns a Kratos app with the given options.
// It uses the Wire library to automatically generate the dependency injection code.
func wireApp(
	bootstrap.AppInfo,
	*server.Config,
	*db.MySQLOptions,
	*genericoptions.JWTOptions,
	*genericoptions.RedisOptions,
	*genericoptions.EtcdOptions,
	*genericoptions.KafkaOptions,
) (*kratos.App, func(), error) {
	wire.Build(
		bootstrap.ProviderSet,
		bootstrap.NewEtcdRegistrar,
		server.ProviderSet,
		store.ProviderSet,
		db.ProviderSet,
		biz.ProviderSet,
		service.ProviderSet,
		auth.ProviderSet,
		store.SetterProviderSet,
		NewAuthenticator,
		validation.ProviderSet,
		customvalidation.ProviderSet,
	)

	return nil, nil, nil
}
