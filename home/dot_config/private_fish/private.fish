# Teleport
alias tssh="tsh ssh"
alias tshp="tsh --proxy tproxy.sfc-teleport.aws.reg.snowflakecomputing.com login"
alias tshnp="tsh --proxy tproxy.sfc-teleport-nonprod.aws.reg.snowflakecomputing.com login"
alias tshpec="tsh --proxy tproxy.sfc-ec-teleport.aws.reg.snowflakecomputing.com login"
alias tshpfips="tsh --proxy tproxy.sfc-teleport-fips.aws.reg.snowflakecomputing.com login"
alias tshc='tsh clusters | tail -n+3 | fzf | cut -d " " -f1 | xargs tsh login'
alias tshrm="tsh logout && rm -rf ~/.tsh"
alias tship='jq -e -r ".[].spec.cmd_labels.IP.result" | sort -V'

function tshlsip
    tsh ls -f json SFDEPLOYMENT=$argv | tship
end

function tshlogin
    tsh login --request-roles cloudeng --request-reason "emergency $argv PSAC-FDB_Investigation"
end

function sts_decode_msg
    aws sts decode-authorization-message --encoded-message "$argv" | jq '.DecodedMessage|fromjson'
end

# SanShell
alias ss='sanssh'
# alias ssc='export SANSSHELL_PROXY=$(sanssh clusters | fzf | xargs | awk "{print \$NF}")'
# alias sslsip='f(){tshlsip $1 | paste -sd, -};f'

# DevEnv
sf aliases --fish-shell | source
