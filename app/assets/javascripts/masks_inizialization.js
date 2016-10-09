function masks_observer() {
    //$('.email').mask();
    //$('.telephone').mask();
    //$('.discount').mask(
        /*'0p9#', {
        placeholder: '0.000',
        translation: {
            'p': {
                pattern: /[\.,]/
            }
        }
        }*/
        /*'p', {
            translation: {
                'p': { pattern: /(1|0([\.,]\d+)?)/}
            }
        }*/
    //);
    $('.money').mask("#.##0,00", {reverse: true})
    $('.integer').mask('#');
    /*$('.date').mask();*/
};