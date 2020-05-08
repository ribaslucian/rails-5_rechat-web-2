// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require functions
//= require activestorage
//
//= require angularjs/min
//= require angularjs/init/application
//= require angularjs/services/basic
// 
//= require_tree .
//
//= require cocoon
//= require semantic-ui

$(document).ready(function () {
    $('.dropdown').dropdown();

    certer_content_visible();
    $('.ws-loading-global').fadeOut();
});

$(window).on('beforeunload', function () {
    $('.ws-loading-global').fadeIn();
});

function certer_content_visible() {
    var content_visible = $('#main-container').height();
    var body = $('body').height();

    if (content_visible < body) {
        $('#content-center').addClass('ws-center-absolute-y')
    }
}