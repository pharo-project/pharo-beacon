tests
testCaptureStackOfCurrentExecution

	| m |
	m := MemoryLogger new.
	m	runDuring: [ 
			StackSignal emit ].
	
	self assert: m entries first stack selector equals: thisContext selector
