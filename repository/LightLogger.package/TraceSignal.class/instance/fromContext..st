initialization
fromContext: aContext

	senderClass := aContext methodClass.
	senderSelector := aContext selector.
	sourcePosition := self calculatePosition: aContext