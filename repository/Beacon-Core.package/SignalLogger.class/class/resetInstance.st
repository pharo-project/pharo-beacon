class initialization
resetInstance

	<script>

	instance ifNotNil: [
		Beacon instance unsubscribe: instance.
		instance := nil ]