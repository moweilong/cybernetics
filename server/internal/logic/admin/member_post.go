package admin

import (
	"context"
	"cybernetics/internal/dao"
	"cybernetics/internal/model/entity"
	"cybernetics/internal/service"

	"github.com/gogf/gf/v2/errors/gerror"
)

type sAdminMemberPost struct{}

func NewAdminMemberPost() *sAdminMemberPost {
	return &sAdminMemberPost{}
}

func init() {
	service.RegisterAdminMemberPost(NewAdminMemberPost())
}

// UpdatePostIds 更新用户岗位
func (s *sAdminMemberPost) UpdatePostIds(ctx context.Context, memberId int64, postIds []int64) (err error) {
	if _, err = dao.AdminMemberPost.Ctx(ctx).Where(dao.AdminMemberPost.Columns().MemberId, memberId).Delete(); err != nil {
		err = gerror.Wrap(err, "清理用户旧岗位数据失败，请稍后重试！")
		return
	}

	for i := 0; i < len(postIds); i++ {
		_, err = dao.AdminMemberPost.Ctx(ctx).OmitEmptyData().Insert(entity.AdminMemberPost{
			MemberId: memberId,
			PostId:   postIds[i],
		})
		if err != nil {
			err = gerror.Wrap(err, "加入用户岗位数据失败，请稍后重试！")
			return err
		}
	}
	return
}
