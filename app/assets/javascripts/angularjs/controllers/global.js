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
        $app.$entity.load('contact', {
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

    $scope.message_share = function () {
        
//        l({Message: {
//                share: {
//                    contacts_id: contacts_ids,
//                    user_id: SESSION_USER_ID,
//                    origin_contact_id: ORIGIN_CONTACT_ID,
//                    interaction_id: $app.share.interaction_id,
//                    interaction_message_id: $app.share.interaction_message_id,
//                    propagation_message_id: $app.share.propagation_message_id,
//
//                    content: $app.share.content,
//                    interaction_ids: $app.share.interaction_ids,
//                    type_content_acronym_id: $app.share.type_content_acronym_id,
//                    reference_interaction_id: $app.share.reference_interaction_id,
//                }
//            }});

        $app.$api.process({
            Message: {
                share: {
                    contacts_id: $app.contacts_ids,
                    user_id: SESSION_USER_ID,
                    origin_contact_id: ORIGIN_CONTACT_ID,
                    interaction_id: $app.share.interaction_id,
                    interaction_message_id: $app.share.interaction_message_id,
                    propagation_message_id: $app.share.propagation_message_id,

                    content: $app.share.content,
                    interaction_ids: $app.share.interaction_ids,
                    type_content_acronym_id: $app.share.type_content_acronym_id,
                    reference_interaction_id: $app.share.reference_interaction_id,
                }
            },
        }, function (data) {

            $.toast({
                text: 'Mensagem compartilhada',
                position: 'top-center',
                hideAfter: 5000,
                loaderBg: '#777',
                bgColor: '#3c763d',
                textColor: 'white',
            });

            $app.$jQuery('.ws-behavior-modal-share').modal('hide');
            
            $app.contacts_ids = {};
        });
    }


    $scope.save_times = function (times) {
        if (times == {})
            return;

//        l({save_times: {
//                    times: times,
//                    scroll_count: PAGE_SCROLL_COUNT,
//                    has_scroll: ($('.ws-mobile-container-y').hasScrollBar() ? true : false)
//                }});
//        
//        return false;

        $app.$api.process({
            Interaction: {
                save_times: {
                    times: times,
                    scroll_count: PAGE_SCROLL_COUNT,
                    has_scroll: ($('.ws-mobile-container-y').hasScrollBar() ? true : false)
                }
            },
        }, function () {
            return;
        });
    }
});
