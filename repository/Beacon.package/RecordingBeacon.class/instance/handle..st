accessing
handle: anAnnoucement
	mutex critical: [
		recordings add: anAnnoucement ].
	self announcer announce: anAnnoucement