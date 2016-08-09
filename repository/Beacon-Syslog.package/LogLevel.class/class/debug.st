instance creation
debug
	"SysLog defines it as Debug-level messages.	Info useful to developers for debugging the application, not useful during operations."
	<logLevel>
	^ self level: 'debug' shortName: 'debug' severity: 7