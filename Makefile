# Define Go command and flags
GO = go
GOFLAGS = -ldflags="-s -w"

# Define the target executable
TARGET = gostarter

## help - Display help about make targets for this Makefile
help:
	@cat Makefile | grep '^## ' --color=never | cut -c4- | sed -e "`printf 's/ - /\t- /;'`" | column -s "`printf '\t'`" -t

## build - Builds the project in preparation for release
build:
	GOARCH=amd64 GOOS=darwin go build $(GOFLAGS) -o bin/${TARGET}-darwin main.go
	GOARCH=amd64 GOOS=linux go build $(GOFLAGS) -o bin/${TARGET}-linux main.go
	GOARCH=amd64 GOOS=windows go build $(GOFLAGS) -o bin/${TARGET}-windows main.go

## run - runs the program on the target platform
run: build
	./bin/${TARGET}-darwin 

## clean - Remove the old builds and any debug information
clean:
	go clean
	rm bin/${TARGET}-darwin
	rm bin/${TARGET}-linux
	rm bin/${TARGET}-windows

## test - executes unit test
test:
	go test ./... -coverprofile=coverage.out

## dep - fetches any external dependencies
dep:
	go mod download

## vet - Vet examines Go source code and reports suspicious constructs
vet:
	go vet

## lint - performs linting on the source files
lint:
	golangci-lint run --enable-all