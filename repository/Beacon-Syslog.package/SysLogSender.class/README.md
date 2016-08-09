Logger that outputs sysLog logs via UDP.



[[[
| logger |
logger := SysLogSender new addHost: 'localhost' port: 514
Log dispatcher addLogger: logger.
Log dispatcher startAllLoggers.
]]]

