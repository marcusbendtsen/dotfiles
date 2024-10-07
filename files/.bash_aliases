
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
export SIM_PROJECTS=/media/sim


##
## Hive
##
hive() {
   export HIVE_HOME=~/workspace/hive/
   source $HIVE_HOME/env/bin/activate
   python $HIVE_HOME/hive.py $@
   deactivate
}
export -f hive

hive_dstat() {
 declare -a arr=("node5" "node6" "node7" "node8")
 for i in "${arr[@]}"
 do
   i3-sensible-terminal -hold -e "ssh -t $i 'dstat'" &
   sleep .5
 done
 ssh -t nfs 'dstat'
}
export -f hive_dstat

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

