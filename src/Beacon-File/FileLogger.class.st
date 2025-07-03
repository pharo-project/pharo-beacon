"
An implementation of a simple file logger using filename and encoding as parameter. 

It can be used like

FileLogger new
	filename: '/tmp/test.log';
	runFor: StringSignal during: [ 
		StringSignal emit: 'test message'
		]



 



"
Class {
	#name : 'FileLogger',
	#superclass : 'StreamLogger',
	#instVars : [
		'fileReference',
		'encoding',
		'binary',
		'stream',
		'lineSeparator'
	],
	#category : 'Beacon-File',
	#package : 'Beacon-File'
}

{ #category : 'defaults' }
FileLogger class >> defaultEncoding [
	^ 'utf-8'
]

{ #category : 'instance creation' }
FileLogger class >> filename: aString [
	^ self filename: aString append: true
]

{ #category : 'instance creation' }
FileLogger class >> filename: aString append: appending [
	^ self new
		filename: aString;
		append: appending
]

{ #category : 'instance creation' }
FileLogger class >> stdout [
	^ self new
		stream: Stdio stdout
	
]

{ #category : 'accessing' }
FileLogger >> append [
	self append: true
]

{ #category : 'accessing' }
FileLogger >> append: aBoolean [
	aBoolean ifTrue: [  
		self stream setToEnd ]
]

{ #category : 'accessing' }
FileLogger >> binary [
	^ binary
]

{ #category : 'accessing' }
FileLogger >> binary: anObject [
	binary := anObject
]

{ #category : 'defaults' }
FileLogger >> defaultEncoding [
	^ self class defaultEncoding
]

{ #category : 'defaults' }
FileLogger >> defaultLineSeparator [
	^ Character lf
]

{ #category : 'accessing' }
FileLogger >> encoder [
	^ ZnCharacterEncoder newForEncoding: self encoding

]

{ #category : 'accessing' }
FileLogger >> encoding [
	^ encoding ifNil: [ 
		encoding := self defaultEncoding ] 
]

{ #category : 'accessing' }
FileLogger >> encoding: anObject [
	^ encoding := anObject
]

{ #category : 'accessing' }
FileLogger >> filename: aStringOrFileReference [
	fileReference := aStringOrFileReference asFileReference 
	
]

{ #category : 'initialization' }
FileLogger >> initialize [
	super initialize.
	binary := false
]

{ #category : 'accessing' }
FileLogger >> lineSeparator [
	^ lineSeparator ifNil: [
		lineSeparator := self defaultLineSeparator ]
]

{ #category : 'accessing' }
FileLogger >> newStream [
	| newStream |
	newStream := fileReference writeStream.
	binary ifFalse: [ 
		newStream encoder: self encoder ].
	^ newStream 

]

{ #category : 'accessing' }
FileLogger >> nextPutSerialized: aString [
	super nextPutSerialized: aString.
	self stream nextPut: self lineSeparator 
]

{ #category : 'accessing' }
FileLogger >> stream [
	^ stream ifNil: [ 
		stream := self newStream ] 
]

{ #category : 'accessing' }
FileLogger >> stream: aStream [
	stream := aStream
]
