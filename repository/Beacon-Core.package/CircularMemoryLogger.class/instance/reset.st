initialization
reset
	"it simply removes all recordings without
	affecting the running status of the logger"
	mutex critical: [ self basicReset ]