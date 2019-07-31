instance creation
fromStonDictionary: aDictionary

	^(super fromStonDictionary: aDictionary)
			preemptedStack: (aDictionary at: #preemptedStack);
			preemptedName: (aDictionary at: #preemptedName);
			preemptedPriority: (aDictionary at: #preemptedPriority);
			nextReadyStack: (aDictionary at: #nextReadyStack);
			nextReadyName: (aDictionary at: #nextReadyName);
			nextReadyPriority: (aDictionary at: #nextReadyPriority);
			yourself