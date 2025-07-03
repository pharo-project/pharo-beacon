Extension { #name : 'BlockClosure' }

{ #category : '*Beacon-ExtraSignals' }
BlockClosure >> asBeaconSignal [

	^ ValuableSignal new 
		valuable: self;
		yourself
]
