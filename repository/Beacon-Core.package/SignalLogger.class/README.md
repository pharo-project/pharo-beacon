It represents the abstract class of a beacon that takes the signals going through the ==Beacon== and actually does something useful.

The subclasses provide concrete implementations. Each of these sublasses can be used both by directly instantiating the class, or by using the ==instance== class variable which holds a global instance of that class.

The global instance of a concrete bounded beacon is useful to provide a simple means to start and stop without worrying about the instance.

For example, consider:
	TranscriptBeacon start.
	StringSignal log: 'test'.
	...
	TranscriptBeacon stop.
	
Passing stop, unsubscribes the global instance of ==TranscriptBeacon== from the central ==Beacon== instance without having to remember the ==TranscriptBeacon== object.