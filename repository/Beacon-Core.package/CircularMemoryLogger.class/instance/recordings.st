accessing
recordings
	"It answers a copy of the recorded collection to not grant
	access to the users to a shared resource that should only be 
	modified via the mutex"
	^ (fullBuffer
			ifTrue: [ recordings ]
			ifFalse: [ recordings select: #notNil ]) 
				sorted: [ :a :b | a timestamp < b timestamp ]