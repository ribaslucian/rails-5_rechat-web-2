app.service('$basic', function () {

    this.l = function (a) {
        return l(a);
    };
    
    this.random = function () {
        return random();
    };

});