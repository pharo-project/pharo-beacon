It represents the abstract class of a SignalLogger that takes the signals going through the ==Beacon== and actually does something useful.

The subclasses provide concrete implementations. Each of these sublasses can be used both by directly instantiating the class, or by using the ==instance== class variable which holds a global instance of that class.

The global instance of a signal logger is useful to provide a simple means to start and stop without worrying about the instance.

For example, consider:

	TranscriptLogger start.
	StringSignal emit: 'test'.
	...
	TranscriptLogger stop.
	
Passing stop, unsubscribes the global instance of ==TranscriptLogger== from the central ==Beacon== instance without having to remember the ==TranscriptLogger== object.

One can get signals go to a given logger during the execution of a block with:

  (MemoryLogger named: 'loggerA')
		runDuring: [ 
			'Hello' asBeaconSignal emit.
			42 asBeaconSignal emit.
			];
		recordings.
		
This can be done for a specific set of signals with:

  (MemoryLogger named: 'loggerA')
		runFor: StringSignal, WrapperSignal during: [ 
			'Hello' asBeaconSignal emit.
			42 asBeaconSignal emit.
			StringSignal emit: 'let me pass'
			];
		recordings.
		
It is possible to have signals go to several loggers by nesting runDuring: blocks.
Now this is not replacing a composite logger.