instance creation
alert
	"SysLog defines it as: Action must be taken immediately.	Should be corrected immediately, therefore notify staff who can fix the problem. An example would be the loss of a primary ISP connection."
		
	<logLevel>
	^ self level: 'alert' shortName: 'alert' severity: 1