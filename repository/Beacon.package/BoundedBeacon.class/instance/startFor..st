registering
startFor: anAnnouncementOrASetOfAnnouncements
	self isRunning ifTrue: [ ^ self ].

	Beacon instance announcer 	
		on: anAnnouncementOrASetOfAnnouncements
		do: [ :ann | 
			self handle: ann ]