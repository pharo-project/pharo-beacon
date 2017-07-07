accessing
nextPut: aSignal
	mutex critical: [
		recordings add: aSignal ].
	"the announcement is passed forward so that potential viewers
	can refresh when something changes. we do not create another announcement
	because it is not needed given that the only thing that can happen is
	for a new announcement to be recorded"
	self announcer announce: aSignal