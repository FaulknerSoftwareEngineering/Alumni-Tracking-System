$(function() {
    
   $("#employment_current_job").click(function() {
        if( $(this).is(':checked')) {
        $("#end_date").hide();
     } else {
        $("#end_date").show();
     }
    
  });


  
}); 
    
    
    