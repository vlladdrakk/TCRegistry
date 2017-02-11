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