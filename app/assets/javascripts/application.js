// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery_ujs
//= require_self
//= require_tree .

$(document).ready(function(){
    //Messenger().post("Bem vindo! <a href='/passageiros/novo'>Começe adicionando um novo passageiro</a>");

    $('#message-newsletter').hide();
    $("#form_newsletter").submit(function(){
        $(this).hide();
        $('#message-newsletter').show();
    });

    $('#closer-button').on('click', function(){
        $('#mail_newsletter').val('');
        $("#form_newsletter").show();
    });

    $('input[id*="_value"]').focusout(function() {
        $('input[id*="_value"]').each(function (index) {
            var value = $(this).val().replace(",", ".");
            $(this).val(value.replace(/ /g,''));
        });
    });

    $('input[id*="_interest"]').focusout(function() {
        $('input[id*="_interest"]').each(function (index) {
            var value = $(this).val().replace(",", ".");
            $(this).val(value.replace(/ /g,''));
        });
    });

});