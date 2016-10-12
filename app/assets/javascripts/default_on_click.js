function default_on_click() {
    sender = $('.default_on_click_sender');
    sender.off('change.default_on_click').
        on('change.default_on_click',
        set_default_to_target);
}

function set_default_to_target( event ) {
    sender_option = $(event.target).find('option:selected');
    targets = sender_option.data('targets');
    ( typeof targets === 'undefined' ) ? targets = [] : targets = targets.split(' ');
    defaults = sender_option.data('defaults');
    ( typeof defaults === 'undefined' ) ? defaults = [] : defaults = defaults.split(' ');
    for( i= 0; i < targets.length; i++) {
        checkbox = $(event.target).closest('.default_on_click_wrapper').
            find(".default_on_click_target[data-target='"+targets[i]+"']");
        checkbox.prop('checked',defaults[i] === 'true');
    }
}