$(document).ready(function(){
	$(".app_menu").remove();
	$(".app_footer").remove();
  if(document.URL.indexOf("#")==-1){
    // Set the URL to whatever it was plus "#".
    url = document.URL+"#";
    location = "#";

    //Reload the page
    location.reload(true);
  }
});
$(".app_menu").remove();
$(".app_footer").remove();