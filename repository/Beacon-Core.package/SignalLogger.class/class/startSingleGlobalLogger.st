convenience
startSingleGlobalLogger
	"Stop any other loggers and start a global instances of the receiver"
	<script>

	SignalLogger
		stopAll;
		resetAllInstances.
	self start