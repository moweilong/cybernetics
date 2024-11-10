package cybernetics

import "github.com/moweilong/cybernetics/pkg/log"

// cyberneticsLogger is a logger that implements the Logger interface.
// It uses the log package to log error messages with additional context.
type cyberneticsLogger struct{}

// NewLogger creates and returns a new instance of cyberneticsLogger.
func NewLogger() *cyberneticsLogger {
	return &cyberneticsLogger{}
}

// Error logs an error message with the provided context using the log package.
func (l *cyberneticsLogger) Error(err error, msg string, kvs ...any) {
	log.Errorw(err, msg, kvs...)
}
