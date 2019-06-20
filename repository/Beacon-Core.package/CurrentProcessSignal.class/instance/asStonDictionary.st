converting
asStonDictionary 

	^super asStonDictionary 
		at: #preemptedName put: preemptedName;
		at: #preemptedPriority put: preemptedPriority;
		at: #preemptedStack put: preemptedStack;
		at: #nextReadyName put: nextReadyName;
		at: #nextReadyPriority put: nextReadyPriority;
		at: #nextReadyStack put: preemptedStack;
		yourself