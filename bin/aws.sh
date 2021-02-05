export AWS_SDK_LOAD_CONFIG=true
export SAM_CLI_TELEMETRY=0

alias aws-env="env | grep AWS | sort"
alias aws-env-unset="for c in $(env | grep AWS_ | grep -v AWS_SDK | cut -d '=' -f 1); do unset -v "${c}"; done"
alias aws-id="aws sts get-caller-identity --output text"
alias aws-instances="aws ec2 describe-instances --query 'Reservations[].Instances[].[Tags[?Key==\`Name\`].Value|[0],InstanceId,State.Name,LaunchTime]' --output text | column -t | sort -k3 -s"
alias aws-ssh="aws ssm start-session --target"

function aws-profile-account() {
  local profile=$1
  awk "/\[profile $profile\]/,/^$/" ~/.aws/config  | grep '^credential_process' | awk '{print $6}'
}

function aws-profile-role() {
  local profile=$1
  awk "/\[profile $profile\]/,/^$/" ~/.aws/config  | grep '^credential_process' | awk '{print $7}'
}

function aws-profiles() {
  grep -o '^\[[^]]*\]' ~/.aws/config | tr -d "[]" | awk '{print $2}' | sort
}

function aws-accounts() {
  for profile in $(aws-profiles); do
    awk "/\[profile $profile\]/,/^$/" ~/.aws/config  | \
      grep '^credential_process' | \
      awk -v prof="${profile}" '{print $6,"\t",prof}'
  done
}

function aws-env-set() {
  read profile <<< $@
  export AWS_PROFILE=$profile
  eiam login $(whoami) || return
  eiam creds refresh || return
  export AWS_ACCESS_KEY_ID=$(eiam creds env $profile aws_access_key_id)
  export AWS_SECRET_ACCESS_KEY=$(eiam creds env $profile aws_secret_access_key)
  export AWS_SESSION_TOKEN=$(eiam creds env $profile aws_session_token)
}

function awsp () {
  read profile <<< $@
  export AWS_PROFILE=$profile
}
