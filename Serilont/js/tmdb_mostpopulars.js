//Global vars
var index_id_ref = 0;
var page_num = 1;
var genre = "";
var year = "";
var filterYear = "";
var settings = {};

ajaxCall();

function ajaxCall() {
    //Una sola llamada para cargar la página completa
    initialize();
    setSettings();
    $.ajax(settings);
}

function applyFilters() {
    //Page variables
    genre = document.getElementById('ContentPlaceHolderContingut_DropDownListGenres').value;
    year = document.getElementById('ContentPlaceHolderContingut_DropDownListYear').value;
    var selectedRbVal = $("[id$='RadioButtonListYear']").find(":checked").val();
    
    if (genre != "" || year != "") {
        page_num = 1;
        initialize();
        
        if (year != "") {
            switch (selectedRbVal) {
                case "More than":
                    filterYear = "&first_air_date.gte=";
                    break;
                case "Equal than":
                    filterYear = "&first_air_date_year=";
                    break;
                case "Less than":
                    filterYear = "&first_air_date.lte=";
                    break;
                default:
                    alert("Check the RB button");
                    break;
            }
        }
        else {
            year = "";
            filterYear = "";
        }

        ajaxCall();
    }
    else {
        return false;
    }
}

function setUrl() {
    return "https://api.themoviedb.org/3/discover/tv?api_key=4d00ef70595e2049d0dfdcdead53e97a&language=en-US&sort_by=popularity.desc&page=" + page_num + "&with_genres=" + genre + "&timezone=America%2FNew_York&include_null_first_air_dates=false"+ filterYear + year;
    //&vote_count.gte=25
}

function setSettings() {
    settings = {
        "url": setUrl(),
        "method": "GET",
        "dataType": "json",
        "complete": function (jqXHR, textStatus) {
            console.log("Completed: " + textStatus);
        },
        "error": function (jqXHR, textStatus, errorThrown) {
            console.log("Error: " + errorThrown);
        },
        "success": function (data, textStatus, jqXHR) {
            listQuery(data);
        }
    }
}

function listQuery(response) {
    var imageBaseLink = "http://image.tmdb.org/t/p/w300/";
    var n_results = Object.keys(response.results).length;
    var height1 = 0, height2 = 0;

    //Disable buttons
    if(n_results<20) {
        if(page_num<=2) {
            $("#btnPrev").prop("disabled", true);
        }
        $("#btnNext").prop("disabled", true);
    }

    //Display elements
    $.each(response.results, function (id, result) {
        $("#" + index_id_ref + ">.card>.card-header").append(result.name);
        if (result.poster_path != null) {
            $("#" + index_id_ref + ">.card>img").attr('src', imageBaseLink + result.poster_path);
        }
        else {
            $("#" + index_id_ref + ">.card>img").attr('src', 'imatges/imagenotfound.jpg');
        }
        $("#" + index_id_ref + ">.card>img").attr('alt', result.original_name);
        $("#" + index_id_ref + " .card-text").append(result.overview);
        $("#" + index_id_ref + " .card-title").append("Vote count: " + result.vote_count + " -- Popularity: " + result.popularity + "<br/>" + "<b style='font-size: large'>Vote average: " + result.vote_average + "</b>");
        if (result.first_air_date != "") {
            $("#" + index_id_ref + " .card-footer").append("<div class='text-muted'>Release date: " + result.first_air_date + "</div>");
        }

        $("#"+index_id_ref).show();
        index_id_ref += 1;
    });

    setHeight();

    document.getElementById('page_num').innerHTML = "Page " + page_num;

    function setHeight() {
        for (var i = 0; i < n_results; i++) {
            if (i % 2 == 0) {
                height1 = $("#" + i + " .mb-3").height();
            }
            else {
                height2 = $("#" + i + " .mb-3").height();
                if (height2 < height1) {
                    $("#" + i + " .mb-3").height(height1);
                }
                else {
                    $("#" + (i - 1) + " .mb-3").height(height2);
                }
            }
        }
    }
}

function initialize() {
    //Set the page as default
    for (var i = 0; i < 20; i++) {
        $("#" + i + ">.card>.card-header").empty();
        $("#" + i + ">.card>img").attr('src', 'imatges/imagenotfound.jpg');
        $("#" + i + ">.card>img").attr('alt', 'Not Found');
        $("#" + i + ">.card>ul").empty();
        $("#" + i + " .card-text").empty();
        $("#" + i + " .card-title").empty();
        if ($("#" + i + " .text-muted").length) {
            $("#" + i + " .text-muted").empty();
        }
        $("#" + i + " .mb-3").css('height', 'auto');
        $("#"+i).hide();
    }
    //Set vars as default
    index_id_ref = 0;
    settings = {};
    $("#btnPrev").prop("disabled", false);
    $("#btnNext").prop("disabled", false);
}

function prevButton() {
    if (page_num > 1) {
        initialize();
        page_num -= 1;
        ajaxCall();
        $('html, body').animate({ scrollTop: 0 }, 'medium');
    }
    else {
        $('html, body').animate({ scrollTop: 0 }, 'medium');
    }
}

function nextButton() {
    initialize();
    if (page_num <= 999) {
        page_num += 1;
        ajaxCall();
        $('html, body').animate({ scrollTop: 0 }, 'medium');
    }
}