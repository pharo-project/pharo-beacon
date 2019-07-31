sampling
stopSampling

	SampleProcess ifNil: [ ^self ].
	SampleProcess terminate.
	100 milliSeconds wait.
	SampleProcess isTerminated ifFalse: [ self error: 'Unable to terminate sample process' ].
	SampleProcess := nil.