FROM golang:1 AS development-image

# Define current working directory.
WORKDIR /flight-school

# Download modules to local cache so we can skip re-downloading
# on consecutive docker-compose builds commands
COPY go.mod .
COPY go.sum .
RUN go mod download

# Copy the source code over
COPY . .

# Install CompileDaemon for auto installing binary on changes
RUN go get -u github.com/githubnemo/CompileDaemon

# Install godog for behavior testing
RUN go get -u github.com/cucumber/godog/cmd/godog

# Automatically install binary on source code changes
CMD CompileDaemon -build="make install" -command="api"
