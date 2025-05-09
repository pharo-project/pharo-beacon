class initialization
resetAllInstances
	<script>

	self withAllSubclassesDo: [ :each | each resetInstance ]