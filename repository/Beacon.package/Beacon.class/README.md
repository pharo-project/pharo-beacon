This is the central and the dummiest class of the Beacon logging system.

It's a singleton class that holds an announcer instance. Its goal is purely to serve as a central beacon through which all signals pass.

It works together with ==Announcement>>#log==.

By itself, it does not do anything useful. Other ==BoundedBeacons== are meant to register to its announcer and link the announcements to something useful.