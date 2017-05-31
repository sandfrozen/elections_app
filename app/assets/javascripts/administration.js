$(document).ready(function(){
    $(".btn-show-form").click(function(){
        $(this).hide();
        $(".form-to-show").fadeToggle();
    });
});

