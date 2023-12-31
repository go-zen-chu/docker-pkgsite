FROM golang:1.21.3 AS gobuilder

# use static link build
ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64

WORKDIR /usr/local/src/repo

RUN <<EOF
    git clone https://github.com/golang/pkgsite.git /usr/local/src/repo
    go build -o pkgsite ./cmd/pkgsite/*.go
EOF

FROM golang:1.21.3

COPY --from=gobuilder /usr/local/src/repo/pkgsite /bin/pkgsite

ENTRYPOINT ["pkgsite"]
