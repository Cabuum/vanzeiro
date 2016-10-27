/* Webarch Admin Dashboard
 /* This JS is only for DEMO Purposes - Extract the code that you need
 -----------------------------------------------------------------*/
/* Set the defaults for DataTables initialisation */
$.extend( true, $.fn.dataTable.defaults, {
    "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span12'p i>>",
    "sPaginationType": "bootstrap",
    "oLanguage": {
        "sLengthMenu": "_MENU_"
    }
});


/* Default class modification */
$.extend( $.fn.dataTableExt.oStdClasses, {
    "sWrapper": "dataTables_wrapper form-inline"
});


/* API method to get paging information */
$.fn.dataTableExt.oApi.fnPagingInfo = function ( oSettings )
{
    return {
        "iStart":         oSettings._iDisplayStart,
        "iEnd":           oSettings.fnDisplayEnd(),
        "iLength":        oSettings._iDisplayLength,
        "iTotal":         oSettings.fnRecordsTotal(),
        "iFilteredTotal": oSettings.fnRecordsDisplay(),
        "iPage":          oSettings._iDisplayLength === -1 ?
            0 : Math.ceil( oSettings._iDisplayStart / oSettings._iDisplayLength ),
        "iTotalPages":    oSettings._iDisplayLength === -1 ?
            0 : Math.ceil( oSettings.fnRecordsDisplay() / oSettings._iDisplayLength )
    };
};


/* Bootstrap style pagination control */
$.extend( $.fn.dataTableExt.oPagination, {
    "bootstrap": {
        "fnInit": function( oSettings, nPaging, fnDraw ) {
            var oLang = oSettings.oLanguage.oPaginate;
            var fnClickHandler = function ( e ) {
                e.preventDefault();
                if ( oSettings.oApi._fnPageChange(oSettings, e.data.action) ) {
                    fnDraw( oSettings );
                }
            };

            $(nPaging).addClass('pagination').append(
                '<ul>'+
                '<li class="prev disabled"><a href="#"><i class="fa fa-chevron-left"></i></a></li>'+
                '<li class="next disabled"><a href="#"><i class="fa fa-chevron-right"></i></a></li>'+
                '</ul>'
            );
            var els = $('a', nPaging);
            $(els[0]).bind( 'click.DT', { action: "previous" }, fnClickHandler );
            $(els[1]).bind( 'click.DT', { action: "next" }, fnClickHandler );
        },

        "fnUpdate": function ( oSettings, fnDraw ) {
            var iListLength = 5;
            var oPaging = oSettings.oInstance.fnPagingInfo();
            var an = oSettings.aanFeatures.p;
            var i, ien, j, sClass, iStart, iEnd, iHalf=Math.floor(iListLength/2);

            if ( oPaging.iTotalPages < iListLength) {
                iStart = 1;
                iEnd = oPaging.iTotalPages;
            }
            else if ( oPaging.iPage <= iHalf ) {
                iStart = 1;
                iEnd = iListLength;
            } else if ( oPaging.iPage >= (oPaging.iTotalPages-iHalf) ) {
                iStart = oPaging.iTotalPages - iListLength + 1;
                iEnd = oPaging.iTotalPages;
            } else {
                iStart = oPaging.iPage - iHalf + 1;
                iEnd = iStart + iListLength - 1;
            }

            for ( i=0, ien=an.length ; i<ien ; i++ ) {
                // Remove the middle elements
                $('li:gt(0)', an[i]).filter(':not(:last)').remove();

                // Add the new list items and their event handlers
                for ( j=iStart ; j<=iEnd ; j++ ) {
                    sClass = (j==oPaging.iPage+1) ? 'class="active"' : '';
                    $('<li '+sClass+'><a href="#">'+j+'</a></li>')
                        .insertBefore( $('li:last', an[i])[0] )
                        .bind('click', function (e) {
                            e.preventDefault();
                            oSettings._iDisplayStart = (parseInt($('a', this).text(),10)-1) * oPaging.iLength;
                            fnDraw( oSettings );
                        } );
                }

                // Add / remove disabled classes from the static elements
                if ( oPaging.iPage === 0 ) {
                    $('li:first', an[i]).addClass('disabled');
                } else {
                    $('li:first', an[i]).removeClass('disabled');
                }

                if ( oPaging.iPage === oPaging.iTotalPages-1 || oPaging.iTotalPages === 0 ) {
                    $('li:last', an[i]).addClass('disabled');
                } else {
                    $('li:last', an[i]).removeClass('disabled');
                }
            }
        }
    }
} );


/*
 * TableTools Bootstrap compatibility
 * Required TableTools 2.1+
 */

