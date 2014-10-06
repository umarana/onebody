# Church.IO OneBody
[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/umarana/onebody?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[![Build Status](http://img.shields.io/travis/churchio/onebody.svg?style=flat)](https://travis-ci.org/churchio/onebody)
[![Code Climate](http://img.shields.io/codeclimate/github/churchio/onebody.svg?style=flat)](https://codeclimate.com/github/churchio/onebody)
[![Site](http://img.shields.io/badge/site-church.io-blue.svg?style=flat)](http://church.io)

OneBody is open-source, web-based social networking, email list, online directory, and lightweight document management software for churches.

*It's like a cross between Facebook, Google Groups, and SharePoint, but it's completely free and open source and awesome.*

OneBody is built with Ruby on Rails and MySQL, and has been in production use at churches for over seven years!

You can see lots of [screenshots here](https://www.flickr.com/photos/timothymorgan/sets/72157644451251789).

[![screnshots](https://farm4.staticflickr.com/3907/14330229528_250bd697d7.jpg)](https://www.flickr.com/photos/timothymorgan/sets/72157644451251789)

## Production Installation

Please see the [Installation Page](https://github.com/churchio/onebody/wiki/Installation) on the wiki.

## Development Setup Using Vagrant

If you're a developer and want to get everything running locally, this is the easiest way.

Operating System: Windows, Mac, or Linux

1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads). It's free and it runs on Windows, Mac, and Linux.
2. Install [Vagrant](http://docs.vagrantup.com/v2/installation/index.html).
3. `git clone git://github.com/churchio/onebody.git && cd onebody`
4. `vagrant up`

Now visit the site running in development mode at localhost:8080

Whenever gems are updated or new migrations are needed, you can just run `vagrant provision`.

To restart the Rails server, type `touch tmp/restart.txt`. Or you can `vagrant reload` to restart the dev box.

For more help with Vagrant, check out the [Vagrant docs](http://docs.vagrantup.com/v2/).

## Development Setup the Manual Way

Operating System: Mac or Linux (See Vagrant above if you're on Windows)

1. Install Ruby 2.1.2 or higher (we recommend you use [RVM](https://rvm.io/)).
2. Install MySQL.
3. Install Git.
4. Install ImageMagick.
5. `git clone git://github.com/churchio/onebody.git && cd onebody`
6. `mysql -u root -e "create database onebody_dev default character set utf8 default collate utf8_general_ci; grant all on onebody_dev.* to onebody@localhost identified by 'onebody';"`
7. `cp config/database.yml{.example,}`
8. `bundle install`
9. `cp config/secrets.yml{.example,} && vim config/secrets.yml` and add a random secret token to both the "development" and "test" sections (you can use `rake secret` to generate a new random secret).
10. `rake db:migrate`
11. `rails server`

Now visit the site running in development mode at http://localhost:3000.

## Tests

To run tests:

```
RAILS_ENV=test rake db:migrate
rspec
```

If you don't have a test database yet, create it like you did the dev database:

```
mysql -u root -e "create database onebody_test default character set utf8 default collate utf8_general_ci; grant all on onebody_test.* to onebody@localhost identified by 'onebody';"
```

## Get Help

* IRC channel #church.io on Freenode (try the [web-based IRC client](https://webchat.freenode.net/?channels=#church.io))
* [Wiki](http://wiki.github.com/churchio/onebody) - There is some (possibly outdated) information here. We'll work to clean this up shortly after releasing 3.0.
* [Google Group](http://groups.google.com/group/churchio)

## Contributing

To help fix a bug, first make sure it has a logged [issue](https://github.com/churchio/onebody/issues) (if not, create one), then:

1. Fork this repo on GitHub.
2. Set up the software on your computer by following the directions in one of the "Development" sections above.
3. Fix the bug, run the tests (see the "Tests" section above) to make sure they all pass.
4. Submit a Pull Request to get your bug fix merged!

If you'd like to add an awesome new feature, please hop on IRC to talk about what you want to do. We might be able to save you some time building something that 1) we've already done, 2) won't work, or 3) we'll never use. Also, we'd like to give some guidance on approach, coding style, tests, etc.

## Copyright

Copyright (c) [Tim Morgan](http://timmorgan.org)

THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.

This software is license under the GNU Affero General Public License, version 3. See LICENSE provided with this program for the entire text.

"Church.IO" is a trademark of our federation of developers and cannot be used for promotional purposes without express written permission.

### Design

Design is a derivative of AdminLTE, copyright (c) almasaeed2010, available [here](https://github.com/almasaeed2010/AdminLTE), licensed under MIT license. See [LICENSE](https://github.com/almasaeed2010/AdminLTE/blob/master/LICENSE).
