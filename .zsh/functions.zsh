# ~/.zsh/functions.zsh

function installIdmp() {
    build_url="https://build.zohocorp.com/me/id360/milestones/ID360_REVIEWED/ID360_5004"
    
    if [ -n "$1" ]; then
        build_url="$1"
    fi

    build_name=$(basename "$build_url")
    install_path="$SERVERS_PATH/$build_name"

    echo "The following actions will be performed:"
    echo "1. Delete the folder: $install_path (if it exists)"
    echo "2. Install the build from: $build_url"
    echo "3. Update proj.dir.install in cloud.properties to: $install_path"
    echo "Do you want to proceed? [y/n]"
    read -r confirm

    if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
        echo "Operation aborted by the user."
        return 1
    fi

    if [ -d "$install_path" ]; then
        echo "Deleting folder $install_path..."
        rm -rf "$install_path"
    fi

    mkdir -p "$install_path"
    echo "Downloading the build..."
    wget "$build_url/idmpod.zip" -P "$install_path"

    cloud_properties_file="$SCRIPTS_PATH/automation/source/cloud.properties"
    echo "Updating proj.dir.export.home in cloud.properties..."
    sed -i.bak "s|^proj.dir.export.home=.*|proj.dir.export.home=$install_path|" "$cloud_properties_file"

    echo "IDMP build downloaded to: $install_path"
    echo "proj.dir.export.home updated to: $install_path in $cloud_properties_file"
    echo "Installing build..."
    ant -f "$SCRIPTS_PATH/automation/source/cloud.xml"
}

function runIdmpScript() {
    export HOME="/Users/nishanth-14129/Developer/official/servers/$1"
    cd "$HOME/dad/AdventNet/Sas/bin/"
    bash "$2"
}

function startIdmp(){
    build_name="ID360_5004"
    if [ -n "$1" ]; then
        build_name="$1"
    fi
    runIdmpScript "$build_name" "run_production.sh"
}

function stopIdmp(){
    build_name="ID360_5004"
    if [ -n "$1" ]; then
        build_name="$1"
    fi
    runIdmpScript "$build_name" "softkill.sh"
}

function reinitIdmp(){
    redis-cli flushall
    redis-cli flushdb
    build_name="ID360_5004"
    if [ -n "$1" ]; then
        build_name="$1"
    fi
    runIdmpScript "$build_name" "Reinit.sh"
}
