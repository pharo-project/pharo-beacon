instance creation
info
	"SysLog defines it as: nformational messages.	Normal operational messages - may be harvested for reporting, measuring throughput, etc. - no action required."
	<logLevel>
	^ self level: 'informational' shortName: 'info' severity: 6
