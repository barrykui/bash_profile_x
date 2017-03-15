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

## Parallel Soulution

- [`xparallel.sh`](https://github.com/barrykui/xbash/blob/master/xparallel.sh)
- [`Concu`](https://github.com/barrykui/Concu)
- [`GNU Parallel`](https://www.gnu.org/software/parallel/)



##### TODO
- [x] xbash not work, bug should be fired;
- [ ] .vim folder should be committed to here;    
- [ ] Go through
- [ ] test2
- [ ] a good google hosts
[`Penlight`](https://github.com/stevedonovan/Penlight) [`documentation`](http://stevedonovan.github.io/Penlight/api/manual/01-introduction.md.html)




## Acknowledgement
This tools are frequently used in our daily life, lots of my time are saved by using these tiny commands.




