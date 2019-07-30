registering
runFor: anAnnouncementOrASetOfAnnouncements during: aBlock
	"Makes all provided BeaconSignals got to me during aBlock.
	
	logger runFor: StringSignal during: [ ... ]"
	
	self startFor: anAnnouncementOrASetOfAnnouncements.
	[ aBlock value ]
		ensure: [ self stop ]
