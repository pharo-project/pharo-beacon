initialization
reset
	"it simply removes all entries without
	affecting the running status of the logger"
	mutex critical: [
		entries := OrderedCollection new ]