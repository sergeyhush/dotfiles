function dev-metavault
    set -gx VAULT_SERVER_URL https://dev-metavault.int.snowflakecomputing.com:8200
    set -gx VAULT_ADDR $VAULT_SERVER_URL

    vault login -method=okta username=$USER password=(op item list --tags sfcli-snowflake-okta --format json | op item get --fields label=password --reveal -)

    set -gx VAULT_SERVER_TOKEN (cat ~/.vault-token)
    set -gx VAULT_TOKEN $VAULT_SERVER_TOKEN
end
