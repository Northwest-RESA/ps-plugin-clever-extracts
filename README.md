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

## 0.4.1
- Fixed broken Query

## 0.4.0
- Changed current to only pull enrolled or preregistered students
- Added current_allstatus to pull all students enrolled no matter their current status.
- Renamed the NQ - to include the type of extensions

## 0.3.7
- Removes rows with no extended field values

## 0.3.6
- Removed final cte

## 0.3.5
- Removed enroll_status from results

## 0.3.4
- First and last day adjustments

## 0.3.3
- Fixes errors in the query

## 0.3.2
- Fixes permissions on one table

## 0.3.1
- Updates permissions to match

## 0.3.0
- Passes validation checks when installed (data extracts need to be verified)

## 0.1.0
- First version of the plugin







