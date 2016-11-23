function search_btn_outside_form() {
    $(".search-btn-outside-form").on('click', function() {
        $(this).closest('.search-input').find('.search-form').submit();
    });
}