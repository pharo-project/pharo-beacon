registering
startFor: anAnnouncementOrASetOfAnnouncements
	self isRunning ifTrue: [ ^ self ].
	self beacon 	
		when: anAnnouncementOrASetOfAnnouncements
		do: [ :ann | 
			self handle: ann ]