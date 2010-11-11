#!/bin/bash

export SVN_EDITOR=vi

# echoes out all of the available svn shortcuts
function svn_man() {
  echo "svn_to_add"
  echo "svn_to_rm"
  echo "svn_lines_added"
  echo "svn_lines_removed"
  echo "svn_tags"
  echo "svn_branches"
  echo "svn_merge_from_trunk_dry"
  echo "svn_merge_from_trunk"
  echo "svn_merge_into_trunk_dry"
  echo "svn_merge_into_trunk"
  echo "svn_create_tag"
}


# will display all items which have a '?' for thier status
# you can use this to add all of the respective files with:
# svn add `svn_to_add`
function svn_to_add() {
  svn status .|grep "^?"|awk '{print $2}'
}


# will display all items which have a '!' for thier status
# you can use this to remove all of the respective files with:
# svn rm `svn_to_rm`
function svn_to_rm() {
  svn status .|grep "^!"|awk '{print $2}'
}


# will give you the number of lines added from the last check in
# looks for '+' in svn diff output
function svn_lines_added() {
  svn diff | grep "^\+" | grep -v "(working copy)$" | wc -l
}


# will give you the number of lines removed from the last check in
# looks for '-' in svn diff output
function svn_lines_removed() {
  svn diff | grep "^\-" | grep -v "\-\-" | wc -l
}


# will list all of the tags for this repo
function svn_tags() {
  REPO_ROOT=`svn info | grep -i "repository root" | awk '{ print $3 }'`
  TAG_DIR=$REPO_ROOT/tags
  svn ls $TAG_DIR
}


# will list all of the branches for this repo
function svn_branches() {
  REPO_ROOT=`svn info | grep -i "repository root" | awk '{ print $3 }'`
  BRANCH_DIR=$REPO_ROOT/branches
  svn ls $BRANCH_DIR
}


# will dry-run merge updates from trunk
function svn_merge_from_trunk_dry() {
  REPO_ROOT=`svn info | grep -i "repository root" | awk '{ print $3 }'`
  svn merge --dry-run $REPO_ROOT/trunk
}


# will merge updates from trunk
function svn_merge_from_trunk() {
  REPO_ROOT=`svn info | grep -i "repository root" | awk '{ print $3 }'`
  svn merge $REPO_ROOT/trunk
}


# will dry-run reintegrate a branch into trunk
function svn_merge_into_trunk_dry() {
  REPO_ROOT=`svn info | grep -i "repository root" | awk '{ print $3 }'`
  svn merge --dry-run --reintegrate $REPO_ROOT/branches/$1
}


# will reintegrate a branch into trunk
function svn_merge_into_trunk() {
  REPO_ROOT=`svn info | grep -i "repository root" | awk '{ print $3 }'`
  svn merge --reintegrate $REPO_ROOT/branches/$1
}


# will create a tag from trunk
# pass the tag name as the only parameter
# svn_create_tag 1.0.2
function svn_create_tag() {
  REPO_ROOT=`svn info | grep -i "repository root" | awk '{ print $3 }'`

  echo -n "Are you sure you want to create tag $1? [ YES/NO] "
  read answer

  if [ "$answer" == "YES" ]; then
    echo "YES BOSS!"
    svn cp $REPO_ROOT/trunk $REPO_ROOT/tags/$1
  else
    echo "okay, not touching it"
  fi
}


# will create a branch from trunk
# pass the branch name as the only parameter
# svn_create_tag tbishop_010101_bug_fixes
function svn_create_branch() {
  REPO_ROOT=`svn info | grep -i "repository root" | awk '{ print $3 }'`

  echo -n "Are you sure you want to create branch $1? [ YES/NO] "
  read answer

  if [ "$answer" == "YES" ]; then
    echo "YES BOSS!"
    svn cp $REPO_ROOT/trunk $REPO_ROOT/branches/$1 -m "creating branch $1"
  else
    echo "okay, not touching it"
  fi
}
