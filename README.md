## Deployment

the file `build.sh` contains the docker commands for:
- Deleting the container
- Building a new container
- Deploying new contianer

Once deployed the application will be found running on `127.0.0.1:3000`

# Linux
```
sudo bash build.sh
```

# Windows
You MUST have wsl + docker working and setup first.
in WSL
```
bash build.sh
```
