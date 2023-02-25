/*
    - These functions are expected to be called from within the Export Data 'wizard'
    - Two buttons that will set the default columns for the current PowerQuery being exported.
    - The colList array of dictionary field / label should be set  in the script of the description of the PowerQuery.
    - The field should be the return field name that is found in the query itself. 

Example : 
*/
// columns can only be used once on the export
const table = "schools";
const colList = [
    { field: "schoolid", label: "school_id" },
    { field: "school_name", label: "school_name" },
    { field: "school_number", label: "school_number" },
    { field: "state_id", label: "state_id" },
    { field: "low_grade", label: "low_grade" },
    { field: "high_grade", label: "high_grade" },
    { field: "principal", label: "principal" },
    { field: "principalemail", label: "principal_email" },
    { field: "schooladdress", label: "school_address" },
    { field: "schoolcity", label: "school_city" },
    { field: "schoolstate", label: "school_state" },
    { field: "schoolzip", label: "school_zip" },
    { field: "schoolphone", label: "school_phone" }
];
function selectDefaultColumns() {

    // force all of the available fields to be displayed
    var btn_expall = document.querySelector("button[id=idExpandAll]");
    if (btn_expall) {
        btn_expall.click();
    } else {
        var btn_expTbl = document.querySelector("button[id=" + table + "_expandBtn]")
        if (btn_expTbl) {
            if (window.getComputedStyle(btn_expTbl).display !== 'none') {
                btn_expTbl.click();
            }
        }
    }

    colList.forEach(col => {
        cb = document.querySelector("td[id=columnListContainer] [id^=cb_][id$=" + table + "_" + col.field + "]");
        // have to check to see if the item was already selected. If it was... we should skip it
        if (cb) {
            if (cb.checked) { }
        }
        cb.click();
        if (cb.checked) {
            // look for the field in the selected columns and set the label.
            document.querySelector("td[id=columnSelectionContainer] input[type=text][id^=label_cb_][id$=" + col.field + "]").value = col.label;
        }
    });
}
function removeAllFields() {
    document.querySelectorAll("td[id=columnSelectionContainer] input[type=text][id^=label_cb_]").forEach(lbl => {
        document.querySelector("td[id=columnSelectionContainer] button[id=" + lbl.id.replace('label', 'delete') + "]").click();
    });
}