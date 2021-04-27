let selectedRow = null;
let updatedFormData = {};
let duplicateName = new Map();
let indexOfField = new Map();
indexOfField["nameField"] = 0;
indexOfField["addressField"] = 1;
indexOfField["ratingField"] = 2;
indexOfField["file"] = 3;

function resetClear() {
    document.getElementById("touristAddForm").reset(); 
    resetAlert();
    document.getElementById("findPreviewField").style.display = "none";
}

function showTouristPlace() {
    if(selectedRow == null) {
        if(validate()) {
            let formData = readFormmData();
            if(checkDuplicate(formData) == false) {
                insertNewRecord(formData);
            }
            else {
                return ;
            }
        }
        else 
            return ;
    }
    else {
        if(document.getElementById("nameField").value != "")
            updatedFormData["nameField"] = document.getElementById("nameField").value;
        if(document.getElementById("addressField").value != "" )
            updatedFormData["addressField"] = document.getElementById("addressField").value;
        if(document.getElementById("ratingField").value != "" )
            updatedFormData["ratingField"] = document.getElementById("ratingField").value;
        if(document.getElementById("file").files[0] != null) {
            updatedFormData["file"] = document.getElementById("file").files[0].name;
            updatedFormData["file"] = `<img id = "selectedImage" src = ${updatedFormData.file}>`;
        }
        let formData = updatedFormData;
        if(checkDuplicate(formData) == false) {
            updateRecord(formData);
        }
        else {
            return ;
        }
    }
    let touristListPage = document.getElementById("touristPlace");
    let formPage = document.getElementById("touristForm");
    formPage.style.display = "none";
    touristListPage.style.display = "block";
}

function checkDuplicate(formData) {
    let duplicate = false;
    if(duplicateName[formData.nameField] == 1) {
        document.getElementById("duplicateNameError").classList.remove("hide");
        duplicate = true;
    }
    else {
        duplicateName[formData.nameField] = 1;
        if (!document.getElementById("duplicateNameError").classList.contains("hide"))
            document.getElementById("duplicateNameError").classList.add("hide");
        
    }
    return duplicate;
}

function backToTouristPlace() {
    let touristListPage = document.getElementById("touristPlace");
    let formPage = document.getElementById("touristForm");
    formPage.style.display = "none";
    touristListPage.style.display = "block";
}

function showAddForm() {
    document.getElementById("touristAddForm").reset();
    let touristListPage = document.getElementById("touristPlace");
    let formPage = document.getElementById("touristForm");
    let trr = document.getElementById("findPreviewField").style.display = "none";
    formPage.style.display = "block";
    touristListPage.style.display = "none";
    selectedRow = null;
    
}

function readFormmData() {
    let formData = {};
    formData["nameField"] = document.getElementById("nameField").value;
    formData["addressField"] = document.getElementById("addressField").value;
    formData["ratingField"] = document.getElementById("ratingField").value;
    formData["file"] = document.getElementById("file").files[0].name;
    return formData;
}

function insertNewRecord(data) {
    let table = document.getElementById("table").getElementsByTagName("tbody")[0];
    let newRow = table.insertRow(table.length);
    let cell1 = newRow.insertCell(indexOfField["nameField"]);
    cell1.innerHTML = data.nameField;
    let cell2 = newRow.insertCell(indexOfField["addressField"]);
    cell2.innerHTML = data.addressField;
    let cell3 = newRow.insertCell(indexOfField["ratingField"]);
    cell3.innerHTML = data.ratingField;
    let cell4 = newRow.insertCell(indexOfField["file"]);
    cell4.innerHTML = `<img src = ${data.file}>`;
    cell4 = newRow.insertCell(4);
    cell4.innerHTML = 
    `<div class = "btn">
        <button onClick = "onEdit(this)" class = "update-btn">Update</button>  
        <button onClick = "onDelete(this)" class = "delete-btn">Delete</button> 
    </div>`
    
}

function showTouristAddForm() {
    let touristListPage = document.getElementById("touristPlace");
    let formPage = document.getElementById("touristForm");
    formPage.style.display = "block";
    touristListPage.style.display = "none";
}

