CurrentProcessSignal stores the call stack, name and priority of the active (preempted) and waiting processes.

A high priority loop to emit a signal once a second can be started and stopped using:

	CurrentProcessSignal startSampling.
	
	CurrentProcessSignal stopSampling.

These are normally captured using the ${class:name=CircularMemoryLogger}$.

Looking at the one line description of a series of signals will normally fairly quickly show if one process is CPU bound as it will regularly appear as the preempted process.

Inspecting the call stack of the active process for several signals will then suggest whether it is stuck in a loop (the call stack doesn't change much) or just has a lot of work (the call stack is varying).


