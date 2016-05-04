$( document ).ready(function() {
    $("#album-search").on("submit", function(event) {
        event.preventDefault();
            $(".modal-body").html("<h4> Fetching Results...</h4>")
            var params  = $(this).serialize();
            var request = $.ajax(
                    {   url: "/records",
                        method: "GET",  
                        data: params
                    });
        request.done(function(response){
            $(".modal-body").html(response); 
        });
    });
    $(".modal-body").on("submit", function(event) {
        event.preventDefault();
        var target = $(event.target)
        var params  = target.closest(".selected-record").serialize();
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

