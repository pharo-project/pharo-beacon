convenience
saveBlocGlobalLogger
	"Collect detailed events for 10 seconds and then save the file"

	| semaphore |

	semaphore := Semaphore new.
	[ BlSpaceRenderSignal dontIgnore.
	BlTaskExecutionSignal clearIgnored.
	10 seconds wait.
	BlSpaceRenderSignal ignore.
	BlTaskExecutionSignal ignoreRepeatedTasks.
	semaphore signal ]
		forkAt: Processor userSchedulingPriority + 5 named: 'Bloc Global Logger'.
	semaphore wait.
	self instance saveStonFile: 'bloclog.stgz' asFileReference