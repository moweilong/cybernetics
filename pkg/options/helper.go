package options

import (
	"fmt"
	"net"
	"strings"

	netutils "k8s.io/utils/net"
)

// Define unit constant.
const (
	_   = iota // ignore c9s.iota
	KiB = 1 << (10 * iota)
	MiB
	GiB
	TiB
)

func join(prefixes ...string) string {
	joined := strings.Join(prefixes, ".")
	if joined != "" {
		joined += "."
	}

	return joined
}

// ValidateAddress takes an address as a string and validates it.
// If the input address is not in a valid :port or IP:port format, it returns an error.
// It also checks if the host part of the address is a valid IP address and if the port number is valid.
func ValidateAddress(addr string) error {
	host, port, err := net.SplitHostPort(addr)
	if err != nil {
		return fmt.Errorf("%q is not in a valid format (:port or ip:port): %w", addr, err)
	}
	if host != "" && netutils.ParseIPSloppy(host) == nil {
		return fmt.Errorf("%q is not a valid IP address", host)
	}
	if _, err := netutils.ParsePort(port, true); err != nil {
		return fmt.Errorf("%q is not a valid number", port)
	}

	return nil
}
