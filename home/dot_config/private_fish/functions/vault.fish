set VAULT_AUTH_URL_DEV https://dev-metavault.int.snowflakecomputing.com:8200
set VAULT_AUTH_URL_PROD https://prod-metavault.int.snowflakecomputing.com:8200
set VAULT_AUTH_URL_GOV https://vault.m1.us-gov-west-1.aws-gov.app.snowflake.com:8200
set OP_READ_ITEM op://Employee/snowflake.okta.com/password

function _vault_auth
    VAULT_ADDR=$VAULT_SERVER_URL vault login -method=okta username="$USER" password="$(op read "$OP_READ_ITEM")"
    set VAULT_SERVER_TOKEN $(cat ~/.vault-token)
end

function vault_dev --description "Login to Dev Metavault"
    set -gx VAULT_SERVER_URL $VAULT_AUTH_URL_DEV
    _vault_auth
end

function vault_prod --description "Login to Prod Metavault"

    set -gx VAULT_SERVER_URL $VAULT_AUTH_URL_PROD
    _vault_auth
end

function vault_gov --description "Login to Gov Metavault"
    set -gx VAULT_SERVER_URL $VAULT_AUTH_URL_GOV
    _vault_auth
end
