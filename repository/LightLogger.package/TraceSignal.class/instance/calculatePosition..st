private
calculatePosition: aContext 
	| start currentIndex |

	currentIndex := 1.
	start := aContext sourceNodeExecuted start.
	aContext method sourceCode lines withIndexDo: [ :line :lineNumber |
		| lineLength |
		lineLength := line size + 1.
		(currentIndex + lineLength - 1) >= start 
			ifTrue: [ ^ { lineNumber. start - currentIndex + 1. start } ].
		currentIndex := currentIndex + lineLength ].
	
	self error: 'Should not arrive here'