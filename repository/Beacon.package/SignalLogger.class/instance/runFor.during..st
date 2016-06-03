registering
runFor: anAnnouncementOrASetOfAnnouncements during: aBlock
	self startFor: anAnnouncementOrASetOfAnnouncements.
	[ aBlock value ]
		ensure: [ self stop ]
