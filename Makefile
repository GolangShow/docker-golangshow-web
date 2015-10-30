PWD=$(shell pwd)
build:
	docker build -t miolini/golangshow-web .
run: build stop
	docker run --name golangshow-web \
		-p 80:80 \
		-p 443:443 \
		-v $(PWD)/nginx.conf:/etc/nginx/conf.d/nginx.conf \
		-v $(PWD)/../golangshow-data:/data \
		-d -it miolini/golangshow-web
shell: clean_shell build
	docker run --name golangshow-web-shell \
		-v $(PWD)/nginx.conf:/etc/nginx/conf.d/nginx.conf \
		-v $(PWD)/../golangshow-data:/data \
		-it miolini/golangshow-web
stop:
	docker rm -f golangshow-web || true
clean_shell:
	docker rm -f golangshow-web-shell || true