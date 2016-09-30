// Observers

// ready is a function that starts the observers function
var ready;
ready = function() {
    observers();
};

//In here is where the different observers functions are added to execute them.
function observers () {
    select2_observers();
    datepicker_observer();
};



$(document).ready(ready );
$(document).ajaxComplete(ready);
$(document).on('turbolinks:load', ready);