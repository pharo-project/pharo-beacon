instance creation
critical
	"SysLog defines it as: Critical conditions.	Should be corrected immediately, but indicates failure in a secondary system, an example is a loss of a backup ISP connection."
		
	<logLevel>
	^ self level: 'critical' shortName: 'crit' severity: 2