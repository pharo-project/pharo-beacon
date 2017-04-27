It represents the abstract class of a SignalLogger that takes the signals going through the ==Beacon== and actually does something useful.

The subclasses provide concrete implementations. Each of these sublasses can be used both by directly instantiating the class, or by using the ==instance== class variable which holds a global instance of that class.

The global instance of a concrete bounded beacon is useful to provide a simple means to start and stop without worrying about the instance.

For example, consider:
	TranscriptLogger start.
	StringSignal emit: 'test'.
	...
	TranscriptLogger stop.
	
Passing stop, unsubscribes the global instance of ==TranscriptLogger== from the central ==Beacon== instance without having to remember the ==TranscriptLogger== object.