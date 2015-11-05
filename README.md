Symfony sandbox Linux Apache PHP
=======

![enter image description here](https://circleci.com/gh/mcolabs/lap-symfony.svg?style=shield&circle-token=:circle-token)
[![Build Status](https://travis-ci.org/mcolabs/lap-symfony.svg)](https://travis-ci.org/mcolabs/lap-symfony)

Build image:
---------------

    docker build -t "20uf/lap-symfony" . 

Run
---------------

    docker run -d -p 80:80 20uf/lap-symfony -v /your/project:/

Run console mode
---------------

    docker run -p 80:80 -a stdin -a stdout -i -t 20uf/lap-symfony /bin/bash


