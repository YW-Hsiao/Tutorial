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



### 1-5. gitignore
[![gitignore](https://img.shields.io/badge/github-gitignore-blue)](https://github.com/github/gitignore)
1. If we want to ignore some file or folder, we just need to add `.gitignore` file into our repository.
2. Before add `.gitignore`, there are existences of file or folder, we cannot ignore them. In other hand, `.gitignore` only ignore untracked files, so we need to clear the local Git cache, which is equivalent to remove all files, but no files are deleted.
3. And then re-join Git tracking, then the `.gitignore` setting will be applied.
4. Submit and push, therefore the files or folders will be excluded.
```
git rm -r --cached .
git add .
git commit -m 'update .gitignore'
```




### 1-6. 
1. If there is a existence of repository, and you want to add a new folder to it
    ```ruby
    mkdir "new folder"
    git config --global user.name "your name"
    git config --global user.email "your email"
    git config --list
    git init
    ls -al
    git add .
    git commit -m "first commit"
    git remote add origin https://github.com/YW-Hsiao/Test.git
    git push -u origin main
    ```
    The feedback is
    ```
    error: src refspec main does not match any.
    error: failed to push some refs to 'https://github.com/YW-Hsiao/Test.git'
    ```
    
    



### 1-7. submodule
[![submodule](https://img.shields.io/badge/GitHub-submodule-blue)](https://blog.puckwang.com/post/2020/git-submodule-vs-subtree/#%E6%96%B0%E5%A2%9E-submodule)
1. In terminal, we go to the `SuperRepo`, and execute `git submodule add` to add `SubRepo`:
    ```ruby
    cd <where>/SuperRepo
    git submodule add <sub-repo url> <folder>
    e.g.
    git submodule add https://github.com/YW-Hsiao/Test_v7.git Test_v7
    ```
    The feedback is
    ```
    Cloning into '/youwei_home/GitHub_Test/Test_v6/Test_v7'...
    ```
    and enter your `Username` and `Password`:
    ```
    Username for 'https://github.com': <ID>
    Password for 'https://YW-Hsiao@github.com': <Password>
    ```
    The feedback is
    ```
    remote: Enumerating objects: 3, done.
    remote: Counting objects: 100% (3/3), done.
    remote: Total 3 (delta 0), reused 3 (delta 0), pack-reused 0
    Unpacking objects: 100% (3/3), 208 bytes | 208.00 KiB/s, done.
    ```
2. Use `git status` to look over status:
    ```
    On branch main
    Your branch is up to date with 'origin/main'.
    
    Changes to be committed:
      (use "git restore --staged <file>..." to unstage)
            new file:   .gitmodules
            new file:   Test_v7
    ```
3. And then use `git commit` and `git push` to complish the submodule:
    ```ruby
    git commit -m "add submodule"
    ```
    The feedback is
    ```
    [main f8a5744] add submodule
     2 files changed, 4 insertions(+)
     create mode 100644 .gitmodules
     create mode 160000 Test_v7
    ```
    Use `git status`:
    ```
    On branch main
    Your branch is ahead of 'origin/main' by 1 commit.
      (use "git push" to publish your local commits)
      
    nothing to commit, working tree clean
    ```
    ```ruby
    git push -u origin main
    ```
    Enter:
    ```
    Username for 'https://github.com': <ID>
    Password for 'https://YW-Hsiao@github.com': <Password>
    ```
    ```
    Enumerating objects: 4, done.
    Counting objects: 100% (4/4), done.
    Delta compression using up to 80 threads
    Compressing objects: 100% (3/3), done.
    Writing objects: 100% (3/3), 426 bytes | 426.00 KiB/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/YW-Hsiao/Test_v6.git
       0aa9d3a..f8a5744  main -> main
    Branch 'main' set up to track remote branch 'main' from 'origin'.
    ```
    
    
    
### 1-8. 
1. After update the `git-sub-module`, how to update `git-main-module`?
    ```ruby
    cd <where>/git-sub-module
    echo "update sub module content" >> sub.txt
    git add .
    git commit -m "update content"
    git push -u origin main
    ```
    We will see the repo. of `git-sub-module` to be updated, but you can find the `git-sub-module` folder of the repo. of `git-main-module` connect the old repo. of `git-sub-module`. So that we need to synchronize the repo. of `git-sub-module` in the repo. of `git-main-module`.
    ```ruby
    cd <where>/git-main-module
    git submodule update --remote --merge (failure)
    git submodule foreach --recursive git pull origin main (successful)
    git add .
    git commit -m "update submodule"
    git push -u origin main
    ```





    

    
    
    