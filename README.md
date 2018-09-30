## Simple Web

A simple web development environment. Please take your risks if you are running on a production environment.

## Usage

The only thing you need to do is installing `Docker` and `Docker-compose`.

1. Put the files of your website or run the command below on `./www/public`.

```
cp site.conf.sample nginx-config/site.conf && mkdir -p www/public && echo '<?php phpinfo();' > www/public/index.php
```

2. Run the command on your terminal.

```
docker-compose up -d
```

3. Type `http://your-domain:port` on browser. Commonly, it might be [http://localhost:80](http://localhost:80) or [http://127.0.0.1:80](http://127.0.0.1:80)



## Nginx Configuration

The file `./nginx-config/site.conf` is a minimal site configuration for PHP. Modify this file please if you have specific requirements.

## Services

Only provide a normal php docker file. Change it or add a new docker file to meet your requirements.

## License

MIT.