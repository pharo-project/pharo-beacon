printing
printOneLineOn: stream
	super printOneLineOn: stream.
	stream space.
	stream nextPutAll: (self stack first asString 
					copyReplaceAll: String cr 
					with: String cr, 
							String tab, 
							String tab)