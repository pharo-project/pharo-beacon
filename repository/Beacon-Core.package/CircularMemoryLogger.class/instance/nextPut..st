accessing
nextPut: aSignal
	mutex critical: [
		index := index >= entryCount ifTrue: [ 
			fullBuffer := true.
			loopCount := loopCount + 1.
			1 ]
		ifFalse: 
			[ index + 1 ].
		recordings at: index put: aSignal ].
	"the announcement is passed forward so that potential viewers
	can refresh when something changes. we do not create another announcement
	because it is not needed given that the only thing that can happen is
	for a new announcement to be recorded"
	self announcer announce: aSignal