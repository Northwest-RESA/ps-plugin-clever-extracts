# ps-plugin-clever-extracts

 Generates a plugin zip file to allow districts to use these Power Queries to submit files to Clever via SFTP.

## PowerSchool Plugin

The command below will generate the .zip file to be uploaded in PowerSchool. Execute the command in the project GitHub Folder. Note: command does not work in VS Code while in active Docker container.

```bash
cd src;
version=$(xmllint -xpath 'string(//*[local-name()="plugin"]/@version)' plugin.xml \
| cut -f1-3 -d.)
version=${version//./-}
zip ../bin/plugin_v$version.zip -r plugin.xml queries_root/*
```

You may have to run the following permission for the scripts folder for vscode to execute the bash script for building (may need to preface with sudo if you do not have admin rights)

```console
chmod -R 771 ./scripts
```

Shift+Command+B - Runs the Build Task.
or Cmd+Shift+P then type Run Build Task

### NWEA Specific naming formats for extension fields

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

## 1.3.10

- Reverting the change from 1.3.9

## 1.3.9

- Defaulting the school_number for school_id in the schools export set up

## 1.3.8

- Added a different format for the Date of Birth for student

## 1.3.7

- Added DCID for student extracts so that connected tables are available for extract

## 1.3.6

- Fixed issue : <https://github.com/Northwest-RESA/ps-plugin-clever-extracts/issues/7>

## 1.3.5

- Breaking changes for named queries.
- Students are returned if they have a entry date that falls within the school year
- Teachers are returned if they are scheduled in a section for the current school year
- Schools are returned if they have a year long term created for the current school year
- Current School year is determined by the current setting of the `prefs` `coursearchiveyear` value
- IDs used to for all extracts are aligned with the Clever developed plugin for future transition.

<details>
<summary>Previous version information</summary>

## 1.0.7

- Teacher ID is now defaulting to USERS_DCID
- Student ID is now defaulting to ID

## 1.0.6

- Fixed the teacher name field misalignment
- Enrollments does not include students that are no longer enrolled in school

## 1.0.0

- Added the other extract file exports for Schools, Teachers, Students, Sections, and Enrollments
- Changed the naming convention for the PQ
- Set Default export options to include 'common' or easily known identifiers for exports
  - __This is a breaking change__
  - Students - student_number (This is the local district assigned ID for students)
  - Teachers - teachernumber (Locally assigned value that is common for teachers across school affiliations)
  - These values are all linked appropriately to sections and enrollments
- Added a Period Section that compresses all of the sections for a teacher into a single period section
  - This sections are linked only to the lead teacher for a group of sections within a period/term
  - If you want to export without those sections, filter the results by the external_expression # per-
- Added a Period Only extract
  - Only extracts the sections and students for the Period compressed sections
- Added a button within the description of each new extract that aids in setting the default field linking
- Added a button within the description of each new extract to remove all existing field links

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

</details>
