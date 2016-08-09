==Logger== is the abstract superclass of system loggers. It has a name. 

It defined the following messages:

- ==startLogging== and ==stopLogging== enable and respectively disable the handling of log objects.
- ==filter: aBlock== to specify the condition that the log objects should satisfy to be handled by the system logger. 
- ==addLog: aLog== sent by the log dispatcher.
- ==addLogHook: aLog== is a hook message that specifies the effective action performed when handling a log object.
- ==reset== flushes the log objects if any that could have been hold by the receiver.