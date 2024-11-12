package zid

import "github.com/moweilong/cybernetics/pkg/id"

const defaultABC = "abcdefghijklmnopqrstuvwxyz1234567890"

type ZID string

const (
	// ID for the user resource in cybernetics-usercenter.
	User ZID = "user"
	// ID for the order resource in cybernetics-fakeserver.
	Order ZID = "order"
	// ID for the cronjob resource in cybernetics-nightwatch.
	CronJob ZID = "cronjob"
	// ID for the job resource in cybernetics-nightwatch.
	Job ZID = "job"
)

func (zid ZID) String() string {
	return string(zid)
}

func (zid ZID) New(i uint64) string {
	// use custom option
	str := id.NewCode(
		i,
		id.WithCodeChars([]rune(defaultABC)),
		id.WithCodeL(6),
		id.WithCodeSalt(Salt()),
	)
	return zid.String() + "-" + str
}
