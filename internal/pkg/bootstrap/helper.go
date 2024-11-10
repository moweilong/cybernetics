//nolint:unused
package bootstrap

import (
	"context"

	krtlog "github.com/go-kratos/kratos/v2/log"
	"go.opentelemetry.io/otel/trace"
)

// traceID returns a traceid valuer.
func traceID() krtlog.Valuer {
	return func(ctx context.Context) any {
		if span := trace.SpanContextFromContext(ctx); span.HasTraceID() {
			return span.TraceID().String()
		}
		return ""
	}
}

// spanID returns a spanid valuer.
func spanID() krtlog.Valuer {
	return func(ctx context.Context) any {
		if span := trace.SpanContextFromContext(ctx); span.HasSpanID() {
			return span.SpanID().String()
		}
		return ""
	}
}
