function search_btn_outside_form() {
    $(".search-btn-outside-form").on('click', function() {
        $(this).closest('.search-input').find('.search-form').submit();
    });
}

function search_dropdown_correct_opening() {
    $('.search-input ')
}

// Este código de aquí hay que hacerlo funcionar ahí arriba en search_dropdown_correct_opening
//$('li.dropdown.mega-dropdown a').on('click', function (event) {
//    $(this).parent().toggleClass('open');
//});
//
//$('body').on('click', function (e) {
//    if (!$('li.dropdown.mega-dropdown').is(e.target)
//        && $('li.dropdown.mega-dropdown').has(e.target).length === 0
//        && $('.open').has(e.target).length === 0
//    ) {
//        $('li.dropdown.mega-dropdown').removeClass('open');
//    }
//});