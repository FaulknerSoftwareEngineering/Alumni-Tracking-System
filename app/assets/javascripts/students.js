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
        if ($('#student.table').length) {
            $('#student.table').DataTable();
        }
      }, complete: function(data){
            if ($('#student.table').length) {
                $('#student.table').DataTable();
            }
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
            
          },
          complete: function(data) {
            if ($('#student.table').length) {
                $('#student.table').DataTable();
            }
          }
        });
        
    });
}); 
    
$(document).ready( function () {
    if ($('#student.table').length) {
        $('#student.table').DataTable();
    }
} 
);