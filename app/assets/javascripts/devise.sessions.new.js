/**
 * Created by bruno on 13/11/14.
 */
/* Webarch Admin Dashboard
 -----------------------------------------------------------------*/
$(document).ready(function() {

    $('#login_toggle').click(function(){
        $('#form_login').show();
        $('#form_register').hide();

    });
    $('#register_toggle').click(function(){
        $('#form_login').hide();
        $('#form_register').show();
    });

    if($.fn.lazyload) {
        $(".lazy").lazyload({
            effect : "fadeIn"
        });
    }

    if($.fn.validate) {
        $('#form_login').validate({

            errorElement: 'span',
            errorClass: 'error',
            focusInvalid: false,
            ignore: "",
            rules: {
                login_email: {
                    minlength: 2,
                    required: true,
                    email: true
                },
                login_pwd: {
                    minlength: 2,
                    required: true
                },
                gendericonic: {
                    required: true
                }
            },

            invalidHandler: function (event, validator) {
                //display error alert on form submit
            },

            errorPlacement: function (error, element) { // render error placement for each input type

                var icon = $(element).parent('.input-with-icon').children('i');
                var parent = $(element).parent('.input-with-icon');
                icon.removeClass('fa fa-check').addClass('fa fa-exclamation');
                parent.removeClass('success-control').addClass('error-control');
            },

            highlight: function (element) { // hightlight error inputs
                var parent = $(element).parent();
                parent.removeClass('success-control').addClass('error-control');
            },

            unhighlight: function (element) { // revert the change done by hightlight
            },

            success: function (label, element) {
                var icon = $(element).parent('.input-with-icon').children('i');
                var parent = $(element).parent('.input-with-icon');
                icon.removeClass("fa fa-exclamation").addClass('fa fa-check');
                parent.removeClass('error-control').addClass('success-control');
            },

            submitHandler: function (form) {
                $(form).ajaxSubmit();
            }
        });
    }
});