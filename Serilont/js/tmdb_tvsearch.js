//User petition vars
var searchPattern = "";
var yearofrelease = "";
var searchType = "";
var genre = "";
//Reference vars
var page_num = 1;
var index_id_ref = 0;
//Settings vars
var settings = {};
var url = "";
//Conditional vars
var doNotDisplay = false;
var buttonClicked = false;

function apiFunction() {
    //Get values from asp elements.
    if (!buttonClicked) {
        searchPattern = document.getElementById('ContentPlaceHolderContingut_TextBoxSearch').value;
        searchType = document.getElementById('ContentPlaceHolderContingut_DropDownListSearch').value;
        try { yearofrelease = document.getElementById('ContentPlaceHolderContingut_DropDownListYear').value; } catch (e) { }
        try { genre = document.getElementById('ContentPlaceHolderContingut_DropDownListGenres').value; } catch (e) { }
    }

    //Call function to set the page as default.
    initValues();

    //Valid search? Then:
    if (searchPattern != "") {
        switch (searchType) {
            case "TVShows":
                apiCall();
                return false;
                break;

            case "Movies":
                apiCall();
                return false;
                break;

            case "People":
                apiCall();
                return false;
                break;

            case "Multi":
                apiCall();
                return false;
                break;

            default:
                defaultView();
                alert("Something went wrong.");
                break;
        }
    } else {
        defaultView();
        alert("You must type your search");
    }

    //FUNCTIONS below
    function apiCall() {
        if (!doNotDisplay) {
            setURL();
            setSetting();
            var execAjax = $.ajax(settings);
        }
    }

    //Set settings to use on ajax function
    function setSetting() {
        settings = {
            //"async": true,
            //"crossDomain": true,
            "url": url,
            "method": "GET",
            "success": function (data, textStatus, jqXHR) {
                listQuery(data);
                if (!doNotDisplay) {
                    apiCall();
                }
            },
            "error": function (jqXHR, textStatus, errorThrown) {
                console.log("Error: " + errorThrown);
            }
        }
    }

    //Display selected data from ajax request to the page
    function listQuery(response) {
        //Load elements and views
        var imageBaseLink = "http://image.tmdb.org/t/p/w300/";
        var tmp = index_id_ref;
        var results = response.results;
        var n_results = Object.keys(results).length;

        if (n_results < 20) {
            if (page_num <= 2) {
                $("#btnPrev").prop("disabled", true);
            }
            $("#btnNext").prop("disabled", true);
        }

        switch (searchType) {
            case "TVShows":
                $.each(results, function (i, result) {
                    loadTvShow(result);
                });
                break;
            case "Movies":
                $.each(results, function (i, result) {
                    loadMovie(result);
                });
                break;
            case "People":
                var kfs = [];
                $.each(results, function (i, result) {
                    loadPerson(result);
                });
                break;
            case "Multi":
                var media_type = "";
                var kfs = [];

                $.each(results, function (i, result) {
                    media_type = result.media_type;

                    if (media_type != undefined && media_type != null && media_type != "") {
                        if (media_type == "tv") {
                            //TV
                            loadTvShow(result);
                        }
                        else if (media_type == "movie") {
                            //Movie
                            loadMovie(result);
                        }
                        else if (media_type == "person") {
                            //Person
                            loadPerson(result);
                        }
                        else {
                            alert("Error.");
                        }
                    }
                    else {
                        alert("Check this element, id:" + i + ", api_url:" + url);
                    }
                });
                break;
            default:
                defaultView();
                break;
        }

        //Got some results from API?
        if (tmp == index_id_ref && index_id_ref % 10 != 0 || n_results == 0) {
            defaultView();
            alert("Not results found.");
            doNotDisplay = true;
        }
        else {
            document.getElementById('separator').style = null;
            $("#displaySeries").show();
            //document.getElementById('displaySeries').style.display = "inline";
            document.getElementById('page_num').innerHTML = "Page " + parseInt(page_num / 2);
            //Allfilled?
            if ((n_results * 2) < index_id_ref) {
                setHeight(n_results+20);
                doNotDisplay = true;
            }
        }

        page_num += 1;

        //FUNCTIONS load on HTML
        function loadTvShow(result) {
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

            displayElement();
        }

        function loadPerson(result) {
            var known = result.known_for;
            //Get sub element
            $.each(known, function (i, kf) {
                if (kf.name != undefined && kf.name != null && kf.name != "") {
                    kfs.push(kf.name);
                }
            });

            var k_len = kfs.length;

            //Header + IMG
            $("#" + index_id_ref + ">.card>.card-header").append(result.name);
            if (result.profile_path != null) {
                $("#" + index_id_ref + ">.card>img").attr('src', imageBaseLink + result.profile_path);
            }
            else {
                $("#" + index_id_ref + ">.card>img").attr('src', 'imatges/imagenotfound.jpg');
            }
            $("#" + index_id_ref + ">.card>img").attr('alt', result.name);

            //Performed on
            for (var j = 0; j < k_len; j++) {
                $("#" + index_id_ref + ">.card>ul").append("<li class='list-group-item' style='text-align: center; font-size: 1.5rem'>" + kfs[j] + "</li>");
            }

            //Footer
            $("#" + index_id_ref + ">.card>.card-footer>.card-title").append("Popularity range: " + result.popularity + ".<br/>");

            if (k_len == 1) {
                $("#" + index_id_ref + ">.card>.card-footer>.card-title").append("Has performed on 1 tv serie.");
            }
            else {
                $("#" + index_id_ref + ">.card>.card-footer>.card-title").append("Has performed on " + k_len + " tv series.");
            }

            displayElement();
            kfs = [];
        }

        function loadMovie(result) {
            $("#" + index_id_ref + ">.card>.card-header").append(result.title);
            if (result.poster_path != null) {
                $("#" + index_id_ref + ">.card>img").attr('src', imageBaseLink + result.poster_path);
            }
            else {
                $("#" + index_id_ref + ">.card>img").attr('src', 'imatges/imagenotfound.jpg');
            }
            $("#" + index_id_ref + ">.card>img").attr('alt', result.original_title);
            $("#" + index_id_ref + " .card-text").append(result.overview);
            $("#" + index_id_ref + " .card-title").append("Vote count: " + result.vote_count + " -- Popularity: " + result.popularity + "<br/>" + "<b style='font-size: large'>Vote average: " + result.vote_average + "</b>");
            $("#" + index_id_ref + " .card-footer").append("<div class='text-muted'>Release date: " + result.release_date + "</div>");

            displayElement();
        }

        function setHeight(length) {
            for (var i = 0; i < length; i++) {
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

        function displayElement() {
            //document.getElementById(index_id_ref).style.display = 'inline-block';
            $("#" + index_id_ref).show();
            index_id_ref += 1;
        }
    }

    function initValues() {
        //Set the page as default
        for (var i = 0; i < 40; i++) {
            $("#" + i + ">.card>.card-header").empty();
            $("#" + i + ">.card>img").attr('src', 'imatges/imagenotfound.jpg');
            $("#" + i + ">.card>img").attr('alt', 'Not Found');
            $("#" + i + ">.card>ul").empty();
            $("#" + i + " .card-text").empty();
            $("#" + i + " .card-title").empty();
            $("#" + i + " .text-muted").empty();
            $("#" + i + " .mb-3").css('height', 'auto');
            $("#" + i).hide();
            //document.getElementById(i).style.display = 'none';
        }
        //Initialize Variables
        index_id_ref = 0;
        if (!buttonClicked) {
            page_num = 1;
        }

        $("#btnPrev").prop("disabled", false);
        $("#btnNext").prop("disabled", false);
        doNotDisplay = false;
    }

    function setURL() {
        switch (searchType) {
            case "TVShows":
                //https://developers.themoviedb.org/3/discover/tv-discover

                url = "https://api.themoviedb.org/3/search/tv?api_key=4d00ef70595e2049d0dfdcdead53e97a&language=en-US&page=" + page_num + "&query=" + searchPattern + "&first_air_date_year=" + yearofrelease;
                //"https://api.themoviedb.org/3/discover/tv?api_key=4d00ef70595e2049d0dfdcdead53e97a&page=" + page_num + "&with_genres=" + genre + "&query=" + searchPattern + "&first_air_date_year=" + yearofrelease;
                break;
            case "Movies":
                //https://developers.themoviedb.org/3/discover/movie-discover

                url = "https://api.themoviedb.org/3/search/movie?api_key=4d00ef70595e2049d0dfdcdead53e97a&language=en-US&page=" + page_num + "&query=" + searchPattern + "&primary_release_year=" + yearofrelease;
                //"https://api.themoviedb.org/3/discover/movie?api_key=4d00ef70595e2049d0dfdcdead53e97a&page=" + page_num + "&with_genres=" + genre + " &query=" + searchPattern + " &primary_release_year=" + yearofrelease;
                break;
            case "People":
                url = "https://api.themoviedb.org/3/search/person?api_key=4d00ef70595e2049d0dfdcdead53e97a&language=en-US&page=" + page_num + "&query=" + searchPattern + "&include_adult=false";
                break;
            case "Multi":
                url = "https://api.themoviedb.org/3/search/multi?api_key=4d00ef70595e2049d0dfdcdead53e97a&language=en-US&page=" + page_num + "&query=" + searchPattern + "&include_adult=false";
                break;
            default:
                url = "";
                break;
        }
        //return url;
    }
}

function defaultView() {
    document.getElementById('separator').style.marginBottom = "20%";
    //document.getElementById('displaySeries').style.display = "none";
    $("#displaySeries").hide();
}

function prevButton() {
    if (page_num > 2) {
        index_id_ref = 0;
        if (page_num <= 4) {
            page_num = 1;
        } else {
            page_num -= 4;
        }
        buttonClicked = true;
        apiFunction();
        $('html, body').animate({ scrollTop: 0 }, 'medium');

        buttonClicked = false;
        return false;
    }
    else {
        page_num = 1;
        defaultView();
        return false;
    }
}

function nextButton() {
    //set MAX?
    if (page_num <= 999) {
        index_id_ref = 0;
        buttonClicked = true;
        apiFunction();
        $('html, body').animate({ scrollTop: 0 }, 'medium');

        buttonClicked = false;
        return false;
    }
}