Domain Tracker
==============

Dependencies
------------
This project utilizes [Composer][] for dependency management.

* [sclinternet/scl-whois][] - Whois lookups
* [ircmaxell/password-compat][] - Secure password support
* [doctrine/inflector][] - Inflection library
* [swiftmailer/swiftmailer][] - Email library

Goals
-----
* Render time consistantly under 10ms (when using opcode cache)
* Peak usage never exceed 1MB (when using opcode cache)

Notes
-----
* Developed using PHP 5.4 (not tested for 5.3 compatibility)
* Benchmarked using APC (if you're not using opcode caching, why not?)


<!-- Links -->

[Composer]: http://getcomposer.org
[sclinternet/scl-whois]: https://github.com/SCLInternet/SclWhois
[ircmaxell/password-compat]: https://github.com/ircmaxell/password_compat
[doctrine/inflector]: https://github.com/doctrine/inflector
[swiftmailer/swiftmailer]: https://github.com/swiftmailer/swiftmailer
