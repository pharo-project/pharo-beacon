instance creation
error
	"SysLog defines it as: Error conditions. Non-urgent failures, these should be relayed to developers or admins; each item must be resolved within a given time."
	<logLevel>
	^ self level: 'error' shortName: 'error' severity: 3