// Set the classes that TableTools uses to something suitable for Bootstrap
$.extend( true, $.fn.DataTable.TableTools.classes, {
    "container": "DTTT ",
    "buttons": {
        "normal": "btn btn-white",
        "disabled": "disabled"
    },
    "collection": {
        "container": "DTTT_dropdown dropdown-menu",
        "buttons": {
            "normal": "",
            "disabled": "disabled"
        }
    },
    "print": {
        "info": "DTTT_print_info modal"
    },
    "select": {
        "row": "active"
    }
} );

// Have the collection use a bootstrap compatible dropdown
$.extend( true, $.fn.DataTable.TableTools.DEFAULTS.oTags, {
    "collection": {
        "container": "ul",
        "button": "li",
        "liner": "a"
    }
} );

$(".select2-wrapper").select2({minimumResultsForSearch: -1});

/* Table initialisation */
$(document).ready(function() {
    var responsiveHelper = undefined;
    var breakpointDefinition = {
        tablet: 1024,
        phone: 480
    };

    $('#quick-access .btn-cancel').click(function () {
        $("#quick-access").css("bottom", "-115px");
    });
    $('#quick-access .btn-add').click(function () {
        $("#quick-access").css("bottom", "-115px");
    });
});


/*
* CODE FOR PASSENGERS
*/
// var nCloneTh = document.createElement( 'th' );
// var nCloneTd = document.createElement( 'td' );
// nCloneTd.innerHTML = '<i class="fa fa-remove index-non-table"></i>';
// nCloneTd.className = "center index-non-table";

// $('#passenger thead tr').each( function () {
//     this.insertBefore( nCloneTh, this.lastChild);
// });

// $('#passenger tbody tr').each( function () {
//     this.insertBefore(  nCloneTd.cloneNode( true ), this.lastChild );
// });

var passenger = $('#passenger').dataTable({
    "paging": false,
    "sDom": "<'row'<'col-md-6'l <'toolbar'>><'col-md-6'f>r>t<'row'<'col-md-12'p i>>",
    "oTableTools": {
        "aButtons": [
            {
                "sExtends":    "collection",
                "sButtonText": "<i class='fa fa-cloud-download'></i>",
                "aButtons":    [ "csv", "xls", "pdf", "copy"]
            }
        ]
    },
    "aoColumnDefs": [
        { "bSortable": false, "aTargets": [ 0 ] }
    ],
    "aaSorting": [[ 3, "desc" ]],
    "oLanguage": {
        "sLengthMenu": "_MENU_ ",
        "sInfo": "Exibindo <b>_START_ à _END_</b> de _TOTAL_ resultados"
    }
});

$('#passenger_wrapper .dataTables_filter input').addClass("input-medium ");
$('#passenger_wrapper .dataTables_filter').addClass("input-medium text-right");
$('#passenger_wrapper .dataTables_length select').addClass("select2-wrapper span12");
$("#passenger_wrapper div.toolbar").html('<div class="table-tools-actions">' +
'<a href="/passageiros/novo" class="btn btn-primary" style="margin-left:0.6em">Adicionar</a></div>');
/*
* END CODE FOR PASSENGERS
*/

/*
* CODE FOR MOVEMENTS
*/
var movimentacao = $('#movimentacao').dataTable({
    "sDom": "<'row'<'col-md-6'l <'toolbar'>><'col-md-6'f>r>t<'row'<'col-md-12'p i>>",
    "oTableTools": {
        "aButtons": [
            {
                "sExtends":    "collection",
                "sButtonText": "<i class='fa fa-cloud-download'></i>",
                "aButtons":    [ "csv", "xls", "pdf", "copy"]
            }
        ]
    },
    "aoColumnDefs": [
        { "bSortable": false, "aTargets": [ 0 ] }
    ],
    "aaSorting": [[ 3, "desc" ]],
    "oLanguage": {
        "sLengthMenu": "_MENU_ ",
        "sInfo": "Exibindo <b>_START_ à _END_</b> de _TOTAL_ resultados"
    }
});

$('#movimentacao_wrapper .dataTables_filter input').addClass("input-medium ");
$('#movimentacao_wrapper .dataTables_filter').addClass("input-medium text-right");
$('#movimentacao_wrapper .dataTables_length select').addClass("select2-wrapper span12");
$("#movimentacao_wrapper div.toolbar").html('<div class="table-tools-actions">'+
'<a class="btn btn-primary" href="/fluxo-de-caixa/novo" style="margin-left:0.6em"> Adicionar</a></div>');
/*
* END CODE FOR MOVEMENTS
*/

/*
* CODE FOR CONTRACT
*/

