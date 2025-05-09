printing
printOneLineContentsOn: stream
	| stream |

	super printOneLineContentsOn: stream.
	stream << '[['; cr.
	stack shortDebugStackOn: stream.
	stream cr.
	stream << ']]'