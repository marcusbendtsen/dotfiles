
##
##  MacPorts Installer addition on 2021-02-01_at_15:06:42: adding an appropriate PATH variable for use with MacPorts.
##
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"


##
## MacPorts Installer addition on 2021-02-01_at_15:06:42: adding an appropriate DISPLAY variable for use with MacPorts.
##
export DISPLAY=:0

##
## R shortcuts
##
alias R="/Library/Frameworks/R.framework/Resources/bin/R"
alias Rscript="/Library/Frameworks/R.framework/Resources/bin/Rscript"


##
## MODEL
##
mod() {
    export MODEL_HOME=/Users/marcus/workspace/model/
    export CMDSTAN_HOME=/opt/cmdstan/cmdstan-2.30.1/
    source $MODEL_HOME/env/bin/activate
    python $MODEL_HOME/model.py $@
    deactivate	
}


##
## SIM
##
export SIM_HOME=~/workspace/sim
export SIM_PROJECTS=~/sim_projects


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