//Insert a 'details' column to the table
var nCloneTh = document.createElement( 'th' );
var nCloneTd = document.createElement( 'td' );
nCloneTd.innerHTML = '<i class="fa fa-plus-circle index-non-table"></i>';
nCloneTd.className = "center index-non-table";

$('#contract thead tr').each( function () {
    this.insertBefore( nCloneTh, this.childNodes[0] );
});

$('#contract tbody tr').each( function () {
    this.insertBefore(  nCloneTd.cloneNode( true ), this.childNodes[0] );
});

var contract = $('#contract').dataTable({
    "sDom": "<'row'<'col-md-6'l <'toolbar'>><'col-md-6'f>r>t<'row'<'col-md-12'p i>>",
    "oTableTools": {
        "aButtons": [
            {
                "sExtends":    "collection",
                "sButtonText": "<i class='fa fa-cloud-download'></i>",
                "aButtons":    [ "csv", "xls", "pdf", "copy"]
            }
        ]
    },
    "aoColumnDefs": [
        { "bSortable": false, "aTargets": [ 0 ] }
    ],
    "aaSorting": [[ 3, "desc" ]],
    "oLanguage": {
        "sLengthMenu": "_MENU_ ",
        "sInfo": "Exibindo <b>_START_ à _END_</b> de _TOTAL_ resultados"
    }
});

$('#contract_wrapper .dataTables_filter input').addClass("input-medium ");
$('#contract_wrapper .dataTables_filter').addClass("input-medium text-right");
$('#contract_wrapper .dataTables_length select').addClass("select2-wrapper span12");
$("#contract_wrapper div.toolbar").html('<div class="table-tools-actions">' +
'<a href="/contratos/novo" class="btn btn-primary" style="margin-left:0.6em">Adicionar</a></div>');

/* Add event listener for opening and closing details
 * Note that the indicator for showing which row is open is not controlled by DataTables,
 * rather it is done here
 */
$('#contract tbody td i').live('click', function () {
    var nTr = $(this).parents('tr')[0];
    if (contract.fnIsOpen(nTr) )
    {
        /* This row is already open - close it */
        this.removeClass = "fa fa-plus-circle index-non-table";
        this.addClass = "fa fa-minus-circle index-non-table";
        contract.fnClose( nTr );
    }
    else
    {
        /* Open this row */
        this.removeClass = "fa fa-plus-circle index-non-table";
        this.addClass = "fa fa-minus-circle index-non-table";
        var items = '';
        $.getJSON( '/passageiros/'+ $(nTr).data('passegerid') +'/contrato/'+ $(nTr).data('id') +'/parcelas.json', function( data ) {
            $.each( data, function( key, val ) {
                items += '<tr><td>Parcela:</td><td>'+val.expiration+' </td><td>Valor:</td><td>'+val.value+' </td></tr>';
            });
            contract.fnOpen( nTr, fnFormatDetails(contract, items), 'details' );
        });
    }

}   );
/*
* END CODE FOR CONTRACT
*/
$(document).ready(function() { $(".select2-wrapper").select2({minimumResultsForSearch: -1}); });

/* Formating function for row details */
function fnFormatDetails ( oTable, items ) {
    var sOut = '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;" class="inner-table">';
    sOut += items
    sOut += '</table>';

    return sOut;
}


/*
 * CODE FOR CONVERSATIONS
 */

var conversation = $('#conversation').dataTable({
    "paging": false,
    "sDom": "<'row'<'col-md-6'l <'toolbar'>><'col-md-6'f>r>t<'row'<'col-md-12'p i>>",
    "oTableTools": {
        "aButtons": [
            {
                "sExtends":    "collection",
                "sButtonText": "<i class='fa fa-cloud-download'></i>",
                "aButtons":    [ "csv", "xls", "pdf", "copy"]
            }
        ]
    },
    "aoColumnDefs": [
        { "bSortable": false, "aTargets": [ 0 ] }
    ],
    "aaSorting": [[ 3, "desc" ]],
    "oLanguage": {
        "sLengthMenu": "_MENU_ ",
        "sInfo": "Exibindo <b>_START_ à _END_</b> de _TOTAL_ resultados"
    }
});

$('#conversation_wrapper .dataTables_filter input').addClass("input-medium ");
$('#conversation_wrapper .dataTables_filter').addClass("input-medium text-right");
$('#conversation_wrapper .dataTables_length select').addClass("select2-wrapper span12");
$("#conversation_wrapper div.toolbar").html('<div class="table-tools-actions">' +
    '<a href="/messages/new" class="btn btn-primary" style="margin-left:0.6em">Adicionar</a></div>');
/*
 * END CODE FOR CONVERSATIONS
 */
