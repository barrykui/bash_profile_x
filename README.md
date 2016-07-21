# xbash

## Introduction

Xbash is a crowd of alias and tiny command line tools. 

## Installation

    $ cd 
    $ git clone https://github.com/barrykui/.xbash
    $ vi ~/.bashrc

add `~/.xbash` to the environment `PATH`:

    export PATH=$PATH:~/.xbash 

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


##### TODO
- [x] xbash not work, bug should be fired;
- [x] more usefull tools should be added in.
  - [x] Read and process process data as needed by the network.
  - [x] Read [`Learning Phrase Representations using RNN Encoder–Decoder
  for Statistical Machine Translation`](http://arxiv.org/pdf/1406.1078.pdf) and
  implement a GRU.
  - [x] Read [`LSTM: A Search Space Odyssey`](http://arxiv.org/pdf/1503.04069v1.pdf)
  and implement LSTM.
  - [ ] Use Tree LSTM in place of LSTM. [`Paper`](http://www.aclweb.org/anthology/P/P15/P15-1150.pdf) [`Code`](https://github.com/stanfordnlp/treelstm) [`Slides`](http://kaishengtai.github.io/static/slides/treelstm-acl2015.pdf)
- [ ] Go through
[`Penlight`](https://github.com/stevedonovan/Penlight) [`documentation`](http://stevedonovan.github.io/Penlight/api/manual/01-introduction.md.html)
- [ ] Go through
[`Moses`](https://github.com/Yonaba/Moses/blob/master/doc/tutorial.md)
- [ ] Go through [`nn`](https://github.com/torch/nn) module documentation and check
how some to the functionality is implemented



## Acknowledgement
This tools are frequently used in our daily life, lots of my time are saved by using these tiny commands.




