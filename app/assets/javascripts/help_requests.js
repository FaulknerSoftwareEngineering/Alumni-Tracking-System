$(function()
    {
        $(document).ready( function () {
            if ($('#helprequests.table').length) {
                $('#helprequests.table').DataTable();
                }
            } 
        );
        $(document).on('submit', '#helpForm', function(event) {
            event.preventDefault();
            $.ajax({
                type: 'POST',
                url: '/contact_support',
                data: {"email" : $('#recipient-email').val(), "message" : $('#message-text').val(), "utf8" : $("[name='utf8']").val(), "authenticity_token" : $("[name='authenticity_token']").val()},
                success: function(data) {
                    if(data.indexOf("Queued") >= 0){
                        alert("Your message is on its way. We will be in touch.");
                        $('#helpModal').modal('hide');
                    } else if (data.indexOf("not a valid address") >= 0) {
                        alert("Error: Must enter a valid email address.");
                    } else {
                        alert(data);
                    }
                },
                error: function (jqXHR, exception){
                    alert(exception);
                }
            });
        });
        
    }
);