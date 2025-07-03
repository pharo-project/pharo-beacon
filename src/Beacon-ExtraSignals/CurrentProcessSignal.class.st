"
CurrentProcessSignal stores the call stack, name and priority of the active (preempted) and waiting processes.

A high priority loop to emit a signal once a second can be started and stopped using:

	CurrentProcessSignal startSampling.
	
	CurrentProcessSignal stopSampling.

These are normally captured using the ${class:name=CircularMemoryLogger}$.

Looking at the one line description of a series of signals will normally fairly quickly show if one process is CPU bound as it will regularly appear as the preempted process.

Inspecting the call stack of the active process for several signals will then suggest whether it is stuck in a loop (the call stack doesn't change much) or just has a lot of work (the call stack is varying).



"
Class {
	#name : 'CurrentProcessSignal',
	#superclass : 'BeaconSignal',
	#instVars : [
		'preemptedStack',
		'preemptedName',
		'preemptedPriority',
		'nextReadyStack',
		'nextReadyName',
		'nextReadyPriority'
	],
	#classVars : [
		'SamplePeriod',
		'SampleProcess'
	],
	#category : 'Beacon-ExtraSignals',
	#package : 'Beacon-ExtraSignals'
}

{ #category : 'instance creation' }
CurrentProcessSignal class >> fromStonDictionary: aDictionary [

	^(super fromStonDictionary: aDictionary)
			preemptedStack: (aDictionary at: #preemptedStack);
			preemptedName: (aDictionary at: #preemptedName);
			preemptedPriority: (aDictionary at: #preemptedPriority);
			nextReadyStack: (aDictionary at: #nextReadyStack);
			nextReadyName: (aDictionary at: #nextReadyName);
			nextReadyPriority: (aDictionary at: #nextReadyPriority);
			yourself
]

{ #category : 'private' }
CurrentProcessSignal class >> sampleLoop [

	[ self new sample emit.
	self samplePeriod wait ] repeat.
]

{ #category : 'accessing' }
CurrentProcessSignal class >> samplePeriod [

	^SamplePeriod ifNil: [ SamplePeriod := 1 second ]
]

{ #category : 'accessing' }
CurrentProcessSignal class >> samplePeriod: aDuration [

	SamplePeriod := aDuration
]

{ #category : 'sampling' }
CurrentProcessSignal class >> startSampling [

	SampleProcess ifNotNil: [ self error: 'Sample process already running' ].

	SampleProcess := [ self sampleLoop ] 
			forkAt: Processor userInterruptPriority 
			named: 'CurrentProcessSignal sampler'.
]

{ #category : 'sampling' }
CurrentProcessSignal class >> stopSampling [

	SampleProcess ifNil: [ ^self ].
	SampleProcess terminate.
	100 milliSeconds wait.
	SampleProcess isTerminated ifFalse: [ self error: 'Unable to terminate sample process' ].
	SampleProcess := nil.
]

{ #category : 'converting' }
CurrentProcessSignal >> asDictionary [ 

	^ Dictionary new 
		at: #preemptedName put: preemptedName;
		at: #preemptedPriority put: preemptedPriority;
		at: #preemptedStack put: (preemptedStack collect: [ :each | each asString ]);
		at: #nextReadyName put: nextReadyName;
		at: #nextReadyPriority put: nextReadyPriority;
		at: #nextReadyStack put: (nextReadyStack
				ifNil: [ nil ]
				ifNotNil: [ nextReadyStack collect: [ :each | each asString ]]);
		yourself
]

{ #category : 'accessing' }
CurrentProcessSignal >> nextReadyName [
	^ nextReadyName
]

{ #category : 'accessing' }
CurrentProcessSignal >> nextReadyName: anObject [
	nextReadyName := anObject
]

{ #category : 'accessing' }
CurrentProcessSignal >> nextReadyPriority [
	^ nextReadyPriority
]

{ #category : 'accessing' }
CurrentProcessSignal >> nextReadyPriority: anObject [
	nextReadyPriority := anObject
]

{ #category : 'accessing' }
CurrentProcessSignal >> nextReadyStack [
	^ nextReadyStack
]

{ #category : 'accessing' }
CurrentProcessSignal >> nextReadyStack: anObject [
	nextReadyStack := anObject
]

{ #category : 'accessing' }
CurrentProcessSignal >> preemptedName [
	^ preemptedName
]

{ #category : 'accessing' }
CurrentProcessSignal >> preemptedName: anObject [
	preemptedName := anObject
]

{ #category : 'accessing' }
CurrentProcessSignal >> preemptedPriority [
	^ preemptedPriority
]

{ #category : 'accessing' }
CurrentProcessSignal >> preemptedPriority: anObject [
	preemptedPriority := anObject
]

{ #category : 'accessing' }
CurrentProcessSignal >> preemptedStack [
	^ preemptedStack
]

{ #category : 'accessing' }
CurrentProcessSignal >> preemptedStack: anObject [
	preemptedStack := anObject
]

{ #category : 'printing' }
CurrentProcessSignal >> printOneLineContentsOn: stream [

	stream 
		print: preemptedName;
		<< ', ';
		print: nextReadyName
]

{ #category : 'signalling' }
CurrentProcessSignal >> sample [

	| process |

	process := Processor preemptedProcess.
	preemptedName := process name.
	preemptedPriority := process priority.
	preemptedStack := process copyStack suspendedContext stack.

	process := Processor nextReadyProcess.
	nextReadyName := process name.
	nextReadyPriority := process priority.
	nextReadyName = preemptedName ifFalse: [ 
		nextReadyStack := process copyStack suspendedContext stack ].

]
