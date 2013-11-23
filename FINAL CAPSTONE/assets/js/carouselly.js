$("#foo3").carouFredSel({

    items: 1,

    direction: "up",

    auto: {

        easing: "elastic",

        duration: 1000,

        timeoutDuration: 2000,

        pauseOnHover: true

    }

}).find(".slide").hover(

    function () { $(this).find("div").slideDown(); },

    function () { $(this).find("div").slideUp(); }

);
