initialization
initialize
	super initialize.
	timestamp := DateAndTime now.
	processId := Processor activeProcess name.
	properties := Dictionary new