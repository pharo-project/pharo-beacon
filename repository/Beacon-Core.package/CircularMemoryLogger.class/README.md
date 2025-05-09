`CircularMemoryLogger` records the signals that it receives in a circular buffer, default size 5000 entries.

###Example1: Instance usage
The following example illustrates how a logger can be used within a giving scope, here during the block execution. 
```
	(CircularMemoryLogger new 
		runDuring: [ 
			StringSignal emit: 'This is a message' ]	)
				inspect.
```

###Example 2: Global usage
The following example shows how the logger can be used globally. 

```
	CircularMemoryLogger reset.
	CircularMemoryLogger start.
	StringSignal emit: 'This is a message' .
	CircularMemoryLogger instance recordings inspect.
	CircularMemoryLogger stop.
```