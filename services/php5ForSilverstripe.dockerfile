FROM brettt89/silverstripe-web:5.6

RUN apt-get update -y && apt-get install -y mysql-client \
	--no-install-recommends && \
	apt-get autoremove -y && \
	rm -rf /var/lib/apt/lists/*

EXPOSE 80
CMD ["apache2-foreground"]