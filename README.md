# kuzu-docker-test
## Build
```bash
docker build -t kuzu-docker-test .
```

## Run
```bash
mkdir -p db
docker run -v ./db:/database -v ./data:/data kuzu-docker-test
```
