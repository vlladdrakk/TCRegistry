function clickedCategory(e) {
	window.location = "?selection=" + e.id;
}

function claimItem(element) {
  var item_id = element.id;
  $.ajax({
    url: "/items/claim",
    method: "POST",
    data: {id: item_id},
    success: function(response) {
      if (response.needed === 0) {
        $("#item-" + item_id).addClass("hidden");
      } else {
        $("#needed-" + item_id).html(response.needed);
      }
    },
    error: function(error) {
      console.log(error);
    }
  })
}