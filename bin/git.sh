alias ga="git add"
alias gaa="git add ."
alias gba="git branch -a"
alias gbb="git commit --allow-empty -m 'Bump the build.'"
alias gcem="git commit --allow-empty -m "
alias gcm="git commit -m"
alias gd="git diff"
alias gdevtags="git tag | grep '\-dev'"
alias gds="git diff --staged"
alias gf="git fetch --all"
alias gfp="git fetch --prune --all"
alias gl="git log --oneline"
alias glc="git rev-parse HEAD | tr -d '\n' | pbcopy"
alias glogdiff="git log -p"
alias gmm="git merge master"
alias gp="git push"
alias gprco="git pr checkout"
alias gprls="git pr list"
alias grm="git rm"
alias gp="git push"
alias gst="git status"
alias gundo="git reset --soft HEAD^"

function gbranchrel() {
    local rel_name=$1
    local rel_heading=$rel_name

    if [[ $# -eq 0 ]]; then
        echo "You must provide a release number."
    else
        if [[ $rel_name == v* ]]; then
            rel_heading=${rel_heading:1}
        fi
        git release create -t $(git rev-parse --abbrev-ref HEAD) -e -m "[${rel_heading}]" "${rel_name}"
    fi
}

function gcf() {
  local file=${1}
  git add ${file}
  git commit -m "Update ${file}"
}

function gccl() {
  gcf "CHANGELOG.md"
}

function gcrm() {
  gcf "README.md"
}

function gdeletedevtags() {
  for x in $(git tag | grep '\-dev'); do
    echo "Deleting tag $x"

    echo -e "\tlocal: "
    git tag --delete $x

    echo -e "\t- remote : "
    # git push origin :refs/tags/$x
  done
}

function grel() {
  local rel_name=$1

  if [[ $# -eq 0 ]]; then
    echo "You must provide a release name"
    return
  fi

  # get the full section
  newest_section=$(sed -n -e '/^## \[/!{b' -e '};b2' -e ':1' -e '{//q;:2' -e 'p;n;b1' -e '}' CHANGELOG.md)

  # get the full title and name/version
  newest_title=$(echo ${newest_section%%$'\n'*})
  newest_name=$(echo $newest_title | cut -d "[" -f2 | cut -d "]" -f1)

  rel_name_to_match=$rel_name

  # drop `v` from our name for existence check if needed
  if [[ $rel_name == v* ]]; then
    rel_name_to_match=${rel_name:1}
  fi

  if [[ $rel_name_to_match != $newest_name ]]; then
    echo "The provided release name ('${rel_name}') doesn't match the newest found release ('${newest_name}')."
    echo "Do you need to update the CHANGELOG.md or provide a different version?"
    return
  fi

  release_title=${newest_title#"## "}
  release_body=${newest_section#"$newest_title"}

  git release create --message "${release_title}" --message "${release_body}" --edit $rel_name
}

function gum() {
  local remote="origin"
  if git remote | grep -q '^upstream$'; then
    remote="upstream"
    echo "Using upstream remote."
  fi

  local default_branch
  default_branch=$(git symbolic-ref "refs/remotes/${remote}/HEAD" 2>/dev/null | sed "s@^refs/remotes/${remote}/@@")

  if [[ -z $default_branch ]]; then
    default_branch="master"
    if ! git show-ref --verify --quiet "refs/remotes/${remote}/master"; then
      default_branch="main"
    fi
  fi

  git checkout "${default_branch}" && git fetch --prune "${remote}" && git rebase "${remote}/${default_branch}"
}
