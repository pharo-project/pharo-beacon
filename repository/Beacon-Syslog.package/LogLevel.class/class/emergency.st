instance creation
emergency
	"Syslog defines it as: System is unusable.	A panic condition usually affecting multiple apps/servers/sites. At this level it would usually notify all tech staff on call."
		
	<logLevel>
	^ self level: 'emergency' shortName: 'emerg' severity: 0