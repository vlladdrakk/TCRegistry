function clickedCategory(e) {
	console.log(e.id);
	window.location = "?selection=" + e.id;
}