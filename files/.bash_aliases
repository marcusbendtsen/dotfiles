

##
## MODEL
##
mod() {
    export CMDSTAN_HOME=/opt/cmdstan/cmdstan-2.34.1/
    export MODEL_HOME=~/workspace/model/
    export MODEL_DATA_HOME=/media/data/
    export MODEL_SAMPLES=~/samples
    source $MODEL_HOME/env/bin/activate
    python $MODEL_HOME/model.py $@
    deactivate
}
export -f mod

##
## Report
##
report() {
    export REPORT_HOME=~/workspace/report/
    source $REPORT_HOME/env/bin/activate
    python $REPORT_HOME/report.py $@
    deactivate
}
export -f report

##
## SIM
##
export SIM_HOME=~/workspace/sim
export SIM_PROJECTS=~/sim_projects


##
## SIMPP
##
export SIM_HOME=~/workspace/simpp
export SIMPP_DB_HOST_PROJECT=localhost
export SIMPP_DB_HOST_OUTPUT=localhost
export SIMPP_DB_HOST_STATS=localhost

##
## Git 
##
git_clone() {
    git clone --depth=1 git@github.com:marcusbendtsen/$1
}
export -f git_clone

aws_clone() {
    git clone --depth=1 ssh://git-codecommit.eu-west-1.amazonaws.com/v1/repos/$1
}
export -f aws_clone


alias git_status="find . -name .git -type d -execdir git status \;"
alias git_add="find . -name .git -type d -execdir git add . \;"
alias git_commit="find . -name .git -type d -execdir git commit -m 'commit' \;"
alias git_pull="find . -name .git -type d -execdir git pull \;"
alias git_push="find . -name .git -type d -execdir git push \;"

alias git_all="git_add; git_commit; git_pull; git_push; git_status"

##
## Filevault
##
mount_filevault() {
    sudo mount -t cifs -o vers=3.02,username=marbe92,domain=AD,uid=marcus,file_mode=0600,dir_mode=0700 //fillager.liu.se/filevault/ /media/filevault/
}
export -f mount_filevault


##
## HIVE
##
if [ -f ~/workspace/hive/util/bash_hive ]; then
    . ~/workspace/hive/util/bash_hive
fi

