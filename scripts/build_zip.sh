#!/bin/bash

#### CONSTANTS FOR BUILD CONFIGURATION AND OUTPUT
file_name="ps_plugin_clever_extracts"     ## Use this variable to override the Plugin Name from the plugin ZIP file
sdir="src"                          ## Source Directory of the Plugin content
bin_dir="bin"
last_build_file="$bin_dir/lastbuild.txt"

#### CONSTANTS FOR COLORIZING TEXT OUTPUT
### -------------------------------------------------------
RESET_TEXT='\033[m'
BOLD_RED_TEXT='\033[1;31m'
BOLD_GREEN_TEXT='\033[1;32m'
BOLD_YELLOW_TEXT='\033[1;33m'
BOLD_BLUE_TEXT='\033[1;34m'
BOLD_PURPLE_TEXT='\033[1;35m'
BOLD_CYAN_TEXT='\033[1;36m'

## Indent
I='  - '


### -------------------------------------------------------
# Function to create/replace lastbuild.txt file
### -------------------------------------------------------
function create_last_build_file() {
    # echo $last_build_file
    echo "plugin_name=$pluginName" > "$last_build_file"
    echo "version=$version" >> "$last_build_file"
    echo "file_name=$zip_file_name" >> "$last_build_file"
    echo "relative_path=$bin_dir/$zip_file_name" >> "$last_build_file"
    echo "description=$pluginDescription" >> "$last_build_file"
}

### -------------------------------------------------------
#echo -e "COLOR TEST: ${BOLD_RED_TEXT}Red Text ${BOLD_BLUE_TEXT}Blue Text ${BOLD_GREEN_TEXT}Green Text ${BOLD_YELLOW_TEXT}Yellow Text ${BOLD_PURPLE_TEXT}Purple Text ${BOLD_CYAN_TEXT}Cyan Text"
echo -e "${RESET_TEXT}"

# -------------------------------------------------------
### This build script is assuming that all of the plugin content is housed in the ${sdir} folder.
# -------------------------------------------------------
echo -e "${BOLD_BLUE_TEXT}Compiling PowerSchool Plugin Installer...${RESET_TEXT}"
### Validate the configuration of this script and the project.
echo -e "${BOLD_GREEN_TEXT}Validating Configuration...${RESET_TEXT}"


if  [[ ! -d "$PWD/$sdir" && ! -L "$PWD/$sdir" ]] ; then
    echo -e "${I}${BOLD_RED_TEXT}ERROR: The $sdir folder DOESN'T exist!${RESET_TEXT}"
    echo -e "${I}Resolve by ensuring that $sdir exists or change the build script to use the expected folder name.${RESET_TEXT}"
    exit 14
fi

if [[ ! -f "${sdir}/plugin.xml" ]] ; then
    echo -e "${I}${BOLD_RED_TEXT}plugin.xml was not found in the $sdir folder!${RESET_TEXT}"
    exit 15
fi

echo -e "${I}Getting the version of the plugin..."
version=$(xmllint -xpath 'string(//*[local-name()="plugin"]/@version)' "${sdir}/plugin.xml" | cut -f1-3 -d.)
if [ -z "$version" ] ; then
    echo -e "${I}${BOLD_RED_TEXT}plugin.xml did not contain a version number!${RESET_TEXT}"
    exit 16  
fi
echo -e "${I}Version number found in the plugin is : ${BOLD_BLUE_TEXT}$version ${RESET_TEXT}"

## Get the Plug-in Name to name the file
pluginName=$(xmllint -xpath 'string(//*[local-name()="plugin"]/@name)' "${sdir}/plugin.xml" | cut -f1-3 -d.)
if [ -z "$pluginName" ] ; then
    echo -e "${I}${BOLD_RED_TEXT}plugin.xml did not contain a name!${RESET_TEXT}"
    exit 17
fi

## Get the optional Plug-in Description
pluginDescription=$(xmllint -xpath 'string(//*[local-name()="plugin"]/@description)' "${sdir}/plugin.xml" | cut -f1-3 -d.)
if [ -z "$pluginDescription" ] ; then
    echo -e "${I}${BOLD_YELLOW_TEXT}plugin.xml did not contain a description!${RESET_TEXT}"
fi

echo -e "${I}Plugin Name is : ${BOLD_BLUE_TEXT}$pluginName ${RESET_TEXT}"
if [ -z "$file_name" ]; then 
    file_name=${pluginName//[ .]/_}
fi

if [[ ! -d "$bin_dir" ]] ; then
    echo -e "${I}${BOLD_YELLOW_TEXT}Creating bin folder for installer...${RESET_TEXT}"
    mkdir $bin_dir
fi

zip_file_name="${file_name}_v${version//./-}.zip"

if [[ -f "$bin_dir/${zip_file_name}" ]]; then 
    echo -e "${I}${BOLD_YELLOW_TEXT}Removing existing installer...${RESET_TEXT}"
    rm "$bin_dir/${zip_file_name}"
fi

echo -e "${I}Building file list..."
#Change the working folder to the source folder to make zipping easier
echo -e "${I}Switching current working folder..."
prev_pwd="$PWD"
cd $sdir

## REQUIRED FILE FOR ALL PS Plugins
filelist="plugin.xml "

## Build the list of files to compress into a ZIP file
if [[ -d 'MessageKeys' ]] ; then
    filelist="$filelist MessageKeys/* "
else 
    echo -e "${I}${BOLD_YELLOW_TEXT}No Message Keys found.${RESET_TEXT}"
fi
if [[ -d 'web_root' ]] ; then 
    filelist="$filelist web_root/* "
else 
    echo -e "${I}${BOLD_YELLOW_TEXT}No web_root files found.${RESET_TEXT}"
fi
if [[ -d 'queries_root' ]] ; then
    filelist="$filelist queries_root/*.xml "
else 
    echo -e "${I}${BOLD_YELLOW_TEXT}No queries_root xml files found.${RESET_TEXT}"
fi
if [[ -d 'permissions_root' ]] ; then
    filelist="$filelist permissions_root/* "
else 
    echo -e "${I}${BOLD_YELLOW_TEXT}No permission_root files found.${RESET_TEXT}"
fi 
echo -e "${I}Content files to be compressed are : ${BOLD_GREEN_TEXT}$filelist${RESET_TEXT}"
echo -e "${I}Compressing installer file as ${BOLD_GREEN_TEXT}${zip_file_name}${RESET_TEXT}"

# the bin folder is now relative to the src folder
zip -r "../$bin_dir/${zip_file_name}" ${filelist}

# reverting the original working folder
cd "$prev_pwd"


if [[ -f "$bin_dir/${zip_file_name}" ]] ; then
    echo -e "${I}Installer file has been created!
    ${BOLD_CYAN_TEXT}${bin_dir}/${zip_file_name}
    ${RESET_TEXT}"
    create_last_build_file
else
    echo -e "${I}${BOLD_RED_TEXT}Installer file was not created! Check for errors.${RESET_TEXT}"
fi
