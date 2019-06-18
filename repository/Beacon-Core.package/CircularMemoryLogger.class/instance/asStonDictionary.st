ston persistence
asStonDictionary

	^Dictionary new
		at: #name put: name;
		at: #recordings put: recordings;
		at: #entryCount put: entryCount;
		at: #index put: index;
		at: #fullBuffer put: fullBuffer;
		at: #loopCount put: loopCount;
		yourself.