$(function()
    {
        $('#role_id').change(function() {
            switch(parseInt($(this).val())) 
            {
                case 1:
                case 2:
                case 3:
                case 5:
                    $('#college_selector').hide(1000);
                    $('#department_selector').hide(1000);
                    break;
                case 4:
                    $('#department_selector').show(1000);
                    $('#college_selector').show(1000);
                    break;
            }
        });
    }
);
$(document).ready( function () {
    $('#users').DataTable();
} 
);