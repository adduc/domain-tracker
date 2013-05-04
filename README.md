Domain Tracker
==============

Dependencies
------------
This project utilizes [Composer] for dependency management.

* [sclinternet/scl-whois][] - Whois lookups
* [jamesmoss/toml][] - Configuration parsing
* [ircmaxell/password-compat][] - Secure password support

Goals
-----
* Render time consistantly under 10ms
* Peak usage never exceed 1MB

Notes
-----
* Developed using PHP 5.4 (not tested for 5.3 compatibility)
* Benchmarked using APC (if you're not using opcode caching, why not?)


<!-- Links -->

[Composer][]: http://getcomposer.org
[sclinternet/scl-whois]: https://github.com/SCLInternet/SclWhois
[jamesmoss/toml]: https://github.com/jamesmoss/toml
[ircmaxell/password-compat]: https://github.com/ircmaxell/password_compat
