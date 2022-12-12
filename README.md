# ps-plugin-clever-extracts
 Generates a plugin zip file to allow districts to use these Power Queries to submit files to Clever via SFTP.

# PowerSchool Plugin
The command below will generate the .zip file to be uploaded in PowerSchool. Execute the command in the project GitHub Folder. Note: command does not work in VS Code while in active Docker container.

```bash
cd src;
version=$(xmllint -xpath 'string(//*[local-name()="plugin"]/@version)' plugin.xml \
| cut -f1-3 -d.)
version=${version//./-}
zip ../bin/plugin_v$version.zip -r plugin.xml queries_root/*
```

# ps-plugin-warehouse-extracts

You may have to run the following permission for the scripts folder for vscode to execute the bash script for building (may need to preface with sudo if you do not have admin rights)
```
chmod -R 771 ./scripts
```

Shift+Command+B - Runs the Build Task. 
or Cmd+Shift+P then type Run Build Task

### NWEA Specific naming formats:
    sis_id
    ext.head_start
    ext.section_504
    ext.special_education
    ext.talented_gifted
    ext.title1
    ext.frl
    ext.ell
    ext.iep
    ext.other

# Version History

## 0.1.0
- First version of the plugin

## 0.1.12
- First version to pass install checks in PS (maybe not)

## 0.3.0
- Passes validation checks when installed (data extracts need to be verified)