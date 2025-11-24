function sfid
    sf auth login $argv && eval $(sf auth show) && . $AWSID_CREDENTIAL_FILE && sf auth check
end
