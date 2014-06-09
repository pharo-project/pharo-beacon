initialize
initialize
	stack := thisContext stack reject: [ :each | 
		each receiver = self or: [ 
			each receiver = self class ] ]