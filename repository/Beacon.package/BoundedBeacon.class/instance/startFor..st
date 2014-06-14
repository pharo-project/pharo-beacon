registering
startFor: anAnnouncementOrASetOfAnnouncements
	self isRunning ifTrue: [ ^ self ].
	self beacon 	
		when: anAnnouncementOrASetOfAnnouncements
		send: #handle:
		to: self