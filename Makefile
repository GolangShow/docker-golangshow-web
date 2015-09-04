PWD=$(shell pwd)
build:
	docker build -t miolini/golangshow-web .
run: stop build
	docker run --name golangshow-web \
		-p 80:80 \
		-v $(PWD)/nginx.conf:/etc/nginx/conf.d/nginx.conf \
		-v $(PWD)/data:/data \
		-d -it miolini/golangshow-web
stop:
	docker rm -f golangshow-web || true