Install docker on Debian Buster 

https://docs.docker.com/engine/install/debian/

check for updates
```sh
# apt update
# apt upgrade
```

install the follwing packages
```sh
# apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
```

add repository and gpg key
```sh
# add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

# curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

```

install docker
```sh
# apt update
# sudo apt-get install docker-ce docker-ce-cli containerd.io
``` 
