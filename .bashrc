# Copyright (c) 2016, BarryKui.
#
# bash profile configure
# Tsinghua University
# Modified at Aug 9 2016
#

### local and remote bash_profile_x 
alias vxb='vi $XBASH/.bashrc'
alias sxb='source $XBASH/.bashrc '
alias vxp='vi $XBASH/.path'
alias vld='vi $XBASH/.ld_library_path'

### very basic linux
alias ll='ls -lh'
alias lt='ls -lht'
alias LS='ls'
alias LL='ls -lh'
alias LT='ls -lht'
alias lt='ls -lht'
alias ltr='ls -lhtr'
alias ltf='ls -lht --time-style=full-iso'
alias LS='ls'
alias LL='ls -lh'
alias LT='ls -lht'
alias duh='du -sh'
alias hd='head -n 25'
alias ta='tail -n 25'
alias hg="history | grep"
alias pbd="ping www.baidu.com"
alias pa='ps au'
alias px='ps aux'
alias pxg="ps aux | grep"
alias pxpg="ps axo stat,ppid,pid,comm| grep"
alias grep='grep --color=auto --exclude-dir=\.gitn'
alias wl='wc -l'
alias gin='grep -i -n'
alias dw='cd ~/Downloads'
alias dc='cd ~/Documents'
alias ws='cd ~/Documents/workspace'
alias sw='cd ~/Documents/software'
alias catdisk='sudo lshw -class disk -class storage'

## third party software
alias tmuxsh='tmux split -h'
alias tmuxsv='tmux split -v'
alias cget='curl -O'
alias gitc='git clone'
alias jr='java -jar'
alias open='xdg-open'

alias xilog="fc -rnl | head -1 >> ~/x.log"
alias xclog="cat ~/.xlog"
alias websiteget="wget --random-wait -r -p -e robots=off -U mozilla"
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias meminfo='free -m -l -t'

### functions 
lc() { ls $1|wl; }
topg() { top -b -n 1|grep $1|wl; }
# 

## mount
xmount(){ echo -e "1. mount;\n \
    2. find the device(/dev/disk3s1) and the mount point(/Volumes/udisk) \n \
    3. diskutil umount /Volumes/udisk \n \
    4. sudo mount -t ntfs -o rw,nobrowse /dev/disk3s1 /Users/kuixu/udisk \n";
}

xcate(){ cat $(which $1);}
gmail() { curl -u "$1" --silent "https://mail.google.com/mail/feed/atom" | sed -e 's/<\/fullcount.*/\n/' | sed -e 's/.*fullcount>//';}
# cd folder
cde(){ cd $(dirname $(which $1)); }
lse(){ ls $(dirname $(which $1)); }

