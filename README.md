## Simple Web

A simple web development environment. Please take your risks if you are running on a production environment.

## Usage

The only thing you need to do is installing `Docker` and `Docker-compose`.

1. Put the files of your website or run the command below on `./www/default/public` to set default site.


```
cp services/nginx.conf config/nginx/nginx.conf && cp services/site.default.conf config/nginx/vhost/site.conf && mkdir -p www/default/public && echo '<?php phpinfo();' > www/default/public/index.php

## May update server name or your domain in ./config/nginx/vhost/site.conf
```

2. Run the command on your terminal.

```
docker-compose up -d
```

3. Add a line in your hosts file, like

```
127.0.0.1   www.example.com
```

4. Type `http://your-domain:port` on browser. Commonly, it might be [http://localhost:80](http://localhost:80) or [http://127.0.0.1:80](http://127.0.0.1:80)


## Nginx Configuration

The file `./config/nginx/vhost/site.conf` is a minimal site configuration for PHP. Modify this file please if you have specific requirements.

## Services

Only provide a normal php docker file. Change it or add a new docker file to meet your requirements.

## License

MIT.