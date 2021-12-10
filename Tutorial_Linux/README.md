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
    > `rm -ri`
    
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
    ```
    rsync -avh --include '*.cmnd' --exclude '.*/' --exclude 'Analysis/' --exclude 's/' --include '*/' --exclude '*' ./ ../../backup_2/
    ```
    ```
    rsync -avh --include '*.hepmc' --exclude '.*/' --exclude 'Analysis/' --exclude 's/' --include '*/' --exclude '*' ./ ../PYTHIA_Experts/
    rsync -avh --include '*.root' --exclude '.*/' --exclude 'Analysis/' --exclude 's/' --include '*/' --exclude '*' ./ ../PYTHIA_Experts/
    rsync -avh --include '*.log' --exclude '.*/' --exclude 'Analysis/' --exclude 's/' --include '*/' --exclude '*' ./ ../PYTHIA_Experts/
    ```
    Remote PYTHIA_Experts_tms
    ```
    rsync -avh --include '*.cmnd' --exclude '.*/' --exclude 'Analysis/' --exclude 's/' --exclude 'analysis/' --include '*/' --exclude '*' ./ ../CERNBox/PYTHIA_Experts_tms/
    ```
    ```
    rsync -avh --include '*.hepmc.gz' --exclude '.*/' --exclude 'Analysis/' --exclude 's/' --exclude 'analysis/' --include '*/' --exclude '*' ./ ../CERNBox/PYTHIA_Experts_tms/
    rsync -avh --include '*.root' --exclude '.*/' --exclude 'Analysis/' --exclude 's/' --exclude 'analysis/' --include '*/' --exclude '*' ./ ../CERNBox/PYTHIA_Experts_tms/
    rsync -avh --include '*.log' --exclude '.*/' --exclude 'Analysis/' --exclude 's/' --exclude 'analysis/' --include '*/' --exclude '*' ./ ../CERNBox/PYTHIA_Experts_tms/
    rsync -avh --include '*.tar.gz' --exclude '.*/' --exclude 'Analysis/' --exclude 's/' --exclude 'analysis/' --include '*/' --exclude '*' ./ ../CERNBox/PYTHIA_Experts_tms/
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
    ```
    gzip -kv -9 test_1.txt > compressing.out 2>&1
    gzip -d test_1.txt.gz
    ```
    ```
    nohup gzip -kv -9 ckkwl-4.hepmc > compressing.out 2>&1 &
    nohup gzip -kv -6 ckkwl-4.hepmc > compressing-4.out 2>&1 &
    nohup gzip -kv -6 ckkwl-8.hepmc > compressing-8.out 2>&1 &
    ```
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
    `cat`. 
    `df -h`: Look over the size of systematic storage.  
    `du -hs <where>/"folder"`: Show the size of folder.  
    `du -chd 1 | sort -h`: List all size of folders in current path and sort them.  
    `htop`: Look over CPU.  
    `free -h`: Look over RAM.
    



