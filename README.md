# ps-plugin-clever-extracts

 PowerSchool Plugin source files created to allow districts to use Power Queries to submit files to Clever via SFTP.

## Features

- Automatically selects the default fields for extract in the DEM
  - Hit the [Toggle Default Columns] button and it selects the default fields and names them appropriately for the extracted data
- Makes it possible to extract Custom Extension fields for each extract
  - Mostly appropriate to the students extract
- Extract students with or without 'Unlimited Contacts'
- Adds a Section that compresses all sections for a period 
  - Basically creates a 'period' section and puts all of the students that are in that period expression together
  - Makes it easier for teachers to assign things in shared applications for an entire class
  - It is optional - but SO COOL for the lead teacher
- Extracts all students that are Enrolled, Pre-registered, or were ever enrolled during the current school year
  - There is an Active field that be extracted to use in app sharing to prevent currently inactive students from being shared to specific Clever Apps
  - Active : 1 = Enrolled or Pre-registered; 0 = Withdrawn
- Extracts NWEA Map specific custom fields for students

### NWEA Specific naming formats for extension fields

```text
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
```

## Installation

Download the latest plugin install [release](https://github.com/Northwest-RESA/ps-plugin-clever-extracts/releases). The file should be named something like `ps_plugin_clever_extracts_vx-x-x.zip`. 

Install this in the same manner you would install any other PowerSchool Plugin and enable it. 

### ... And Also 

You should have your Clever Sync Type set to `SFTP`. When that is configured Clever will give you a Username and Password that you will need to configure in Remote Connections plugin within PowerSchool.

### Data Export Manager

Within Data Export Manager, configure the extracts for each type of data you want to sync with Clever. Each of the Power Queries are listed below. **Reminder**: Clever has linking fields defined for data files. Use the comments above the column/field selection in DEM to see more detail about each of these.

#### Basic Extract Power Queries
- `NQ - nwgaresa.clever.enrollments.all`
  - Extracts all students that are currently enrolled or pre-registered in the current school year
- `NQ - nwgaresa.clever.schools.all`
  - Extracts schools (excluding Graduated School) that have a school year defined for the current school year.
- `NQ - nwgaresa.clever.sections.all`
  - Extracts scheduled sections with at least one enrolled student.
  - If a lead teacher has more than one section defined in the same period, a new section will be generated that contains all of the students for all of the sections within that period.
- `NQ - nwgaresa.clever.students.all`
  - Extracts **all** students that were enrolled the current school year, no matter their current status.
  - **Also returns Withdrawn students for the current year.**
- `NQ - nwgaresa.clever.teachers.all`
  - Extracts all teacher records that have a section assignment with at least one student for the current school year.
- `NQ - nwgaresa.clever.staff.all`
  - Extracts all staff records that **DO NOT** have a section assignment with at least one student for the current school year.

#### Alternate Power Queries
- `NQ - nwgaresa.clever.students_contacts.all`
  - Extracts the same students as `NQ - nwgaresa.clever.students.all`
  - Adds contacts linked to the student. `Unlimited Contacts`
- `NQ - nwgaresa.clever.students_ext.nwea`
  - Use this with `NQ - nwgaresa.clever.students.all` or `NQ - nwgaresa.clever.students_contacts.all`
  - Adds NWEA Specific extension fields for students. See above.
- `NQ - nwgaresa.clever.sections.periodonly`
  - Extracts a generated section per scheduled period for each teacher that includes students from all sections defined for that teacher in a single period.
- `NQ - nwgaresa.clever.enrollments.periodonly`
  - Extracts the matching students for `NQ - nwgaresa.clever.sections.periodonly`.

**NOTE:**
If you use `NQ - nwgaresa.clever.sections.periodonly`, you should also use `NQ - nwgaresa.clever.enrollments.periodonly`. These should **not** be extracted if you are extracting `NQ - nwgaresa.clever.sections.all` or `NQ - nwgaresa.clever.enrollments.all`.

## Stay in the Loop

Want to know when I release new changes... Subscribe to the GitHub repository by following these instructions.

- Go to the GitHub repository page.
- Click on the [Watch] button at the top-right corner of the page.
  - If you don't see the [Watch] button, you will need to create a GitHub account (free)
- In the dropdown menu, select "Custom"
- Check "Releases"

## How to Build the PowerSchool Plugin

I provide a release section for this repository. However, if you wanted to build it yourself the instructions are below. This project was created with Visual Studio Code on a Mac. You may have to adjust or change completely the build process to be successful. 

The command below will generate the .zip file to be uploaded in PowerSchool. Execute the command in the project GitHub Folder. Note: command does not work in VS Code while in an active Docker container.

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

# Version History

## 2.0.0

- Removed the OAuth configuration from `plugin.xml`.

## 1.4.1

- Resolved Issues:
  - Staff School Id fixed to be the ID from the SCHOOLS table.

## 1.4.0

Added a new PowerQuery to export staff members. The new PowerQuery returns all staff that are Active and do not have sections assigned to them.

## 1.3.12

- Resolved issues:
  - <https://github.com/Northwest-RESA/ps-plugin-clever-extracts/issues/1> Schools: DIV Placement in Description causes Toggle to fail
  - <https://github.com/Northwest-RESA/ps-plugin-clever-extracts/issues/2> Sections: DIV Placement in Description causes Toggle to fail
  - <https://github.com/Northwest-RESA/ps-plugin-clever-extracts/issues/3> Sections Period Only: DIV Placement in Description causes Toggle to fail
  - <https://github.com/Northwest-RESA/ps-plugin-clever-extracts/issues/4> Enrollments: DIV Placement in Description causes Toggle to fail
  - <https://github.com/Northwest-RESA/ps-plugin-clever-extracts/issues/5> Enrollments Period Only: DIV Placement in Description causes Toggle to fail
  - <https://github.com/Northwest-RESA/ps-plugin-clever-extracts/issues/6> JavaScript fails on partial reload

## 1.3.11

- Added missing course subject description for course numbers starting with 41.

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
