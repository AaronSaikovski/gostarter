# Define Go command and flags
GO = go
GOFLAGS = -ldflags="-s -w"

# Define the target executable
TARGET = gostarter

build:
	GOARCH=amd64 GOOS=darwin go build $(GOFLAGS) -o bin/${TARGET}-darwin main.go
	GOARCH=amd64 GOOS=linux go build $(GOFLAGS) -o bin/${TARGET}-linux main.go
	GOARCH=amd64 GOOS=windows go build $(GOFLAGS) -o bin/${TARGET}-windows main.go


run: build
	./bin/${TARGET}-darwin 

clean:
	go clean
	rm bin/${TARGET}-darwin
	rm bin/${TARGET}-linux
	rm bin/${TARGET}-windows

test:
	go test ./... -coverprofile=coverage.out

dep:
	go mod download

vet:
	go vet

lint:
	golangci-lint run --enable-all