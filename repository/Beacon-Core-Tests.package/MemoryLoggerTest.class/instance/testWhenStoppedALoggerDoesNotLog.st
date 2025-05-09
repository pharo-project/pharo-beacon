testing
testWhenStoppedALoggerDoesNotLog
	| logger |
	logger := MemoryLogger new.
	self deny: logger hasEntries.
	logger stop. 
	'Should not be in the log' emit.
	self deny: logger hasEntries