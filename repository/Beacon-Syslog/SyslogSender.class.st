"
Logger that outputs sysLog messages via UDP.

To add a syslog logger do:

SyslogSender new 
	addHost: 'localhost'.

To send a syslog message use
	
StringSignal new
	message: 'a message to be logged';
	tag: 'syslog-tag';
	level: LogLevel info;
	log

#tag: and #level: are extension methods to StringSignal to be able to use syslog specific parameters
"
Class {
	#name : 'SyslogSender',
	#superclass : 'SerializingLogger',
	#instVars : [
		'hosts',
		'facility',
		'hostName'
	],
	#category : 'Beacon-Syslog',
	#package : 'Beacon-Syslog'
}

{ #category : 'defaults' }
SyslogSender class >> defaultSerializer [
	^ SyslogSerializer new
]

{ #category : 'instance creation' }
SyslogSender class >> localhost [
	^ self new
		addHost: 'localhost'
]

{ #category : 'instance creation' }
SyslogSender class >> localhostOn: aPortNumber [
	^ self new
		addHost: 'localhost'
		port: aPortNumber
]

{ #category : 'configuring' }
SyslogSender >> addHost: aString [
	"Add a host to send to, 514 is default syslog port."

	self addHost: aString port: 514
]

{ #category : 'configuring' }
SyslogSender >> addHost: aString port: aPortNumber [
	"Add a host name with portnumber."

	hosts add: aString -> (aPortNumber ifNil: [514])
]

{ #category : 'accessing' }
SyslogSender >> defaultSerializer [
	^ super defaultSerializer 
		converter: UTF8TextConverter new
]

{ #category : 'accessing' }
SyslogSender >> facility [
	^ facility
]

{ #category : 'accessing' }
SyslogSender >> facility: anInteger [
	"We keep it multiplied with 8 so we don't need to do that every time we emit."

	facility := anInteger * 8
]

{ #category : 'accessing' }
SyslogSender >> hostName [
	"Apparently this is not that easy to find cross platform."

	^hostName ifNil: [
		hostName := self localHostname ]
]

{ #category : 'accessing' }
SyslogSender >> hostName: aHostName [
	"Apparently this is not that easy to find cross platform."

	hostName := aHostName
]

{ #category : 'initialization' }
SyslogSender >> initialize [

	super initialize.
	self facility: 16. "Use 1 (=user level) or 16-23 (=local use local0-7)"
	hosts := OrderedCollection new
]

{ #category : 'accessing' }
SyslogSender >> localHostname [
	"resolve local hostname. If no name is resolvable then we get back the IP address.
	We return either the hostname without domain or the IP address"
	| hostname |
	hostname := NetNameResolver localHostName.
	^ (hostname copyAfterLast: $.) isAllDigits
		ifTrue: [ hostname ]
		ifFalse: [ hostname copyUpTo: $. ]
]

{ #category : 'operations' }
SyslogSender >> nextPutSerialized: aString [

	hosts do: [:host | self send: aString to: host key port: host value]
]

{ #category : 'printing' }
SyslogSender >> printOn: aStream [
	super printOn: aStream.
	aStream 
		nextPutAll: ' sending to '.
	hosts 
		do: [ :each | 
			aStream 
				nextPutAll: each key;
				nextPut: $:;
				nextPutAll: each value asString ]
		separatedBy: [ aStream nextPutAll: ', ' ]
]

{ #category : 'private' }
SyslogSender >> send: message to: host port: port [
	"Send formatted UDP message to host and port."

	| sock |
	sock := Socket newUDP.
	sock sendData: message toHost: (NetNameResolver addressForName: host)   port: port. 
	sock waitForSendDoneFor: Socket standardTimeout.
	sock close
]