function onEdit(td) {
    selectedRow = td.parentElement.parentElement.parentElement;
    document.getElementById("nameField").value = selectedRow.cells[indexOfField["nameField"]].innerHTML;
    document.getElementById("addressField").value = selectedRow.cells[indexOfField["addressField"]].innerHTML;
    document.getElementById("ratingField").value = selectedRow.cells[indexOfField["ratingField"]].innerHTML;
    let tmp = selectedRow.cells[indexOfField["file"]].innerHTML;
    document.getElementById("file").value = null;
    document.getElementById("findPreviewField").style.display = "inline-block";
    document.getElementById("findPreviewField").innerHTML = tmp;
    updatedFormData["nameField"] = document.getElementById("nameField").value;
    updatedFormData["addressField"] = document.getElementById("addressField").value;
    updatedFormData["ratingField"] = document.getElementById("ratingField").value;
    updatedFormData["file"] = selectedRow.cells[indexOfField["file"]].innerHTML;
    duplicateName[document.getElementById("nameField").value] = 0;
    showTouristAddForm();
}

function updateRecord(formData) {
    selectedRow.cells[indexOfField["nameField"]].innerHTML = formData.nameField;
    selectedRow.cells[indexOfField["addressField"]].innerHTML = formData.addressField;
    selectedRow.cells[indexOfField["ratingField"]].innerHTML = formData.ratingField;
    selectedRow.cells[indexOfField["file"]].innerHTML = formData.file;
    selectedRow.cells[4].innerHTML =     `<div class = "btn">
    <button onClick = "onEdit(this)" class = "update-btn">Update</button>  
    <button onClick = "onDelete(this)" class = "delete-btn">Delete</button> 
    </div>`
}

function onDelete(td) {
    row = td.parentElement.parentElement.parentElement;
    document.getElementById("table").deleteRow(row.rowIndex);
    selectedRow = null;
    
}

function validate() {
    isValid = true;
    if (document.getElementById("nameField").value == "") {
        isValid = false;
        document.getElementById("nameValidationError").classList.remove("hide");
    } 
    if (document.getElementById("addressField").value == "") {
        isValid = false;
        document.getElementById("addressValidationError").classList.remove("hide");
    } 
    if (document.getElementById("ratingField").value == "") {
        isValid = false;
        document.getElementById("ratingValidationError").classList.remove("hide");
    } 
    if (document.getElementById("file").value == "") {
        isValid = false;
        document.getElementById("fileValidationError").classList.remove("hide");
    }
    if (document.getElementById("optionField").value == "") {
        isValid = false;
        document.getElementById("optionValidationError").classList.remove("hide");
    }
    if(isValid == true) {
        resetAlert();
    }
    return isValid;
}

function resetAlert() {
    if (!document.getElementById("nameValidationError").classList.contains("hide"))
        document.getElementById("nameValidationError").classList.add("hide");
    if (!document.getElementById("addressValidationError").classList.contains("hide"))
        document.getElementById("addressValidationError").classList.add("hide");
    if (!document.getElementById("ratingValidationError").classList.contains("hide"))
        document.getElementById("ratingValidationError").classList.add("hide");
    if (!document.getElementById("optionValidationError").classList.contains("hide"))
        document.getElementById("optionValidationError").classList.add("hide");
    if (!document.getElementById("fileValidationError").classList.contains("hide"))
        document.getElementById("fileValidationError").classList.add("hide");
    if (!document.getElementById("duplicateNameError").classList.contains("hide"))
        document.getElementById("duplicateNameError").classList.add("hide");
}

function search() {
    let filter = document.getElementById("searchBar").value.toUpperCase();
    let table = document.getElementById("table");
    let tr = table.getElementsByTagName("tr");
    for(let i = 0; i < tr.length; i++) {
        let td = tr[i].getElementsByTagName("td")[0];
        if(td) {
            let textValue = td.innerHTML || td.textContent;
            textValue = textValue.toLocaleUpperCase();
            let flag = true;
            for(let j = 0; j < filter.length; j++) {
                if(j >= textValue.length) {
                    flag = false;
                    break;
                }
                if(filter[j] != textValue[j]) {
                    flag = false;
                    break;
                }
            }
            if(flag) {
                tr[i].style.display = "";
            }
            else {
                tr[i].style.display = "none";
            }
        }
    }
}

function sortTable(val) {
    var table, rows, switching, i, x, y, shouldSwitch;
    table = document.getElementById("table");
    switching = true;
    while (switching) {
        switching = false;
        rows = table.rows;
        for (i = 1; i < (rows.length - 1); i++) {
                shouldSwitch = false;
                x = rows[i].getElementsByTagName("td")[0];
                y = rows[i + 1].getElementsByTagName("td")[0];
                if(val == false) {
                    if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                }
                else {
                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                }
            }
            if (shouldSwitch) {
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
            }
        }
  }

