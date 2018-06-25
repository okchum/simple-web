## Simple Web

A simple web development environment. Please take your risks if you are running on a production environment.

## Usage

The only thing you need to do is installing `Docker` and `Docker-compose`.

1. Put the files of your website or run `mkdir -p www/public && echo '<?php phpinfo();' > www/public/index.php` on `./www/public`.

2. Run this command `docker-compose up -d` on your terminal.

3. Type `http://your-domain:port` on browser.

## Nginx Configuration

`./nginx_config/site.conf` is a minimal site environment for PHP. Modify this file please if you have specific requires.

## Services

Only provide a normal php docker file. Change it or add a new docker file to meet your requests.

## License

MIT.