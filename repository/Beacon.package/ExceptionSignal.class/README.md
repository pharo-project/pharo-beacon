This signal is useful to log an exception.

Example:
	TranscriptBeacon new runDuring: [
		[1/0] on: Error do: [ :error |  error log].
	]. 