logging
nextPut: aSignal

	mutex critical: [
		lastEntryIndex := lastEntryIndex >= maximumEntryCount
			         ifTrue: [
				         fullBuffer := true.
				         loopCount := loopCount + 1.
				         1 ]
			         ifFalse: [ lastEntryIndex + 1 ].
		entries at: lastEntryIndex put: aSignal ].

	"The announcement is passed forward so that potential viewers
	can refresh when something changes. we do not create another announcement
	because it is not needed given that the only thing that can happen is
	for a new announcement to be recorded"
	self announcer announce: aSignal