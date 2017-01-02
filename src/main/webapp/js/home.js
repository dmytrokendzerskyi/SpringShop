jQuery.noConflict();
jQuery(document).ready(function ($) {
    var myslider = new YerSlider();
    myslider.init({
        sliderid: '.mysliderclass',
        sliderfadeinspeed: 'slow',
        slidegap: 10,
        slidegroupresp: {
            0: 1,
            450: 2,
            900: 3
        },
        swipe: true,
        swipemouse: false,
        swipeandprevnextbtn: false,
        swipeanimationspeed: 300,
        nextkey: 13,
        prevkey: 14,
        animationtype: 'ease',
        animationspeed: 1000,
        loop: 'infinite',
        animationspeed: 1000,
        animationtype: 'ease',
        autoplay: true,
        autoplayinterval: 10000,
        autoplaydelaystart: 0,
        autoplaystoponhover: true,
        nextbtn: true,
        prevbtn: true,
        prevnextlocation: 'inside',
        bullets: true,
        bulletslocation: 'outside',
        thumbs: true,
        thumbshideiflessthan: 2,
        thumbslocation: 'outside',
        thumbsclickable: true,
        thumbstemplates: {
            '1': {
                'html': '<p>{{thumb-text}}</p>',
                'class': 'thumb-template-1'
            }
        },
        thumbsready: function (p) {
            var yersliderthumbs = new YerSliderThumbs();
            yersliderthumbs.init({
                obj: p.obj,
                param: p.param
            });
        },
        detach: {
            targets: {
                '1': {
                    selector_wrap: '.detach-target',
                    selector_item: '.detach-target-item',
                    insert_selector: '.code',
                    insert_method: 'append',
                    template_wrap: '<div class="detach-target">detach: {content} (content from current slides)</div>',
                    template_item: '<span class="detach-target-item"> {content}</span>',
                    change: function (p) {
                        var root = p.items.parents('.detach-target'), height = root.height();
                        root.css('height', height + 'px');
                        window.setTimeout(function () {
                            p.items.fadeOut(90);
                        }, 600);
                        window.setTimeout(function () {
                            p.items_current.fadeIn(300);
                            window.setTimeout(function () {
                                root.css('height', 'auto');
                            }, 100);
                        }, 700);
                    }
                }
            },
            sources: {
                '1': {
                    target_id: '1',
                    selector: '.detach',
                    source: 'element',
                    remove: '.detach'
                }
            }
        },
        sliderready: function () {
            $('.code').append('sliderready: Slider is ready!');
        }
    });
});
//# sourceURL=pen.js

/* Demo purposes only */
$(".hover").mouseleave(
  function() {
    $(this).removeClass("hover");
  }
);