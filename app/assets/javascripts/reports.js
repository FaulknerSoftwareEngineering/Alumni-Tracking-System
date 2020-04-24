$(document).ready( function () {
    if ($('#report.table').length) {
        $('#report.table').DataTable({
            dom: 'Bfrtip',
            buttons: [
                'print'
            ]
        });
    }
});