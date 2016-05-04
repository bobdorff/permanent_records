$( document ).ready(function() {
    $("#album-search").on("submit", function(event) {
        event.preventDefault();
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
    $(".modal-body").on("click", ".add-record", function(event) {
        event.preventDefault();
        var params  = $(".add-record").attr("record"); 
        var request = $.ajax(
                {   url: "/records/new",
                    method: "GET", 
                    data: {record: params}
                });
        request.done(function(response){
            $(".modal-body").html(response);
        });
    }); 
});

