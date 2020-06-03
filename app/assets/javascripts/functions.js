function l(log) {
    console.log(log);
}

function angular_scope() {
    return angular.element("[ng-app='ChatResearcher']").scope();
}

function angular_app() {
    return angular.element("[ng-app='ChatResearcher']").scope().$app;
}

function angular_apply() {
    angular_app().$rootScope.$apply();
}

function angular_controller(controller) {
    return angular.element("[ng-controller='" + controller + "']").scope();
}

function angular_controller_apply(controller) {
    angular.element("[ng-controller='" + controller + "']").scope().$apply();
}






function random() {
    return Math.random().toString(36).substr(2);
}

function loading() {
    $('.ws-loading-global').fadeIn();
}

function loaded() {
    $('.ws-loading-global').fadeOut();
}

function order() {
    $("#messages .sub-message").sort(function (a, b) {
        return parseFloat(a.id) - parseFloat(b.id);
    }).each(function () {
        var elem = $(this);
        elem.remove();
        $(elem).appendTo("#messages");
    });

    $('.ws-messages').scrollTop(1000000000);
}

function set_padding() {
    $('.behavior-pad-previuous').parents('.ws-message').attr('style', 'margin-top: 5px !important;');
}

function scroll() {
    $('.ws-mobile-container-y').animate({scrollTop: 100000000});
}