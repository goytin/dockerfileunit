# Dockerfile Unit
The project allows to create a Dockerfile from smaller components.
This helps to keep Dockerfile relatively small and observable.

## Usage
### Dockerfile.main
First create Dockerfile.main file. You may use `examples/Dockerfile.main`
as the base. Modify it as you wish.

### env.txt
Now create env.txt file which holds information like Docker image name,
Docker container name, volume(s) to mount, command to run and similar.
Copy `examples/env.txt` and modify appropriately.

### Create Docker image
Do
```
./tools/create-image.sh
```

### Create Docker container
Do
```
./tools/create-container.sh
```
