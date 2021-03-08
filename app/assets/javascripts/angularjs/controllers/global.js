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

<<<<<<< HEAD
    $scope.message_share = function (contacts_ids, share) {
=======
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
>>>>>>> 7bd24b15adbc07b3204254e7e73712369fde6a66

        $app.$api.process({
            Message: {
                share: {
<<<<<<< HEAD
                    contacts_id: contacts_ids,
                    user_id: SESSION_USER_ID,
                    origin_contact_id: ORIGIN_CONTACT_ID,
                    interaction_id: share.interaction_id,
                    interaction_message_id: share.interaction_message_id,
                    propagation_message_id: share.propagation_message_id,

                    content: share.content,
                    interaction_ids: share.interaction_ids,
                    type_content_acronym_id: share.type_content_acronym_id,
                    reference_interaction_id: share.reference_interaction_id,
=======
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
>>>>>>> 7bd24b15adbc07b3204254e7e73712369fde6a66
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
<<<<<<< HEAD

=======
            
            $app.contacts_ids = {};
>>>>>>> 7bd24b15adbc07b3204254e7e73712369fde6a66
        });
    }


    $scope.save_times = function (times) {
        if (times == {})
            return;
<<<<<<< HEAD
        
=======

>>>>>>> 7bd24b15adbc07b3204254e7e73712369fde6a66
//        l({save_times: {
//                    times: times,
//                    scroll_count: PAGE_SCROLL_COUNT,
//                    has_scroll: ($('.ws-mobile-container-y').hasScrollBar() ? true : false)
//                }});
//        
//        return false;
<<<<<<< HEAD
        
=======

>>>>>>> 7bd24b15adbc07b3204254e7e73712369fde6a66
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
