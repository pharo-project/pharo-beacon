adding/removing
addLog: aLog 
	"Check whether the log is worth logging. If this is the case log it and announce that a new log was logged."
	self isLogging ifFalse: [^self].
	(self interestedIn: aLog) ifFalse: [^self].
	self addLogHook: aLog.
	self announcer announce: (LogAdded new log: aLog)
	