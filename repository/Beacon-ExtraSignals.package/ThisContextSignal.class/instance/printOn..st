printing
printOn: stream
	super printOn: stream.
	self stack do: [ :each |
		stream 
			cr;
			tab; 
			nextPutAll: (
				each asString 
					copyReplaceAll: String cr 
					with: String cr, 
							String tab, 
							String tab) ]