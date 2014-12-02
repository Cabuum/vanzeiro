$(document).ready(function(){
    $("#account_bank_id").change(function(){
        var bankSelected = $("#account_bank_id option:selected").text();
        if (bankSelected.toLowerCase().indexOf("caixa") >= 0) {
            $('#account_agreement').attr('maxlength', '6').removeAttr('minlength');
        } else if (bankSelected.toLowerCase().indexOf("brasil") >= 0) {
            $('#account_agreement').attr('maxlength', '8').attr('minlength', '4');
        }
    });
});