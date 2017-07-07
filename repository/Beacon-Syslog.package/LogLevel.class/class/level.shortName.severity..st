instance creation
level: aLevelName shortName: aLevelShortName severity: aNumber
	"Lookup a level by name and create it if not already there."
	
	^ self levels 
		at: aLevelName 
		ifAbsentPut:  [ 
			self new
				name: aLevelName;
				shortName: aLevelShortName;
				severity: aNumber ]