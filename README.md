# Tutorial
Tutorial is important record about basic commands!!

## 1. GitHub
1. If your repository has already existed in GitHub, you must first clone into your local site.
    ```ruby
    git clone <url>
    e.g. https://github.com/YW-Hsiao/Test
    git clone https://github.com/YW-Hsiao/Test.git
    ```
    After download, we can use `git remote` to look over remote database list, we will find that Git will also bind the origin remote database by default. So you do NOT need to execute `git remote add` to join the remote database.  
    If you have no repository in GitHub, we must setup individual informations
    ```ruby
    git config --global user.name "your name"
    git config --global user.email "your email"
    ```
    This will record which developer made the version. You may use following command to check.
    ```ruby
    git config --list
    q
    ```
    Now, we will construct the local database (Repository). First, you need make a directory, and then go into this folder to execute
    ```ruby
    mkdir "folder"
    cd "folder"
    git init
    ```
    You are going to get the feedback to demonstrate you have successfully established a local repository.
    ```ruby
    $ git init
    Initialized empty Git repository in <path of project>/.git/
    ```
    If `.git` has already existed,
    ```
    Reinitialized existing Git repository in <path of project>/.git/
    e.g.
    Reinitialized existing Git repository in /Storage/youwei/GitHub/SVJ-ATLAS/.git/
    ```
    This command means construct a `.git` directory in your "folder". `.git` record any version control. We can use `ls -al` to check. We may exploit useful command `git status` to look over what our next step is. We found that Untracke files.
    ```
    On branch main
    Your branch is up to date with 'origin/main'.
    
    Untracked files:
      (use "git add <file>..." to include in what will be committed)
      
      	"files" or "folders"
        e.g.
        t-channel_ckkwl-v1/
       
    nothing added to commit but untracked files present (use "git add" to track)
    ```
    Git has detected that you have added these files, but it is not yet tracked by Git. Therefore, we must add to the staging area (index), and then "files" or "folders" can be added to the tracking object.
    ```ruby
    git add "file"; git add "folder"
    git add .
    e.g.
    git add README.md
    ```
    
    
    
    ```
    git remote add origin https://github.com/YW-Hsiao/SVJ.git
    git add .
    git add README
    
    git commit -m "first commit v.1.0"
    
    git push -u origin main
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
    





## 4. Test Markdown Commands
### 4-1. Typesetting
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
### 4-2. Hyperlink
[![Build Status](http://img.shields.io/travis/clips/pattern/master.svg?style=flat)](https://travis-ci.org/clips/pattern/branches)
[![Coverage](https://img.shields.io/coveralls/clips/pattern/master.svg?style=flat)](https://coveralls.io/github/clips/pattern?branch=master)
[![PyPi version](http://img.shields.io/pypi/v/pattern.svg?style=flat)](https://pypi.python.org/pypi/pattern)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-green.svg?style=flat)](https://github.com/clips/pattern/blob/master/LICENSE.txt)



### 4-3. Color
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
4. Fourth way
```
<div class="text-purple">
    This text is purple, <a href="#" class="text-inherit">including the link</a>
</div>
```

<div class="text-purple">
    This text is purple, <a href="#" class="text-inherit">including the link</a>
</div>  
<div class="text-purple">
  This text is purple, <a href="#" class="text-inherit">including the link</a>
</div>  






<div class="text-blue mb-2">
  .text-blue on white
</div>  
`<div class="text-blue mb-2">
  .text-blue on white
</div>`
```
<div class="text-blue mb-2">
  .text-blue on white
</div>
```


### 4-4. Pattern
[![Unicode](https://home.unicode.org/wp-content/uploads/2019/12/Unicode-Logo-Final-Blue-95x112.jpg)](https://home.unicode.org/)  
[Unicode Character Table](https://unicode-table.com/en/)  
The Unicode number:  
U+1F53A  
\1F53A  
&#128314;
&#128315;
&#10071;
&#8252;  
I use &#10071;&#128314; sentence &#128315; as NOTICE.




