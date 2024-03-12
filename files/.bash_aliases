
##
## MODEL
##
mod() {
    export CMDSTAN_HOME=/opt/cmdstan/cmdstan-2.34.1/
    export MODEL_HOME=~/workspace/model/
    source ~/workspace/model/env/bin/activate
    python ~/workspace/model/model.py $@
    deactivate
}
export -f mod

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

