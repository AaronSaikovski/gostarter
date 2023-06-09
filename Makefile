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
	go build $(GOFLAGS) -o bin/${TARGET} main.go

## buildandrun - builds and runs the program on the target platform
buildandrun: build
	./bin/${TARGET}

## run - runs main.go for testing
run: dep
	go run main.go


## clean - Remove the old builds and any debug information
clean:
	go clean
	rm bin/${TARGET}

## test - executes unit test
test:
	go test ./...

## dep - fetches any external dependencies
dep:
	go mod tidy
	go mod download

## vet - Vet examines Go source code and reports suspicious constructs
vet:
	go vet

## staticcheck - Runs static code analyzer staticcheck
staticcheck: 
	go run honnef.co/go/tools/cmd/staticcheck@latest -checks=all,-ST1000,-U1000 ./...

## tidy - format code and tidy modfile
tidy:
	go fmt ./...
	go mod tidy -v