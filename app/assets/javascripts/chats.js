// 3
function connect() {

    App.chat = App.cable.subscriptions.create({channel: "ChatChannel", room: $('#room').val()}, {
        connected: function () {
        },
        disconnected: function () {
        },
        received: function (data) {
            return $('#messages').append(data['message']);
        },
        // 2
        speak: function (message) {
            return this.perform('speak', {
                room: $('#room').val(),
                message: message,
            });
        }
    });

}

// 1
$(document).on('keypress', '[data-behavior~=chat_speaker]', function (event) {
    if (event.keyCode === 13) {
        App.chat.speak(event.target.value);
        event.target.value = "";
        return event.preventDefault();
    }
});