GOLANG_PKG := my-app

clean:
	docker rm -f ${GOLANG_PKG} || true

docker-build:
	docker build -f deploy/Dockerfile . -t ${GOLANG_PKG}

docker-run:
	docker run --env-file ${GOLANG_PKG}

docker-all: docker-build docker-run

build:
	go build -o ./bin/${GOLANG_PKG} ./cmd/${GOLANG_PKG}/main.go

run:
	go run ./cmd/${GOLANG_PKG}/main.go

test:
	go test -v ./...