saving
startAutoSaving
	"Write the default instance to a file every WritePeriod"

	WriteProcess ifNotNil: [ self error: 'Write process already running' ].

	WriteProcess := [ self writeLoop ]
		forkAt: Processor userInterruptPriority
		named: self class name, ' auto-save'.