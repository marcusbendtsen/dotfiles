
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