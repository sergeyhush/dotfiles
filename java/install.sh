# Adapted from https://get.sdkman.io/

if [ -z "$SDKMAN_DIR" ]; then
    SDKMAN_DIR="$HOME/.sdkman"
fi

if [ -d "$SDKMAN_DIR" ]; then
    exit 0
fi

SDKMAN_SERVICE="https://api.sdkman.io/2"
SDKMAN_VERSION="5.7.3+337"
SDKMAN_PLATFORM=$(uname)

sdkman_bin_folder="${SDKMAN_DIR}/bin"
sdkman_src_folder="${SDKMAN_DIR}/src"
sdkman_tmp_folder="${SDKMAN_DIR}/tmp"
sdkman_stage_folder="${sdkman_tmp_folder}/stage"
sdkman_zip_file="${sdkman_tmp_folder}/sdkman-${SDKMAN_VERSION}.zip"
sdkman_ext_folder="${SDKMAN_DIR}/ext"
sdkman_etc_folder="${SDKMAN_DIR}/etc"
sdkman_var_folder="${SDKMAN_DIR}/var"
sdkman_archives_folder="${SDKMAN_DIR}/archives"
sdkman_candidates_folder="${SDKMAN_DIR}/candidates"
sdkman_config_file="${sdkman_etc_folder}/config"

mkdir -p "$sdkman_bin_folder"
mkdir -p "$sdkman_src_folder"
mkdir -p "$sdkman_tmp_folder"
mkdir -p "$sdkman_stage_folder"
mkdir -p "$sdkman_ext_folder"
mkdir -p "$sdkman_etc_folder"
mkdir -p "$sdkman_var_folder"
mkdir -p "$sdkman_archives_folder"
mkdir -p "$sdkman_candidates_folder"

SDKMAN_CANDIDATES_CSV=$(curl -s "${SDKMAN_SERVICE}/candidates/all")
echo "$SDKMAN_CANDIDATES_CSV" > "${SDKMAN_DIR}/var/candidates"

touch "$sdkman_config_file"
echo "sdkman_auto_answer=false" >> "$sdkman_config_file"
echo "sdkman_auto_selfupdate=false" >> "$sdkman_config_file"
echo "sdkman_insecure_ssl=false" >> "$sdkman_config_file"
echo "sdkman_curl_connect_timeout=7" >> "$sdkman_config_file"
echo "sdkman_curl_max_time=10" >> "$sdkman_config_file"
echo "sdkman_beta_channel=false" >> "$sdkman_config_file"
echo "sdkman_debug_mode=false" >> "$sdkman_config_file"
echo "sdkman_colour_enable=true" >> "$sdkman_config_file"

curl --silent --location "${SDKMAN_SERVICE}/broker/download/sdkman/install/${SDKMAN_VERSION}/${SDKMAN_PLATFORM}" > "$sdkman_zip_file"

ARCHIVE_OK=$(unzip -qt "$sdkman_zip_file" | grep 'No errors detected in compressed data')
if [[ -z "$ARCHIVE_OK" ]]; then
    echo "Downloaded zip archive corrupt. Are you connected to the internet?"
    echo ""
    echo "If problem persists, please ask for help on https://gitter.im/sdkman/user-issues"
    rm -rf "$SDKMAN_DIR"
    exit
fi

unzip -qo "$sdkman_zip_file" -d "$sdkman_stage_folder"
mv "${sdkman_stage_folder}/sdkman-init.sh" "$sdkman_bin_folder"
mv "$sdkman_stage_folder"/sdkman-* "$sdkman_src_folder"
echo "$SDKMAN_VERSION" > "${SDKMAN_DIR}/var/version"
