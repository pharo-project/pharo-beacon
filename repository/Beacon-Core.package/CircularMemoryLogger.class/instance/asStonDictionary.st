ston persistence
asStonDictionary

	^ Dictionary new
		  at: #name put: name;
		  at: #entries put: entries;
		  at: #maximumEntryCount put: maximumEntryCount;
		  at: #index put: lastEntryIndex;
		  at: #fullBuffer put: fullBuffer;
		  at: #loopCount put: loopCount;
		  yourself