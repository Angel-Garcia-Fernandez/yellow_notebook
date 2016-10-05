function datepicker_observer() {
    $('.datetimepicker').datetimepicker( { locale: 'es' } );
    //$('.datepicker').datetimepicker( { locale: 'es', format: 'LL' } );
    $('.datepicker').datetimepicker( { locale: 'es', format: 'YYYY-M-D' } );
    $('.timepicker').datetimepicker( { locale: 'es', format: 'LT' } );
};