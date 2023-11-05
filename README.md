# pkgsite-k8s

golang pkgsite docker image.


```bash
# help
docker run --rm pkgsite:latest --help

usage: pkgsite [flags] [PATHS ...]
    where each PATHS is a single path or a comma-separated list
    (default is current directory if neither -cache nor -proxy is provided)
  -cache
        fetch from the module cache
  -cachedir go env GOMODCACHE
        module cache directory (defaults to go env GOMODCACHE)
  -dev
        enable developer mode (reload templates on each page load, serve non-minified JS/CSS, etc.)
  -gopath_mode
        assume that local modules' paths are relative to GOPATH/src
  -gorepo string
        path to Go repo on local filesystem
  -http string
        HTTP service address to listen for incoming requests on (default "localhost:8080")
  -list
        for each path, serve all modules in build list (default true)
  -open
        open a browser window to the server's address
  -proxy
        fetch from GOPROXY if not found locally
  -static string
        path to folder containing static files served (default "static")

# run localhost server
docker run --rm -v $PWD/sample:/repo -w /repo -p8080:8080 pkgsite:latest -http 0.0.0.0:8080
```
