$( document ).ready(function() {
    $("#album-search").on("submit", function(event) {
        event.preventDefault();
            $("#post-view").html('')
            $("#list-view").html('<h4>Fetching results...</h4>')
            var params  = $(this).serialize();
            var request = $.ajax(
                    {   url: "/records",
                        method: "GET",  
                        data: params
                    });
        request.done(function(response){
            $("#list-view").html(response); 
        });
    });

    $("#list-view").on("submit", function(event) {
        event.stopPropagation();
        event.preventDefault();
        var target = $(event.target)
        var params  = target.closest(".selected-record").serialize();
        var request = $.ajax(
                {   url: "/records/new",
                    method: "GET", 
                    data: params
                });
        request.done(function(response){
            $("#list-view").html('');
            $("#post-view").html(response);
        });
    }); 

    $("#post-view").on("submit", "#create-form", function(event){
        event.preventDefault();
        var params = $(this).serialize();
        var request = $.ajax(
                {   url: "/posts",
                    method: "POST",
                    data: params
                });
        request.done(function(response){
            $("#myModal").modal('toggle');
        })
        
    })

});

