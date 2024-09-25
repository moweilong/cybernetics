
package validate_test

import (
	"cybernetics/utility/validate"

	"github.com/gogf/gf/v2/test/gtest"

	"testing"
)

func TestIsEmail(t *testing.T) {
	b := validate.IsEmail("QTT123456@163.com")
	gtest.Assert(true, b)
}
