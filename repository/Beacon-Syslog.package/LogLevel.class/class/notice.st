instance creation
notice
	"sysLog defines it as: Normal but significant condition.	Events that are unusual but not error conditions - might be summarized in an email to developers or admins to spot potential problems - no immediate action required."
	<logLevel>
	^ self level: 'notice' shortName: 'notice' severity: 5
