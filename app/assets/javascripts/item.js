function clickedCategory(e) {
  window.location = "?selection=" + e.id;
}

function claimItem(element) {
  var item_id = element.id;

  // prompt user for the access code
  var access_code = prompt("Please enter the access code that is in the bottom left corner of your invitation\n(This action cannot be undone)");

  if (access_code !== null) {
    $.ajax({
      url: "/items/claim",
      method: "POST",
      data: {
        id: item_id,
        code: access_code
      },
      success: function(response) {
        if (response.code !== "500") {
          if (response.remaining < 1) {
            location.reload();
          } else {
            $("#needed-" + item_id).html(response.needed);
            $("#pledged-" + item_id).html(response.pledged);
          }
        } else {
          if (response.result === "Invalid Code") {
            alert("Incorrect access code,\n\nPlease try again or contact the soon-to-be-wed couple <3")
          } else {
            alert("An unexpected error occured...Now locating a repair monkey");
          }
        }
      },
      error: function(error) {
        console.log(error);
      }
    })
  }
}

window.onload = function() {
  first_look = localStorage.getItem("firstLook");
  if (first_look == null) {
    $("#registryModal").modal("show");
    localStorage.setItem("firstLook", "false");
  }
}