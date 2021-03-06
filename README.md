# xbash

## Introduction

Xbash is a crowd of alias and tiny command line tools. 

## Installation

    $ cd 
    $ git clone https://github.com/barrykui/.xbash
    $ vi ~/.bashrc

add `~/.xbash` to the environment `PATH`:

    export XBASH=$HOME/xbash
    source $XBASH/.bashrc
    export PATH=$PATH:$XBASH

   

then source your local `~/.bashrc` file,

    $ source ~/.bashrc

If it still dosen't work, use command:

    $ xbash


For `.vimrc` file, just link the file:
  
    $ ln -s ~/xbash/.vimrc ~/.vimrc

For `.tmux.conf` file, just link the file:
  
    $ cd ~/xbash/
    $ git clone https://github.com/barrykui/.tmux.git
    $ ln -s ~/xbash/.tmux/.tmux.conf ~/.tmux.conf

## Fix https certs

```
curl https://get.acme.sh | sh
sudo ./.acme.sh/acme.sh --issue --force -d example.com -w /path/to/webdir
```

## Tools


| Tool              | Description |
| ----------------- |:---------------------|
|pxg python         |show the running python threads|
|hg python          |grep history|
|o ls               |loop excute your command |
|ncol test.txt      |count the column(tab sep)   |  
|countfas test.fa   |count the length of fasta |
|sedxkn             |print specific line(s)|
|pdbpath 3jb1       |print the full path of a PDB file |
|ert  a.tar.gz      |extraction king |
|xmail -u xx@x.com -s “bowtie finished”  | email in command line |  
|xgpu               |print the free gpu id|
|xmonitor           |GPU monitor|
|xgit	            |self git |
|xparallel.sh       |A tiny parallel framework|
|thuin name passwd  |login to Tsinghua Campus Net|
|thuout             |logout from Tsinghua Campus Net|


## CUDNN

``` shell
    ./xcudnn ~/usr/cuda /usr/local/cuda-8.0/
```

## Parallel Soulution

- [`xparallel.sh`](https://github.com/barrykui/xbash/blob/master/xparallel.sh)
- [`Concu`](https://github.com/barrykui/Concu)
- [`GNU Parallel`](https://www.gnu.org/software/parallel/)

## Tsinghua Tuna Mirror

- [`Anaconda`](https://mirrors.tuna.tsinghua.edu.cn/help/anaconda/)
``` shell
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --set show_channel_urls yes
```
- [`pip`](https://mirrors.tuna.tsinghua.edu.cn/help/pypi/)
``` shell
$ mkdir ~/.pip; echo -e "[global]\nindex-url = https://pypi.tuna.tsinghua.edu.cn/simple" > ~/.pip/pip.conf
```
- [`Tensorflow`](https://mirrors.tuna.tsinghua.edu.cn/help/tensorflow/)


##  Installing oh-my-zsh Offline

 - 0. Before start, install git and zsh
 
```
# for installing on Ubuntu
sudo apt-get install zsh

# for installing from source
http://zsh.sourceforge.net/Arc/source.html
```

- 1. Go to the repository and download the zip file
https://github.com/robbyrussell/oh-my-zsh

Open the zip file and extract to your home folder, and rename to .oh-my-zsh
oh-my-zsh-master -> ~/.oh-my-zsh

- 2. Save the file [install-oh-my-zsh.sh](https://gist.github.com/hewerthomn/65bb351bf950470f6c9e6aba8c0c04f1#file-install-oh-my-zsh-sh) to your home folder, like ~/install-oh-my-zsh.sh

- 3. Give permission to execute

```
chmod +x install-oh-my-zsh.sh

# Run the script
./install-oh-my-zsh.sh
```

> - copy&paste from [hewerthomn](https://github.com/hewerthomn)


##### TODO
- [x] xbash not work, bug should be fired;
- [ ] .vim folder should be committed to here;    
- [ ] Go through
- [ ] a good google hosts
[`Penlight`](https://github.com/stevedonovan/Penlight) [`documentation`](http://stevedonovan.github.io/Penlight/api/manual/01-introduction.md.html)




## Acknowledgement
This tools are frequently used in our daily life, lots of my time are saved by using these tiny commands.



## Ha
