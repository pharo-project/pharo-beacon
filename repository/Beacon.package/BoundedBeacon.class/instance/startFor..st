registering
startFor: anAnnouncementOrASetOfAnnouncements
	Beacon instance announcer 	
		on: anAnnouncementOrASetOfAnnouncements
		do: [ :ann | 
			self handle: ann ].