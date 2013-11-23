$(document).ready(function () {

    activeItem = $("#accordion li:first");
    $(activeItem).addClass('active');

    $("#accordion li").hover(function () {
        $(activeItem).animate({ width: "125px" }, { duration: 200, queue: false });
        $(this).animate({ width: "320px" }, { duration: 200, queue: false });
        activeItem = this;
    });

});