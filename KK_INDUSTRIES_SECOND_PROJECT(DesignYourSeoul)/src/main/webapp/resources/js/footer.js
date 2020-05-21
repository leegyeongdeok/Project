
var width;
var sensorKey = false;
$(document).ready( function () {
    $('.sensor').on('mouseout', function (e) {
        $('.sensor').css('opacity', 0);
    });

    $('.sensor').on('mouseover', function (e) {
        $('.sensor').css('opacity', 0.7);
    });

    fontSizeManager();

});

$(window).resize(function () {
    nowWidth =  window.innerWidth || document.body.clientWidth;

    if(sensorKey){
        var sensor = $(".sensor");
        sensor.css('width', '8vw');
        sensor.css('opacity', '0');
        sensor.css('background-color', '#A9A9A9');
        sensor.css('max-width', '90px');
        $(".moreInfo").text('MORE INFO');
        onSensor();
        sensorKey = false;
    }
});

function moreInfo() {
    var sensor = $(".sensor");
    var moreInfo = $(".moreInfo");
    var key = moreInfo.text();

    if(key == "MORE INFO"){
        sensorKey = true;
        fontSizeManager();
        sensor.css('max-width', 'none');
        sensor.off('mouseout');
        sensor.off('mouseover');
        moreInfo.text('END INFO');
        sensor.css('opacity', '1');
        sensor.css('background-color', 'black');

        sensor.animate({
            width: '100vw',
        }, 500, 'swing');

        displayChanger();
    }else{
        sensorKey = false;
        sensor.animate({
            width: '8vw',
            opacity: '0',
            'background-color': '#A9A9A9',
            'max-width': '90px'
        }, 500, 'swing');


        moreInfo.text('MORE INFO');

        onSensor();
    }
}


function onSensor() {
    var sensor = $(".sensor");
    sensor.on('mouseout', function (e) {
        $('.sensor').css('opacity', 0);
    });

    sensor.on('mouseover', function (e) {
        $('.sensor').css('opacity', 0.7);
    });

    $('.company_info').css('display', 'none');
    $('.company_intro').css('display', 'none');
    $('.company_from').css('display', 'none');
    $('.company_image').css('opacity', '0');
}

function displayChanger() {
    $('.company_info').css('display', 'block');
    $('.company_intro').css('display', 'block');
    $('.company_from').css('display', 'block');

    $('.company_image').animate({
        opacity: '1'
    }, 1000, 'swing');
}

function fontSizeManager() {
    var introH3 = $('.company_intro h3');
    var standard = introH3.css('font-size').replace('px','');
    var infoH3 = $('.company_info h3');
    var infoP = $('.company_info p');
    var introP = $('.company_intro p');
    var fromP = $('.company_from p');
    var nowWidth =  window.innerWidth || document.body.clientWidth;

    if(standard > 23){
        infoH3.css('font-size', '18px');
        infoP.css('font-size', '13px');
        introH3.css('font-size', '23px');
        introP.css('font-size', '21px');
        fromP.css('font-size', '21px');

        width =  window.innerWidth || document.body.clientWidth;
    }

    if(nowWidth<width){
        infoH3.css('font-size', '2.2vw');
        infoP.css('font-size', '1.6vw');
        introH3.css('font-size', '2.8vw');
        introP.css('font-size', '2.6vw');
        fromP.css('font-size', '2.6vw');
    }
}



