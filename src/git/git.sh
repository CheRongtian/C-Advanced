#!/bin/bash
git init
git clone xxxxxx.git
git add xxx.c xxx.h
git add .
git rm xxxx
git mv file file
git add -u
git commit -a -m "here is an initial commit"
git checkout fe9c4 # if the version is like fe9c4dddac......
git checkout master
git diff # show the diffs between the working directory and the index
git diff 234e2a # show the diffs between the working directory and the given commit object
git diff 234e2a 8b90ac # show the changes from one commit object to another
git diff HEAD~4 # compare the working directory to 4 commits ago
git checkout matser~1 # check out the predecessor to the head of the master branch
git checkout matser~ # shorthand for the same
git diff b0897~ b8097 # see what changed in commit b8097

:<< END
stash
END

git stash # code is now as it was last checkin
git checkout fe9c4 # look around here
git checkout master # or whatever commit you had started with
# code is now as it was at last checkin, so replay stashed diffs within:
git stash pop

:<< END
tree
END

git branch newleaf # create a new branch...
git checkout newleaf # then checkout the branch you just created
# or execute both steps at once with the equivalent:
git checkout -b newleaf

git branch # check which branch you are in

:<< END
merge
END

git checkout master
git merge newleaf

:<< END
rebase
END

git branch testing # get on the testing branch
git rebase abcd123 # or equivalently: git rebase main

:<< END
remote version
END
git pull origin main
git push origin bbranch

git pull origin new_changes:master # merge remote new_changes into local master
git push origin my_fixes:version2 # merge the local branch into a differently named remote
git push origin :prune_me # delete a remote branch
git pull origin new_changes # pull to no branch; create a commit named FETCH_HEAD