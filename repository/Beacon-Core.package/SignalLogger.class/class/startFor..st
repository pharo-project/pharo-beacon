registering
startFor: anAnnouncementOrASetOfAnnouncements
	"Start listening to announcements. 
	logger startFor: StringSignal 
	
	to scope the listening consider using 
	logger runFor: StringSignal during: [ ... ]"
	
	^ self instance startFor: anAnnouncementOrASetOfAnnouncements 
