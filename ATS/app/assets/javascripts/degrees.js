$(function()
    {
        $('#college_id').change(function() {
            $.ajax({
                type: 'GET',
                url: '/departments',
                data: {"id" : $('#college_id').val()},
                success: function(data) {
                    $('#department_id').empty();
                    $.each(data, function(i, p) {
                        $('#department_id').append($('<option></option>').val(data[i].id).html(data[i].name));
                    });
                }
            });
            
            
            /*var options = ["1", "2", "3", "4", "5"];
            $('#department_id').empty();
            $.each(options, function(i, p) {
                $('#department_id').append($('<option></option>').val(p).html(p));
            });*/
        });
        
        $('#department_id').change(function() {
            $.ajax({
                type: 'GET',
                url: '/degrees',
                data: {"id" : $('#department_id').val()},
                success: function(data) {
                    $('#degree_id').empty();
                    $.each(data, function(i, p) {
                        $('#degree_id').append($('<option></option>').val(data[i].id).html(data[i].name));
                    });
                }
            });
        });
    }
);
$(document).ready( function () {
    if ($('#degrees.table').length) {
        $('#degrees.table').DataTable();
    }
} 
);