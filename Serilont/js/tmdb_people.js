//General vars
var index_id_ref = 0;
var settings = {};

//Boolean vars
var allFilled = false;
var buttonClicked = false;
var tst = false;
//Reference vars
var totalPeopleFound = 0;
//var n_search_count = 0;

//Variables pagina api/html
var page_num = 1;
var page_count = 0;
var before_page_count = 1;
var before_page_num = 1;
var page_displayed = 1;
var isPostBack = false;

if (!isPostBack) {
    initialize();
    apiFunction();
    isPostBack = true;
}

function apiFunction() {
    //Repeat Ajax function (working way)
    if (buttonClicked) {
        //before_page_num = page_num - page_count;
    }

    setSettings();
    $.ajax(settings);
}

function setSettings() {
    settings = {
        "async": true,
        "url": "https://api.themoviedb.org/3/person/popular?api_key=4d00ef70595e2049d0dfdcdead53e97a&language=en-US&page=" + page_num,
        "method": "GET",
        "dataType": "json",
        "complete": function (jqXHR, textStatus) {
            console.log("Completed: " + textStatus);
        },
        "error": function (jqXHR, textStatus, errorThrown) {
            console.log("Error: " + errorThrown);
        },
        "success": function (data, textStatus, jqXHR) {
            listarConsulta(data);
            if (!allFilled) {
                apiFunction();
            }
        }
    } 
}
    
function listarConsulta(response) {
    //Mostrar en format bonic
    var imageBaseLink = "http://image.tmdb.org/t/p/w300/";
    var results = response.results;

    var tv_actor = false;
    var kfs = [];

    //Get element
    $.each(results, function (i, res) {
        var known = res.known_for;
        //Get sub element
        $.each(known, function (i, kf) {
            if (kf.media_type == "tv") {
                //Save known_for on array where media_type is tv
                kfs.push(kf.name);
                if (!tv_actor) {
                    tv_actor = true;
                }
            }
        });

        //Right element?
        if (tv_actor) {
            var k_len = kfs.length;

            //Header + IMG
            $("#" + index_id_ref + ">.card>.card-header").append(res.name);
            if (res.profile_path != null) {
                $("#" + index_id_ref + ">.card>img").attr('src', imageBaseLink + res.profile_path);
            }
            else {
                $("#" + index_id_ref + ">.card>img").attr('src', 'imatges/imagenotfound.jpg');
            }
            $("#" + index_id_ref + ">.card>img").attr('alt', res.name);

            //Performed on
            for (var j = 0; j < k_len; j++) {
                $("#" + index_id_ref + ">.card>ul").append("<li class='list-group-item' style='text-align: center; font-size: 1.5rem'>" + kfs[j] + "</li>");
            }

            //Footer
            $("#" + index_id_ref + ">.card>.card-footer>.card-title").append("Popularity range: " + res.popularity + ".<br/>");

            if (k_len == 1) {
                $("#" + index_id_ref + ">.card>.card-footer>.card-title").append("Has performed on 1 tv serie.");
            }
            else {
                $("#" + index_id_ref + ">.card>.card-footer>.card-title").append("Has performed on " + k_len + " tv series.");
            }

            //Init
            totalPeopleFound += 1;
            tv_actor = false;
            kfs = [];

            //All filled? then
            if (index_id_ref >= 17) {
                allFilled = true;
                return false;
            }
            else {
                index_id_ref += 1;
            }
        }
    });

    page_count += 1;
    page_num += 1;
}

function initialize() {
    for (var i = 0; i < 18; i++) {
        $("#" + i + ">.card>.card-header").empty();
        $("#" + i + ">.card>img").attr('src', 'imatges/imagenotfound.jpg');
        $("#" + i + ">.card>img").attr('alt', 'Not Found');
        $("#" + i + ">.card>ul").empty();
        $("#" + i + " .card-title").empty();
        $("#" + i + " .mb-3").css('height', 'auto');
        //document.getElementById(i).style.display = 'none';
    }
    //Initialize Variables
    index_id_ref = 0;
    if (!isPostBack || !buttonClicked) {
        page_num = 1;
    }

    $('#page_num').innerHTML = "Page " + page_displayed;
    allFilled = false;
}

function prevButton() {
    $('html, body').animate({ scrollTop: 0 }, 'medium');
    location.reload();

    /*if (allFilled && before_page_count > 1) {
        totalPeopleFound -= 18;

        //page_num = before_page_count;
        //before_page_num = page_num - page_count;
        //page_num = before_page_num;
        //page_count = 0;
        
        page_displayed -= 1;

        buttonClicked = true;
        initialize();
        apiFunction();

        $('html, body').animate({ scrollTop: 0 }, 'medium');

        buttonClicked = false;
        return false;
    }
    else {
        before_page_num = 1;
        page_num = 1;
        return false;
    }*/
}

function nextButton() {
    //set MAX
    if (allFilled && page_num <= 999) {
        before_page_count = page_num;
        page_displayed += 1;
        buttonClicked = true;
        initialize();
        apiFunction();
        $('html, body').animate({ scrollTop: 0 }, 'medium');

        buttonClicked = false;
        //return false;
    }
}