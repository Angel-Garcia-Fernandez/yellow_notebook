function datepicker_observer() {
    $('.datetimepicker').datetimepicker( { locale: 'es' } );
    //$('.datepicker').datetimepicker( { locale: 'es', format: 'LL' } );
    $('.datepicker').datetimepicker( { locale: 'es', format: 'YYYY-M-D' } );
    $('.timepicker').datetimepicker( { locale: 'es', format: 'LT' } );
};/*
function datepicker_observer() {
    $('.datetimepicker').datetimepicker();
    $('.datepicker').datetimepicker( { format: "dddd, MMMM Do YYYY" } );
    $('.timepicker').datetimepicker( { format: 'LT' } );
};*/