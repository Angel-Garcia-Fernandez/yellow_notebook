//select2 initialization

function select2_observers(){

    $( ".select" ).select2({
        theme: "bootstrap"
    });

    $( ".select-search" ).select2({
        theme: "bootstrap",
        allowClear: true
    });

};