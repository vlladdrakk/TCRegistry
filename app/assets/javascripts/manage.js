function deleteCategory(entity) {
  var category_id = entity.id.split('-')[1];
  var confirmed = confirm("Deleting this category will also delete all of the items within it, do you want to continue?")
  console.log(confirmed);
  if (confirmed) {
    $.ajax({
      url: '/categories',
      method: 'DELETE',
      data: {id: category_id},
      success: function(response) {
        window.location.reload();
      },
      error: function(error) {
        console.log(error);
      }
    })
  }
}

$(".delete").click(function(e){
  $.ajax({
    url: "/delete;",
    data: {"id": e.target.id},
    success: function(result){
      console.log('Success');
              $("#item" + e.target.id).addClass("hidden");
    },
    error: function(result) {
      console.log('Failure');
    }
  });
});

$("#submitItem").click(function(e) {
  $("#itemForm").submit();
  window.location.reload();
});

$("#updateItemBtn").click(function(e) {
  var res = $("#updateForm").ajaxSubmit({
    url: "/items/update",
    dataType: "json",
    success: function(data, textStatus, jqXHR) 
    {
      console.log(data);
      if (data.result) {
        $("#successAlert").alert();
        console.log("success");
        window.location.reload();
      }
      else {
        $("#errorAlert").alert();
      }
    }
  });
})

$(".edit").click(function(e) {
  console.log("sending get request");
  $.ajax({
    url: "/items;",
    data: {"id": e.target.id},
    success: function(data) {
      setEditFields(data);
    },
    error: function(data) {
        console.log("error retrieving item");
    }
  });
  $("#editModal").modal("show");
});

function createCategory(event) {
  console.log('test');
  var data = {
    name: $("#newCategoryName").val(),
    description: $("#newCategoryDescription").val()
  };
  var url = "/categories"
  $.ajax({
    method: 'POST',
    url: "/categories",
    data: data,
    success: function(response) {
      console.log("success");
    },
    error: function(error) {
      console.log(error);
    }
  });
  $("#categoryModal").modal('hide');
  $("#newCategoryName").val('');
  $("#newCategoryDescription").val('');
  window.location.reload();
}

function setEditFields(data) {
  console.log(data);
  $("#edit_name").val(data.name);
  $("#edit_description").val(data.description);
  $("#edit_category").val(parseInt(data.category_id));
  $("#edit_needed").val(data.needed);
  $("#edit_item_id").val(data.id);
}