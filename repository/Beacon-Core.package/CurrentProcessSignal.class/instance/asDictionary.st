converting
asDictionary 

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