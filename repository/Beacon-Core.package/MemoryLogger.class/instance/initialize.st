initialize
initialize
	super initialize.
	mutex := Mutex new.
	self reset.
	announcer := Announcer new.
