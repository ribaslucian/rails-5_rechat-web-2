// var API_URL = 'http://ec2-18-228-22-62.sa-east-1.compute.amazonaws.com/api/authorize.json';
var API_URL = 'http://192.168.0.5:3000/api/authorize.json';
var app = angular.module('ChatResearcher', ['toastr']);

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
app.run(function ($rootScope, $http, $app, $flash, $api, $entity, $data, $basic, $compile) {

    // disponibilizacoes no escopo raiz
    $rootScope.$app = $app;
    $app.$jQuery = $; // crossview jQuery
    
    $app.$basic = $basic;
    $app.$compile = $compile;
    $app.$rootScope = $rootScope;
    
    $app.$http = $http;
    $app.flash = $flash;
    $app.$api = $api;
    $app.$entity = $entity;
    $app.data = $data;
});