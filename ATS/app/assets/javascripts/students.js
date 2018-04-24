$(function() {
    
   $("#Graduate_Degrees").click(function() {

    var id;
    id = $('#hidden_id').html();
    $.ajax({
      type: "get",
      url: "students/" + id + "/grad_school",
      error: function(jqXHR, textStatus, errorThrown) {
        return alert("Error");
      },
      success: function(data, textStatus, jqXHR) {
        return $('#table_div').html("" + data);
      }
    });
  });


    $("#Employment").click(function() {
      
        var id;
        id = $('#hidden_id').html();
         $.ajax({
          type: "get",
          url: "students/" + id + "/employment",
          error: function(jqXHR, textStatus, errorThrown) {
            return alert("Error");
          },
          success: function(data, textStatus, jqXHR) {
            return $('#table_div').html("" + data);
          }
        });
    });
}); 
    
    
    