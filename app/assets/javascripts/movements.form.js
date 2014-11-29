/**
 * Created by bruno on 25/11/14.
 */

$(document).ready(function(){
    $("#movement_label_from_of").text("De quem ?");
    $("#movement_type").change(function(){
        var n = $("#movement_type").val();
        if(n == 1){
            $("#movement_label_from_of").text("De quem ?");
        }else{
            $("#movement_label_from_of").text("Para quem?");
        }
    });
});