format
serializeSignal: aSignal logger: aLogger
	"timestamp is rounded because the syslog format has only second precision"
	| stream  |
	stream := WriteStream on: ByteString new.

	self writePriority: (aLogger facility + aSignal level severity) on: stream.
	"write header consisting of timestamp and host"
	self writeTimestamp: aSignal timestamp on: stream.
	stream
		nextPut:     Character space;
		nextPutAll:  aLogger hostName;
		nextPut:     Character space.
	"syslog format ends here. Now we write the message part"
	self writeMessageFrom: aSignal on: stream.
	^ stream contents