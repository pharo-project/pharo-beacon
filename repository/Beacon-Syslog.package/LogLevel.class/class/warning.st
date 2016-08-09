instance creation
warning
	"SysLog defines it as: Warning conditions.	Warning messages, not an error, but indication that an error will occur if action is not taken, e.g. file system 85% full - each item must be resolved within a given time."
	<logLevel>
	^  self level: 'warning' shortName: 'warning' severity: 4