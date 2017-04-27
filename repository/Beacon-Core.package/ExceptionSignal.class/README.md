This signal is useful to log an exception.

Example:
	TranscriptLogger new runDuring: [
		[1/0] on: Error do: [ :error |  error emit].
	]. 