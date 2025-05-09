saving
stopAutoSaving
	"Terminate writing the default instance to a file every WritePeriod"
	<script>

	WriteProcess ifNil: [ ^ self ].
	WriteProcess terminate.
	100 milliSeconds wait.
	WriteProcess isTerminated ifFalse: [
		self error: 'Unable to terminate auto-save process' ].
	WriteProcess := nil