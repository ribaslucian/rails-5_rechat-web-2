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