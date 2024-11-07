package app

import (
	cliflag "k8s.io/component-base/cli/flag"
)

// CliOptions abstracts configuration options for reading parameters from the
// command line.
type CliOptions interface {
	// Flags returns flags for a specific server by section name.
	Flags() cliflag.NamedFlagSets

	// Complete completes all the required options.
	Complete() error

	// Validate validates all the required options.
	Validate() error
}
