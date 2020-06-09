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
//= require jquery.min
//= require activestorage
//= require bootstrap-datepicker
//= require moment
//= require bootstrap-datetimepicker
//= require chosen-jquery
//= require signature_pad
//= require_tree .

function popupMessage(message, klass) {
    notificationTop = "+" + ($(document).scrollTop() + 60);
    $('#notification').removeClass().addClass('alert ' + klass);
    $('#flash-msg-text').html(message);
    $('#notification').show().animate({
        top: notificationTop
    }, 200);
    $('#notice-close').click(function () {
        $('#notification').hide();
    });
    setTimeout(function () {
        $('#notification').hide().animate({
            top: "-60"
        }, 500);
    }, 20000);
}

$(function() {
    $('.chosen-select').chosen({});
    $('.datepicker').datepicker({format: 'yyyy/mm/dd'});
})

function drawSignature(selector) {
    var canvas = document.querySelector("canvas");
    if (canvas){
        canvas.height = 253;
        canvas.width = 500;
        // window.onresize = resizeCanvas(canvas);
        console.log(canvas.height)
        console.log(canvas.width)
        resizeCanvas(canvas);
        signature_pad = new SignaturePad(canvas);
        $('.signature_pad_clear').click(function() { signature_pad.clear() });
        $('.signature_pad_save').off().click(function(event) {
            if (signature_pad.isEmpty()){
                alert('You must sign to accept the Terms and Conditions');
                event.preventDefault();
            } else {
                $(selector).val(signature_pad.toDataURL());
                $(selector).parent().children('img').attr("src",signature_pad.toDataURL());
                $("#exampleModal").modal('hide');
            }
        });
    }
}

