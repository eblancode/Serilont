var imagebackground = -1;
var imgbackgrounds = [];
imgbackgrounds[0] = '/imatges/background/img1.jpg';
imgbackgrounds[1] = '/imatges/background/img2.jpg';
imgbackgrounds[2] = '/imatges/background/img3.jpg';
imgbackgrounds[3] = '/imatges/background/img4.jpg';
imgbackgrounds[4] = '/imatges/background/img5.jpg';
imgbackgrounds[5] = '/imatges/background/img6.jpg';
imgbackgrounds[6] = '/imatges/background/img7.jpg';


function changeimage() {
    imagebackground++;
    if (imagebackground > 6) imagebackground = 0;
    
    $('.bkground').fadeToggle("slow", function () {
        $('.bkground').css({
            'background-image': "url('" + imgbackgrounds[imagebackground] + "')",
            'background-size': 'cover'
        });
        $('.bkground').fadeToggle("slow");
    });

    
    setTimeout(changeimage, 5000);
}

$(document).ready(function () {
    setTimeout(changeimage, 5000);
});