registering
startFor: anAnnouncementOrASetOfAnnouncements
	self isRunning ifTrue: [ self stop ].
	self beacon 	
		when: anAnnouncementOrASetOfAnnouncements
		send: #nextPut:
		to: self