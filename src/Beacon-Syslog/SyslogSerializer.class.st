"
May be the Log class should be extended with the sender notion?
"
Class {
	#name : 'SyslogSerializer',
	#superclass : 'SignalSerializer',
	#instVars : [
		'converter'
	],
	#category : 'Beacon-Syslog',
	#package : 'Beacon-Syslog'
}

{ #category : 'accessing' }
SyslogSerializer >> converter [
	^ converter
]

{ #category : 'accessing' }
SyslogSerializer >> converter: anObject [
	converter := anObject
]

{ #category : 'testing' }
SyslogSerializer >> hasUtf8Converter [
	^  converter class encodingNames includes: 'utf-8'
]

{ #category : 'format' }
SyslogSerializer >> serializeSignal: aSignal logger: aLogger [
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
]

{ #category : 'writing' }
SyslogSerializer >> writeEncodedString: aString on: aStream [
	"according to RFC 5424 a BOM needs to be written if the encoded string
	is utf-8 encoded"
	"removed for now. This is a mismatch between RFC3164 and RFC5424. As those two
	are not compatible this should be separated in two different formatters. Now we just
	encode utf-8 to be able to transport proper strings"
	"self hasUtf8Converter ifTrue: [
		converter class writeBOMOn: aStream ]."
	"in order to support proper utf-8 encoding we need to workaround that 
	TextConverter>>#nextPutByteString:toStream: does not work for WideStrings. So we put 
	every single characters ourselves on the stream"
	aStream nextPutAll: (converter convertToSystemString: aString)
]

{ #category : 'writing' }
SyslogSerializer >> writeMessageFrom: aLog on: aStream [
	"the message part is not specified in the syslog protocol and can be any custom message.
	This message is a common format to write a tag/domain, a severity and the text of the message"
	((aLog respondsTo: #tag) and: [ aLog tag notNil ]) ifTrue: [ 
		aStream
			nextPutAll: aLog tag asString;
			nextPutAll: ': ' ].
	aStream
			nextPutAll:  aLog level shortName asUppercase ;
			nextPutAll: ': '.

	self writeEncodedString: aLog message asString on: aStream
]

{ #category : 'writing' }
SyslogSerializer >> writePriority: aNumber on: aStream [
	aStream 
		nextPut: $< ;
		nextPutAll: aNumber asString;
		nextPut: $> 
]

{ #category : 'writing' }
SyslogSerializer >> writeTimestamp: aDateAndTime on: aStream [
	|  dayOfMonth |
	dayOfMonth := aDateAndTime dayOfMonth .
	aStream 
		nextPutAll: aDateAndTime monthAbbreviation;
		nextPut: Character space;
		nextPutAll: (dayOfMonth asString padLeftTo: 2);
			nextPut: Character space.
		aDateAndTime rounded asTime print24: true on: aStream.
]
