instance creation
newClass: aClass

	^ self new 
		filterClass: aClass;
		yourself