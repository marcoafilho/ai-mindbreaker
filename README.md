A* Mindbreaker ![Build Status][travis_logo]
==============
This application is designed to solve the slide puzzle based on 3x3 matrices as shown in the picture below:

![3x3 Slide puzzle][puzzle_image]

The algorithm used to retrieve the solution is the A* search method.

[travis_logo]:  https://secure.travis-ci.org/marcoafilho/ai-mindbreaker.png?branch=master
[puzzle_image]: https://github.com/marcoafilho/ai-mindbreaker/raw/master/resources/SLIDE.png "3x3 sliding puzzle"

Configuration
-------------
The application uses Ruby 1.9.3. Make sure to have the right version installed at your system.

	$ ruby -v

If you want to run the tests used by the application, install Bundler first

	$ gem install bundler
	$ bundle install
	
Usage
-----

License
-------
Copyright (c) 2012 Marco Almeida and Flávia Barreto. See [LICENSE][] for details.

[license]: https://github.com/marcoafilho/ai-mindbreaker/blob/master/LICENSE.md
