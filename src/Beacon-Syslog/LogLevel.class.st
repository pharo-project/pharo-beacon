"
I represent a level of severity in log messages. There are default log levels which can be used from the class side. These are: emergency, alert, critical, error, warning, notice, information, and debug.

Objects of my class are cached in order to reduce the amount of objects needed in the image.

Instance variables: 

- name           The fullname of the log level
- shortName   An abbreviated name for shorter display
- priority         Priority to sort/filter log messages


I follow the conventions of sysLog

Code	Severity	Keyword	Description	General Description
				
				
0	Emergency	emerg (panic)	System is unusable.	A ""panic"" condition usually affecting multiple apps/servers/sites. At this level it would usually notify all tech staff on call.
1	Alert	alert	Action must be taken immediately.	Should be corrected immediately, therefore notify staff who can fix the problem. An example would be the loss of a primary ISP connection.
2	Critical	crit	Critical conditions.	Should be corrected immediately, but indicates failure in a secondary system, an example is a loss of a backup ISP connection.
3	Error	err (error)	Error conditions.	Non-urgent failures, these should be relayed to developers or admins; each item must be resolved within a given time.
4	Warning	warning (warn)	Warning conditions.	Warning messages, not an error, but indication that an error will occur if action is not taken, e.g. file system 85% full - each item must be resolved within a given time.
5	Notice	notice	Normal but significant condition.	Events that are unusual but not error conditions - might be summarized in an email to developers or admins to spot potential problems - no immediate action required.
6	Informational	info	Informational messages.	Normal operational messages - may be harvested for reporting, measuring throughput, etc. - no action required.
7	Debug	debug	Debug-level messages.	Info useful to developers for debugging the application, not useful during operations.


"
Class {
	#name : 'LogLevel',
	#superclass : 'Object',
	#instVars : [
		'name',
		'shortName',
		'severity'
	],
	#classVars : [
		'LogLevels'
	],
	#category : 'Beacon-Syslog',
	#package : 'Beacon-Syslog'
}

{ #category : 'instance creation' }
LogLevel class >> alert [
	"SysLog defines it as: Action must be taken immediately.	Should be corrected immediately, therefore notify staff who can fix the problem. An example would be the loss of a primary ISP connection."
		
	<logLevel>
	^ self level: 'alert' shortName: 'alert' severity: 1
]

{ #category : 'accessing' }
LogLevel class >> all [
	"Return all available log levels that are defined within the receiving class"
	^ (self allLogLevelSelectors 
		collect: [ :selector | self perform: selector ])
			sorted
]

{ #category : 'accessing' }
LogLevel class >> allLogLevelSelectors [
	"Collect all selectors that have a <logLevel> pragma"
	^ self class allMethods 
		select: [ :each | each hasPragmaNamed: #logLevel ] 
		thenCollect: [ :method | method selector]
]

{ #category : 'instance creation' }
LogLevel class >> critical [
	"SysLog defines it as: Critical conditions.	Should be corrected immediately, but indicates failure in a secondary system, an example is a loss of a backup ISP connection."
		
	<logLevel>
	^ self level: 'critical' shortName: 'crit' severity: 2
]

{ #category : 'instance creation' }
LogLevel class >> debug [
	"SysLog defines it as Debug-level messages.	Info useful to developers for debugging the application, not useful during operations."
	<logLevel>
	^ self level: 'debug' shortName: 'debug' severity: 7
]

{ #category : 'instance creation' }
LogLevel class >> emergency [
	"Syslog defines it as: System is unusable.	A panic condition usually affecting multiple apps/servers/sites. At this level it would usually notify all tech staff on call."
		
	<logLevel>
	^ self level: 'emergency' shortName: 'emerg' severity: 0
]

{ #category : 'instance creation' }
LogLevel class >> error [
	"SysLog defines it as: Error conditions. Non-urgent failures, these should be relayed to developers or admins; each item must be resolved within a given time."
	<logLevel>
	^ self level: 'error' shortName: 'error' severity: 3
]

{ #category : 'instance creation' }
LogLevel class >> info [
	"SysLog defines it as: nformational messages.	Normal operational messages - may be harvested for reporting, measuring throughput, etc. - no action required."
	<logLevel>
	^ self level: 'informational' shortName: 'info' severity: 6

]

{ #category : 'instance creation' }
LogLevel class >> information [
	^ self info
]

{ #category : 'instance creation' }
LogLevel class >> level: aLevelName shortName: aLevelShortName severity: aNumber [
	"Lookup a level by name and create it if not already there."
	
	^ self levels 
		at: aLevelName 
		ifAbsentPut:  [ 
			self new
				name: aLevelName;
				shortName: aLevelShortName;
				severity: aNumber ]
]

{ #category : 'internal' }
LogLevel class >> levels [
	^ LogLevels ifNil: [ 
		LogLevels := SmallDictionary new  ]
]

{ #category : 'query' }
LogLevel class >> named: aString [
	"Return a log level by either fullname or shortname"
	
	^ self levels 
		detect: [ :level | level name = aString or: [ level shortName = aString ] ] 
		ifNone: [ self error: aString , ' is not a log level' ].
]

{ #category : 'instance creation' }
LogLevel class >> notice [
	"sysLog defines it as: Normal but significant condition.	Events that are unusual but not error conditions - might be summarized in an email to developers or admins to spot potential problems - no immediate action required."
	<logLevel>
	^ self level: 'notice' shortName: 'notice' severity: 5

]

{ #category : 'initialization' }
LogLevel class >> reset [
	LogLevels := nil
]

{ #category : 'instance creation' }
LogLevel class >> trace [
	^ self info
]

{ #category : 'instance creation' }
LogLevel class >> warn [
	^ self warning
]

{ #category : 'instance creation' }
LogLevel class >> warning [
	"SysLog defines it as: Warning conditions.	Warning messages, not an error, but indication that an error will occur if action is not taken, e.g. file system 85% full - each item must be resolved within a given time."
	<logLevel>
	^  self level: 'warning' shortName: 'warning' severity: 4
]

{ #category : 'comparing' }
LogLevel >> < aLogLevel [
	^ self severity < aLogLevel severity
]

{ #category : 'comparing' }
LogLevel >> <= aLogLevel [
	^ self severity <= aLogLevel severity
]

{ #category : 'comparing' }
LogLevel >> >= aLogLevel [
	^ self severity >= aLogLevel severity
]

{ #category : 'accessing' }
LogLevel >> name [
	^ name
]

{ #category : 'accessing' }
LogLevel >> name: aString [ 
	name := aString
]

{ #category : 'converting' }
LogLevel >> orMoreSevere [
	^ [ :log | log level <= self ]
]

{ #category : 'printing' }
LogLevel >> printOn: aStream [
	aStream 
		nextPutAll: name
]

{ #category : 'accessing' }
LogLevel >> severity [
	^ severity
]

{ #category : 'accessing' }
LogLevel >> severity: aNumber [
	severity := aNumber
]

{ #category : 'accessing' }
LogLevel >> shortName [
	^ shortName
]

{ #category : 'accessing' }
LogLevel >> shortName: aString [ 
	shortName := aString
]
