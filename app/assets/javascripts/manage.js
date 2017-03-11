function deleteCategory(entity) {
  var category_id = entity.id.split('-')[1];
  var confirmed = confirm("Deleting this category will also delete all of the items within it, do you want to continue?")

  if (confirmed) {
    $.ajax({
      url: '/categories',
      method: 'DELETE',
      data: {id: category_id},
      success: function(response) {
        var base_url = window.location.toString().split('?')[0];
        window.location = base_url;
      },
      error: function(error) {
        console.log(error);
      }
    })
  }
}

function deleteItem(element){
  $.ajax({
    url: "/item;",
    method: "DELETE",
    data: {"id": element.id},
    success: function(result){
      $("#item" + element.id).addClass("hidden");
    },
    error: function(result) {
      console.log('Failure');
    }
  });
};

function clickedCategory(e) {
  window.location = "?selection=" + e.id;
}

function submitItem() {
  var category_id = $("#category").val();
  var base_url = window.location.toString().split('?')[0];
  console.log("base_url" + base_url);
  $("#itemForm").submit();
  setTimeout(function(){
    window.location = base_url + "?selection=" + category_id;
  }, 700);
};

function updateItem() {
  var res = $("#updateForm").ajaxSubmit({
    url: "/items",
    method: "PUT",
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
};

function editItem(element) {
  console.log("sending get request");
  $.ajax({
    url: "/items;",
    data: {"id": element.id},
    success: function(data) {
      setEditFields(data);
    },
    error: function(data) {
        console.log("error retrieving item");
    }
  });
  $("#editModal").modal("show");
};

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