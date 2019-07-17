document.addEventListener(
    "DOMContentLoaded", () => {
        new Mmenu("#menu", {
            "extensions": [
                "pagedim-black",
                "position-right"
            ]
        });
    }
);

$(document).ready(function () {

    $(".main__slider .owl-carousel").owlCarousel({
        items: 1,
        nav: false,
        // autoplay: true,
        loop: true,
        autoplayTimeout: 4000
    });

    $(".slider__products .owl-carousel").owlCarousel({
        items: 4,
        nav: false,
        dots: false,
        margin: 16,
        responsiveClass: true,
        responsive: {
            0: {
                items: 1,
                stagePadding: 50
            },
            768: {
                items: 3,
                stagePadding: 75
            },
            1199: {
                items: 4,
                stagePadding: 0
            }
        }
    });

    $(".product__gallery .owl-carousel").owlCarousel({
        items: 1,
        nav: false,
        video: false,
        thumbs: true,
        dots: false,
        thumbsPrerendered: true
    });
	


});
