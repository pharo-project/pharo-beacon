initialize
reset
	"it simply removes all recordings without
	affecting the running status of the beacon"
	mutex critical: [
		recordings := OrderedCollection new ]