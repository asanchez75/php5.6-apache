# php5.6 with apache 

> Symfony sandbox Linux Apache PHP

![enter image description here](https://circleci.com/gh/registry-docker/lap-symfony.svg?style=shield&circle-token=:circle-token)

Build image:
---------------

    docker build -t "registry-docker/php5.6-apache" . 

Run
---------------

    docker run -d -p 80:80 registry-docker/php5.6-apache  -v /your/project:/vhost/current/

Run console mode
---------------

    docker run -p 80:80 -a stdin -a stdout -i -t registry-docker/php5.6-apache  /bin/bash


## License

Copyright &copy; 2016 [Michael COULLERET aka 20uf](http://github.com/20uf). Licensed under the terms of the [MIT license](LICENSE.md).
