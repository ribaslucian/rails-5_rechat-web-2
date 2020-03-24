// 3
function connect(origin_user_id) {

    App.chat = App.cable.subscriptions.create({
        channel: "ChatChannel",
        user_id: user_id,
    }, {
        connected: function () {
        },
        disconnected: function () {
        },
        received: function (data) {
            return $('#messages').append(data['message']);
        },
        // 2
        speak: function (message) {
            alert($('#destiny_user_id').val());
            return;
            return this.perform('speak', {
                origin_user_id: origin_user_id,
                destiny_user_id: $('#destiny_user_id').val(),
                message: message,
            });
        }
    });

}

// 1
$(document).on('keypress', '[data-behavior~=chat_speaker]', function (event) {
    if (event.keyCode === 13) {
        App.chat.speak(event.target.value);
        
        // seguranca para nao repetir envio
        event.target.value = "";
        return event.preventDefault();
    }
});