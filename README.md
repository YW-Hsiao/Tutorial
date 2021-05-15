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
      
        "file" or "folder"
        e.g.
        t-channel_ckkwl-v1/
       
    nothing added to commit but untracked files present (use "git add" to track)
    ```
    Git has detected that you have added these files, but it is not yet tracked by Git. Therefore, we must add to the staging area (index), and then "file" or "folder" can be added to the tracking object.
    ```ruby
    git add "file"; git add "folder"
    git add .
    e.g.
    git add README.md
    ```
    Use `git status` to see feedback.
    ```
    On branch main
    Your branch is up to date with 'origin/main'.
    
    Changes to be committed:
      (use "git reset HEAD <file>..." to unstage)
      
    	new file:   <where>/"file"
        e.g.
        new file:   t-channel_ckkwl-v1/.ipynb_checkpoints/changePID-checkpoint.log
    ```
    `Changes to be committed` means the files placed in the index will be submitted to a new version (commit). We can exploit following command to commit a new version.
    ```ruby
    git commit -m "remark"
    e.g.
    git commit -m "first commit"
    git commit -m "first commit v.1.0"
    ```
    The feedback is
    ```
    [main <number>] "remark"
     <number of object> files changed, <number> insertions(+)
     create mode <number> <where>/"file"
    e.g.
    [main 5a53b44] first commit v.1.0
     47 files changed, 38695 insertions(+)
     create mode 100644 t-channel_ckkwl-v1/.ipynb_checkpoints/changePID-checkpoint.log
    ```
    Congratulation, we construct first version via Git. If we use `git status`, we obtain
    ```
    On branch main
    Your branch is ahead of 'origin/main' by 1 commit.
      (use "git push" to publish your local commits)
      
    nothing to commit, working tree clean
    ```
    Because we had just submitted "file" as a version (commit), the current working directory has been emptied. If we would like to investigate added version,
    ```ruby
    git log
    q
    ```
    The feedback is
    ```
    commit <number> (HEAD -> main)
    Author: "your name" <"your email">
    Date:   "your update time" +0800
    
        "remark"
    e.g.
    commit 5a53b449adea3bf71cced7d67cea833e6b84da8b (HEAD -> main)
    Author: YW-Hsiao <hsiao.phys@gapp.nthu.edu.tw>
    Date:   Mon Mar 29 16:08:15 2021 +0800
    
        first commit v.1.0
    ```
2. We will discuss how to push repository into GitHub.
    ```ruby
    git remote add <remote repository abbreviation> <url>
    e.g.
    git remote add origin https://github.com/YW-Hsiao/SVJ.git
    git remote add origin https://github.com/YW-Hsiao/Test_v2.git
    ```
    The feedback is
    ```
    fatal: remote origin already exists.
    ```
    Use `git status` to check
    ```ruby
    git push -u origin main
    ```
    The feedback is
    ```
    Username for 'https://github.com': <ID>
    Password for 'https://YW-Hsiao@github.com': <password>
    Counting objects: 49, done.
    Delta compression using up to 80 threads.
    Compressing objects: 100% (49/49), done.
    Writing objects: 100% (49/49), 762.08 KiB | 5.44 MiB/s, done.
    Total 49 (delta 25), reused 0 (delta 0)
    remote: Resolving deltas: 100% (25/25), done.
    To https://github.com/YW-Hsiao/SVJ-ATLAS.git
       cf4c188..5a53b44  main -> main
    Branch 'main' set up to track remote branch 'main' from 'origin'.
    ```
    


### 1-2. The faster workflow



### 1-3. Useful commands
```
git status
git log
git remote
git remote -v
```
    


### 1-4. pull
1. Download sync update
    ```ruby
    cd <where>/"folder"
    git pull
    git pull origin main
    
    input "your name"
    input " your password"
    ```
    The feedback is
    ```
    remote: Enumerating objects: 4, done.
    remote: Counting objects: 100% (4/4), done.
    remote: Compressing objects: 100% (2/2), done.
    remote: Total 3 (delta 1), reused 0 (delta 0), pack-reused 0
    Unpacking objects: 100% (3/3), done.
    From https://github.com/YW-Hsiao/Test
       9a1e67a..2767a68  main       -> YW/main
    Updating 9a1e67a..2767a68
    Fast-forward
     README.md | 3 +++
     1 file changed, 3 insertions(+)
     create mode 100644 README.md
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
* [Tutorial README](https://github.com/guodongxiaren/README#%E6%A8%AA%E7%BA%BF)  
* [Unicode Character Table](https://unicode-table.com/en/)  
* [![Unicode](https://home.unicode.org/wp-content/uploads/2019/12/Unicode-Logo-Final-Blue-95x112.jpg)](https://home.unicode.org/)  
* [Shields](https://shields.io/)
    * ![Shields IO](https://img.shields.io/badge/Shields-IO-red)
    * [![Shields IO](https://img.shields.io/badge/Shields-IO-red)](https://shields.io/)  
    * ![YW-Hsiao/SVJ-ATLAS](https://img.shields.io/coveralls/github/YW-Hsiao/SVJ-ATLAS?style=plastic)  
    * [![YW-Hsiao/SVJ-ATLAS](https://img.shields.io/badge/YW--Hsiao-SVJ--ATLAS-blue)](https://github.com/YW-Hsiao/SVJ-ATLAS)

Another examples:
[![Build Status](http://img.shields.io/travis/clips/pattern/master.svg?style=flat)](https://travis-ci.org/clips/pattern/branches)
[![Coverage](https://img.shields.io/coveralls/clips/pattern/master.svg?style=flat)](https://coveralls.io/github/clips/pattern?branch=master)
[![PyPi version](http://img.shields.io/pypi/v/pattern.svg?style=flat)](https://pypi.python.org/pypi/pattern)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-green.svg?style=flat)](https://github.com/clips/pattern/blob/master/LICENSE.txt)


### 4-3. Table
1. [Fooish HTML table](https://www.fooish.com/html/table.html)  
2. [HTML 表格的基礎](https://developer.mozilla.org/zh-TW/docs/Learn/HTML/Tables/Basics)  
3. [MDN Web Docs table](https://developer.mozilla.org/zh-TW/docs/Web/HTML/Element/table)  
4. [Wibibi HTML table](https://www.wibibi.com/info.php?tid=116)  
5. [Wibibi HTML font](https://www.wibibi.com/info.php?tid=397)

<table>
    <tr>
        <td>1</td>
        <td>2</td>
        <td>3</td>
        <td>4</td>
    </tr>
    <tr>
        <td>5</td>
        <td rowspan="0">6</td>
        <td>7</td>
        <td>8</td>
    </tr>
    <tr>
        <td>9</td>
        <td>11</td>
        <td>12</td>
    </tr>
    <tr>
        <td>13</td>
        <td>15</td>
        <td>16</td>
    </tr>
</table>


### 4-4. Color
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


### 4-5. Pattern
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




