app.controller('GlobalController', function ($app, $scope) {
    $app.data.controllers.Global = $scope;

    $scope.message_star = function (id) {
        $app.$entity.load('contacts', {
            $reload: true,
            Message: {
                star: {
                    id: id
                }
            },
            $conclude: function () {
                l($app.messages);
                $app.messages[id].favorited = true;
                
                $.toast({
                    text: 'Mensagem salva nas favoritas',
                    position: 'top-center',
                    hideAfter: 5000,
                    loaderBg: '#777',
                    bgColor: '#3c763d',
                    textColor: 'white',
                });
            },
        });
    }

    $scope.message_unstar = function (id) {
        $app.$entity.load('contacts', {
            $reload: true,
            Message: {
                unstar: {
                    id: id
                }
            },
            $conclude: function () {
                l($app.messages);
                $app.messages[id].favorited = false;
                
                $.toast({
                    text: 'Mensagem removida das favoritas.',
                    position: 'top-center',
                    hideAfter: 5000,
                    loaderBg: '#666'
                });
                
            },
        });
    }

});
