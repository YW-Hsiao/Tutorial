# Tutorial
Tutorial is important record about basic commands!!

## 1. GitHub
1. First,
```
git config --global user.name "your name"
git config --global user.email "your email"
git config --list
```








## 2. Linux (macOS) Commands
`"folder"=the name of folder; "file"=the name of file`
1. Path  
`pwd`: Print working folder = path of current location.  
`ls`: Print all files of current location.
    > `ls -a`  
    > `ls -l`  
    > `ls -al`
    
    `cd`: Switch path.  
    > `cd ..`: Go back to previous layer.
    ```
    cd "folder"  
    cd ./"folder"  
    cd <where>/"folder"
    ```
    > `cd ..`: Go back to previous layer.  
    > `cd ~`: Go to home directory.  
    > `cd /`: Go to root directory.
2. Operation  
`mkdir`: Make Directory.
    ```
    mkdir "folder"
    ```
    `touch`: Create file or modify file time.
    ```
    touch "file"
    ```
    > If file is absence, then it will add a file.  
    > If file is existing, then file time will be changed to current time.  
    > `touch main.py abc.py xyz.txt`: Create 3 files.
    
    `rm`: Remove or Delete file.
    > `rm -r "folder"`: Remove folder and all files inside.  
    > `rm -f`:  
    > `rm -rf`:  
    
    `cp`: Copy/Paste
    ```
    cp "file1" "file2"
    cp -r "folder1" "folder2"
    rsync -avh "file1" "file2"
    ```
    `mv`: Move file of change file name.
    ```
    mv "file" "folder"
    mv "file" "new_name file"
    ```
    `rsync`: Copy/Paste
    ```
    rsync -parameters "source file" "destination file"
    ```
    > `-a`: = -rlptgoD, leave detail.
    > `-v`: Verbose mode, output more detail information.
    > `-h`: Output number as easily reading format.
    > `-z`: Start compression.
    > `-r`: Recursive backup all directories and files under sub-directory.
    Simply copy/paste local file or folder.
    ```
    rsync -avh <where>/"file" <where>/"folder"
    rsync -avh <where>/"folder" <where>/"folder"/
    ```
    Remote
    ```
    rsync -avzh <where>/"file" <pi>@192.168.1.12:<where>/mybackup/
    ```
3. Word editor  
`vim`: Creat a txt file.
    ```
    vim "file"
    ```
    > `i`: Insert mode  
    > `esc`: Ordinary mode  
    > `:q`: Exit  
    > `:wq`: Save and exit  
    > `q!`: Not save and exit
4. Compression  
`gzip`: Compress file.
6. Others  
    `clear`: Clear terminal layouts.  
    `grep`: Catch and highlight key words.  
    ```
    grep "keyword" "file"
    ```
    `sed`:  
    `wget`: Download  
    `curl`: Send out request.  
    `>`: Redirection, redirect input output
    `|`:  
    `echo`:  
    `cat`
    




## 3. Docker Commands
1. Basic  
    `docker ps`: Look over the operating container.  
    > `docker ps -a`: More detail
    
    `docker images`: Look over the images.
    `htop`: Look over CPU.
    `free -h`: Look over RAM.
2. JupyterLab  
    In your container
    ```
    ssh -N -f -L localhost:<port number>:localhost:<port number> <username>@server-ip
    e.g.
    ssh -N -f -L localhost:6699:localhost:6699 youwei@140.114.94.174
    ```
    





## Test Markdown Commands
### Typesetting
1. First way  
abc  
123
```
abc
```
    123
    ```
    xyz
    ```
2. Second way  
abc
123
    ```
    xyz
    ```
    ijk

### Color
1. First way
```diff
- text in red
+ text in green
! text in orange
# text in gray
```
```diff
- abc
+ 123
! xyz
@@ text in purple and bold @@
```
```diff
abc
```
`- abc`  
`+ 123`  
`! xyz`  
2. Second way  
![#FF0000](https://placehold.it/15/FF0000/000000?text=+)`abc`  
![#FF0000](https://placehold.it/15/FF0000/000000?text=+)`abc`

3. Third way
```js
abc
123
xyz
```
```ruby
abc
123
xyz {ijk}
```
<span style="color: green"> Some green text </span>



4. B  




