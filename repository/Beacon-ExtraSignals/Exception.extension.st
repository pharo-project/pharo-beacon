Extension { #name : 'Exception' }

{ #category : '*Beacon-ExtraSignals' }
Exception >> emit [

	^ ExceptionSignal emit: self
]
