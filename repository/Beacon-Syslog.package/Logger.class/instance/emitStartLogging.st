actions
emitStartLogging
	"Since a logger emits its own log entry"

	^ Log message: name asString , ' started to log' tag: 'SystemLogger'