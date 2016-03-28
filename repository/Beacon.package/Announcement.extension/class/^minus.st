*Beacon-Announcement
- anotherAnnouncement
	"Create an exception set containing the receiver 
	and anotherAnnouncement as exclusion."

	^ AnnouncementSetWithExclusions new
		add: self;
		addExclusion: anotherAnnouncement;
		yourself