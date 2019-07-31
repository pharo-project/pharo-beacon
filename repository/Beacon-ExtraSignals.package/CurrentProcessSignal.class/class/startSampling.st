sampling
startSampling

	SampleProcess ifNotNil: [ self error: 'Sample process already running' ].

	SampleProcess := [ self sampleLoop ] 
			forkAt: Processor userInterruptPriority 
			named: 'CurrentProcessSignal sampler'.