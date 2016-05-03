$( document ).ready(function() {
    $("#album-search").on("submit", function(event) {
    event.preventDefault();
    var params = $(this).serialize();
        console.log(params);
    var request = $.ajax(
            {   url: "/records/new",
                method: "GET",  
                data: params
            });
    request.done(function(response){
       $(".modal-body").html(response); 
    });
    });
});
