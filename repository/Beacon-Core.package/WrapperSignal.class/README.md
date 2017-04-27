This signal is useful to log an arbitrary object.

Example:
	TranscriptLogger new runDuring: [
		42 asBeaconSignal emit.
	]. 