package store

import (
	"context"

	"github.com/moweilong/cybernetics/internal/usercenter/model"
	genericstore "github.com/moweilong/cybernetics/pkg/store"
	"github.com/moweilong/cybernetics/pkg/store/logger/cybernetics"
	"github.com/moweilong/cybernetics/pkg/store/where"
)

// UserStore defines the interface for managing users in the database.
type UserStore interface {
	// Create inserts a new user into the database.
	Create(ctx context.Context, user *model.UserM) error

	// Update modifies an existing user in the database.
	Update(ctx context.Context, user *model.UserM) error

	// Delete removes users with the specified options.
	Delete(ctx context.Context, opts *where.WhereOptions) error

	// Get retrieves a user with the specified options.
	Get(ctx context.Context, opts *where.WhereOptions) (*model.UserM, error)

	// List returns a list of users with the specified options.
	List(ctx context.Context, opts *where.WhereOptions) (int64, []*model.UserM, error)

	UserExpansion
}

// UserExpansion defines additional methods for user operations.
type UserExpansion interface{}

// userStore implements the UserStore interface.
type userStore struct {
	*genericstore.Store[model.UserM]
}

// Ensure userStore implements the UserStore interface.
var _ UserStore = (*userStore)(nil)

// newUserStore creates a new userStore instance with provided datastore.
func newUserStore(ds *datastore) *userStore {
	return &userStore{
		Store: genericstore.NewStore[model.UserM](ds, cybernetics.NewLogger()),
	}
}
