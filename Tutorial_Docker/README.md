## 3. Docker Commands
1. Basic  
    `docker ps`: Look over the operating container.  
    > `docker ps -a`: More detail
    
    `docker images`: Look over the images.  
    `docker stats` and `ctrl+c`: Look over the containers.
    
2. JupyterLab  
    In your container
    ```
    ssh -N -f -L localhost:<port number>:localhost:<port number> <username>@server-ip
    e.g.
    ssh -N -f -L localhost:6699:localhost:6699 youwei@140.114.94.174
    ```
    
3. CPU workstation VPN jupyterlab
    ```
    jupyter lab --ip 192.168.88.247 --allow-root
    ```



