This is the central and the dummiest class of the Beacon logging system.

It's a singleton class that holds an announcer instance. Its goal is purely to serve as a central beacon through which all signals pass.

By itself, it does not do anything useful. `SignalLogger`s are meant to register to its announcer and link the announcements to something useful.

### Beacon architecture

Beacon architectural elements are:
- Domain objects that emit Signals using the message `emit`.
- Signal objects that are announcements that management by the Beacon announcing system.
- The class Beacon that is just an announcement single point managing logger registrations.
- Logger objects that register for local or global sessions of signal reception.


### Simple local logger

The following script creates a logger for the block execution time and get the signals emitted during this period. Here only one. 

```
l := TranscriptLogger new.
l runDuring: [ 'Beacon and Pharo are'  emit ]
```