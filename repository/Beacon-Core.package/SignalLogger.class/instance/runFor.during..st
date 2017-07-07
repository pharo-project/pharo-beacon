registering
runFor: anAnnouncementOrASetOfAnnouncements during: aBlock
	"makes all provided BeaconSignals got to me during aBlock"
	self startFor: anAnnouncementOrASetOfAnnouncements.
	[ aBlock value ]
		ensure: [ self stop ]
