var CONTACT_ID = 0;

// 3
function connect(origin_user_id) {
    
    var last_side = null;
    var current_side = null;

    App.chat = App.cable.subscriptions.create({
        channel: "ChatChannel",
        user_id: origin_user_id,
    }, {
        connected: function () {
        },
        disconnected: function () {
        },
        received: function (data) {
            current_side = data['message_record']['origin_user_id'] == SESSION_USER_ID ? 'right' : 'left';
            
            if ($('.ws-behavior-message').last().is('.ws-message-' + current_side)) {
                last_side = current_side;
            }

            if (current_side != last_side) {
                data['message_html'] = '<div style="padding: 4px;"></div>' + data['message_html'];
            }

            last_side = current_side;

            $('.ws-behavior-messages').append(data['message_html']);
            $('.ws-messages').scrollTop(1000000000);
            
            $('.ws-loading-global').fadeOut();
            $('.dropdown').dropdown();
            capture_interaction_start();
            return;
        },
        // 2
        speak: function (message) {
            $('.ws-loading-global').fadeIn();
            return this.perform('speak', {
                origin_user_id: origin_user_id,
                destiny_user_id: 0,
                content: message,
                contact_id: CONTACT_ID,
            });
        }
    });

}

// 1
$(document).on('keypress', '.behavior-input-type-message', function (event) {
    if (event.keyCode === 13) {
        App.chat.speak($('.behavior-input-type-message').val());
        $('.behavior-input-type-message').val('');

        // seguranca para nao repetir envio
        return event.preventDefault();
    }
});

$(document).ready(function () {
    $('.behavior-button-send-message').click(function (e) {
        App.chat.speak($('.behavior-input-type-message').val());
        $('.behavior-input-type-message').val('');

        // seguranca para nao repetir envio
        return e.preventDefault();
    });
});