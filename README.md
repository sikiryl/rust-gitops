
# Software SCM Workshop

## How to run on local
**Way 1: set environment before run**
```bash
export ENDPOINT=wwww.nongped.com
export PORT=8080
export PRINT_ENV=prod
```

and then 

```bash
cargo run
```

**Way 2: Run with environment**
```bash
ENDPOINT=wwww.nongped.com PORT=8080 PRINT_ENV=prod cargo run 
```

## how to run in Container
Disclaimer: This is made for only testing on local don't use this way in pipeline because I skip fill tag version.

**Build container**
```bash
docker build -t nongkai .
```

```bash
docker run -d -p 8080:8080 -e ENDPOINT=www.google.com -e PORT=8080 -e PRINT_ENV=dev --env-file .env nongkai 
```

## Run Automation step"
```bash
bash deploy.bash
```