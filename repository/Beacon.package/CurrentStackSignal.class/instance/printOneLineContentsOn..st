printing
printOneLineContentsOn: stream
	super printOneLineContentsOn: stream.
	stream space.
	stream nextPutAll: (self stack first asString 
					copyReplaceAll: String cr 
					with: String cr, 
							String tab, 
							String tab)