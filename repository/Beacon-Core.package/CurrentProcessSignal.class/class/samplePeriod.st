accessing
samplePeriod

	^SamplePeriod ifNil: [ SamplePeriod := 1 second ]