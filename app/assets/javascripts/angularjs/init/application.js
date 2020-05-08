/**
 * iniciando aplicacao e informando quais metodos serao utializados
 */

var app = angular.module('ChatResearcher', []);

app.service('$data', function () {
    this.reset = function () {
        var $data = this;
        $.each($data, function (key) {
            if (key != 'reset')
                delete $data[key];
        });

        // dados iniciais
        this.controllers = {};
    };

    this.reset();
});


/**
 * Criamos um servico APP vazio para preencher em {angular.run}
 */
app.service('$app', function () { });


/**
 * Centralizador de servicos
 */
app.run(function ($rootScope, $app, $basic, $compile) {

    // disponibilizacoes no escopo raiz
    $rootScope.$app = $app;
    $rootScope.$ = $; // crossview jQuery
    
    $app.$basic = $basic;
    $app.$compile = $compile;
    $app.$rootScope = $rootScope;
});



app.controller('InteractionsController', function ($app, $scope) {

    

});
