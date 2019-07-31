This is a convenience signal to record the stack information from thisContext. The recording happens during the initialization of the instance. This is particularly useful when you need to track the behavior of sensitive methods that do not allow for halting (e.g., a debugger or a rendering method).

See subclasses for concrete implementations