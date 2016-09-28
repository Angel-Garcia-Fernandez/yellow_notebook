function datepicker_observer() {
    $('.datetimepicker').datetimepicker();
    $('.datepicker').datetimepicker( { format: "dddd, MMMM Do YYYY" } );
    $('.timepicker').datetimepicker( { format: 'LT' } );
};