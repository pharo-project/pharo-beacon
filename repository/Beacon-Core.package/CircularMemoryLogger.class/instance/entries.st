accessing
entries
	"It answers a copy of the recorded collection to not grant
	access to the users to a shared resource that should only be
	modified via the mutex"

	^ fullBuffer
		  ifTrue: [ entries sorted: [ :a :b | a timestamp < b timestamp ] ]
		  ifFalse: [ entries first: lastEntryIndex ]