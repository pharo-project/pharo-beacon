registering
startFor: anAnnouncementOrASetOfAnnouncements
	"Make sure that when anAnnouncementOrASetOfAnnouncements is signaled, I receive them as argument of nextPut:."
	self isRunning ifTrue: [ self stop ].
	self beacon 	
		when: anAnnouncementOrASetOfAnnouncements
		send: #nextPut:
		to: self