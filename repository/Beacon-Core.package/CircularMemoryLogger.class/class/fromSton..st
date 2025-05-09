instance creation
fromSton: stonReader

	| logger |
	logger := self basicNew.
	stonReader parseListDo: [ :each :idx |
		idx = 1 ifFalse: [ self error: 'Invalid STON' ].
		logger
			name: (each at: #name);
			basicEntries: (each at: #entries);
			basicEntryCount: (each at: #entryCount);
			basicIndex: (each at: #lastEntryIndex);
			basicFullBuffer: (each at: #fullBuffer);
			basicLoopCount: (each at: #loopCount) ].

	^ logger