/* Webarch Admin Dashboard
  Remodeled by Cabuum - @brunoocasali and @joridos
 -----------------------------------------------------------------*/

$(document).ready(function(){

	//Date Pickers
	$('.input-append.date').datepicker({
		autoclose: true,
		format: 'dd/mm/yyyy',
		todayHighlight: true
	});

    $('input[id*="_phone"]').mask("(99) 9999-9999");
    $('input[id*="_cpf"]').mask("999.999.999-99");
});