## tmux
# tmux attach
tm(){ tmux attach -t $1; }
tmprefix(){ tmux unbind C-b;tmux set -g prefix \`;tmux bind-key \` send-prefix;tmux set -g history-limit 1000000;}


## nvidia-smi
# 
alias nv='nvidia-smi'
nvp(){ nvidia-smi|awk '$2=="Processes:"{aa=1;}{if(aa==1)print $0}'; free -h; }
nvpi(){ nvidia-smi|awk '{if(aa==1){print $0;aa=2;}}$2=="'$1'"{print $0;if(aa==0)aa=1}';}
nvrp(){ nvidia-smi |awk 'v==2&&$0~/^\|/{print $0}$0=="|=============================================================================|"{v=2}';}
nvrid(){ nvidia-smi |awk 'v==2&&$0~/^\|/{print $0}$0=="|=============================================================================|"{v=2}'|awk '{print $2}';}
nvfreeid(){ nvidia-smi |awk 'v==2&&$0~/^\|/{print $0}$0=="|=============================================================================|"{v=2}'|awk '{r[$2]=1}END{for(i=0;i<=15;i+=1    )if(r[i]!=1)print i}';}
cvd(){ CUDA_VISIBLE_DEVICES=$1; }


# count colum
ncol(){ awk -F' ' '{print NF}' $1; }

# max min mean
mmm(){ awk 'NR == 1 { max=$1; min=$1; sum=0 }  { if ($1>max) max=$1; if ($1<min) min=$1; sum+=$1;} END {printf "Min: %f\tMax: %f\tAverage: %f\n", min, max, sum/NR}'; }


# count dir
nfile(){ ls $1|wc -l; }
nfilet(){ while(true) do nfile $1;sleep 3;done }
o(){ while(true) do echo "=============";$1;sleep 1;done }
o5(){ while(true) do echo "=============";$1;sleep 5;done }

#linenum file
sedxk(){ head -$1 $2 |tail -1;}
sedxkn(){ cols=$1; awk 'BEGIN{split("'$cols'",a,",");i=1;}NR==a[i]{print $1;i++;if(i>length(a)){exit;}}' $2;}
# mkdir and cd into 
mcd() { mkdir -p "$1"; cd "$1";}
# cd and ls 
cls() { cd "$1"; ls;}

# kill pro with name
killpname() { ps aux|grep $1|awk '{print $2;system("kill "$2)}'; }

#bak
backup() { cp "$1"{,.bak};}
# extract all formated file
ert() {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extr()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
## rename dir
renamedir(){
   from=$1;
   to=$2;
   patern=$3;
   for dirname in $patern
   do
     newdir=${dirname/$from/$to}
     mv $dirname $newdir
     echo $dirname" --> "$newdir
   
   done
}

# bioinformatics tools
countfas() { awk 'BEGIN{l=0;}{if(substr($1,0,1)==">"){if(l!=0){ORS="\n";print l;};l=0;ORS="\t";print $1}else{l+=length($1)}}END{ORS="\n";print l;}' $1; }
xcut() { from1=$1;to2=$2;file=$3;awk 'BEGIN{ORS="\t"}{for(i="'$from1'";i<="'$to2'";i++){if(i=="'$to2'")ORS="\n";print $i}}' $file;}
## get lincRNA from gff file 
## Ensembl_Danio_rerio.GRCz10.83.chr.gff3
getlncRNAgff(){ awk 'BEGIN{a=0;}$3=="lincRNA_gene"{a=1}{if(a==1){b=substr($9,1,8);if(b=="ID=gene:" && $3!="lincRNA_gene")a=0;else print $0;}}' $1; }


overlap1() { awk 'NR==FNR{a[$1]=1}NR>FNR{if(a[$1]==1)print $0}' $1 $2|wc -l;}
overlap4() { awk 'NR==FNR{a[$4]=1}NR>FNR{if(a[$4]==1)print $0}' $1 $2|wc -l;}

# docker
docker0(){ /usr/bin/open /Applications/Docker/Docker\ Quickstart\ Terminal.app; }
docker1(){ docker run -it -v /Users/xukui/Documents/workspace:/root/share dl-docker:cpu bash; }
docker2(){ docker run -it -p 8888:8888 -p 6006:6006 -v /Users/xukui/Documents/workspace:/root/share dl-docker:cpu bash; }


netlogin(){ xdg-open "http://net.tsinghua.edu.cn"; }



## software installation and configure

# THU login
thuin(){
  python $XBASH/thulogin/in.py $1 $2
}
thuout(){
  python $XBASH/thulogin/out.py
}

# tmux
tmuxins(){
  ln -sf $XBASH/.tmux.conf ~/.tmux.conf
  ln -sf $XBASH/.tmux ~/.tmux

}

xmail(){
if [ -d "$XBASH/xmail" ];then
#  echo "yes here!"
  $XBASH/xmail/xmail "$@"
else
  echo "not here! git clone https://github.com/barrykui/xmail.git"
  cd $XBASH/
  git clone https://github.com/barrykui/xmail.git
fi

}

piptf9(){
    sudo rm /usr/local/cuda
    sudo ln -sf /usr/local/cuda-7.5 /usr/local/cuda
    export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.9.0-cp27-none-linux_x86_64.whl
    sudo pip install --upgrade $TF_BINARY_URL --no-deps
    python -c "import tensorflow;print(tensorflow.__version__)"
    CUDA_VISIBLE_DEVICES=3 python /data/kuixu/exper/deeprbp/lstm/imdb_cnn.py
}
piptf10(){
    sudo rm /usr/local/cuda
    sudo ln -sf /usr/local/cuda-7.5_5103 /usr/local/cuda
    export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.10.0-cp27-none-linux_x86_64.whl
    #export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.11.0rc2-cp27-none-linux_x86_64.whl
    sudo pip install --upgrade $TF_BINARY_URL --no-deps
    python -c "import tensorflow;print(tensorflow.__version__)"
    CUDA_VISIBLE_DEVICES=3 python /data/kuixu/exper/deeprbp/lstm/imdb_cnn.py
}
piptf11(){
    sudo rm /usr/local/cuda
    sudo ln -sf /usr/local/cuda-8.0 /usr/local/cuda
    export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.11.0rc2-cp27-none-linux_x86_64.whl
    sudo pip install --upgrade $TF_BINARY_URL
    python -c "import tensorflow;print(tensorflow.__version__)"
    CUDA_VISIBLE_DEVICES=3 python /data/kuixu/exper/deeprbp/lstm/imdb_cnn.py
}


ddl(){ docker run -it -p 8888:8888 -p 6006:6006 -v $HOME:/root/xk dl-docker:cpu bash; }
dfdl(){ docker run -it -p 8888:8888 -p 6006:6006 -v $HOME:/root/xk floydhub/dl-docker:cpu bash;
dcaffe(){ docker run -it -p 8888:8888 -p 6006:6006 -v $HOME:/root/xk caffe:cpu bash; }

### network
netproxyon(){ networksetup -setsocksfirewallproxy "Wi-Fi" "url" "port";}
netproxyoff(){ networksetup -setsocksfirewallproxystate "Wi-Fi" off;}
netlist(){ networksetup -listnetworkserviceorder;}

#XPATH=$(/usr/bin/awk '$0!~/^#/{print}' $XBASH/.path|/usr/bin/awk '!/^$/&&!a[$0]++'|/usr/bin/awk 'BEGIN{a="/bin";}{a=a":"$0}END{print a}')

#export PATH=$XPATH
#XLD=$(/usr/bin/awk '$0!~/^#/{print}' $XBASH/.ld_library_path|/usr/bin/awk '!/^$/&&!a[$0]++'|/usr/bin/awk 'BEGIN{a="/bin";}{a=a":"$0}END{print a}')

#export LD_LIBRARY_PATH=$XLD

## macOS 
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
