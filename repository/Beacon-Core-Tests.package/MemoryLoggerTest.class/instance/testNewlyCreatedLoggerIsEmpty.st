testing
testNewlyCreatedLoggerIsEmpty

	| logger |
	logger := MemoryLogger new.
	self deny: logger hasEntries.
	