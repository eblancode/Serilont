<%@ Page Title="Actors TV Series" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TvActors.aspx.cs" Inherits="TvActors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="server">
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.darkly.css" />
    <link rel="stylesheet" type="text/css" href="Content/tvsearch.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContingut" Runat="server">
    <script type="text/javascript" src="js/tmdb_people.js"></script>

    <div class="container-fluid primerPanel">
            <div class="row centered">
                <div id="0" class="col-md-3">
                    <div class="card mb-3">
                        <h3 class="card-header"></h3>
                        <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                        <ul class="list-group list-group-flush">
                        </ul>
                        <div class="card-footer">
                            <h5 class="card-title" style="font-size: 1.5rem"></h5>
                        </div>
                    </div>
                </div>
                <div id="1" class="col-md-3">
                    <div class="card mb-3">
                        <h3 class="card-header"></h3>
                        <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                        <ul class="list-group list-group-flush">
                        </ul>
                        <div class="card-footer">
                            <h5 class="card-title" style="font-size: 1.5rem"></h5>
                        </div>
                    </div>
                </div>
                <div id="2" class="col-md-3">
                    <div class="card mb-3">
                        <h3 class="card-header"></h3>
                        <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                        <ul class="list-group list-group-flush">
                        </ul>
                        <div class="card-footer">
                            <h5 class="card-title" style="font-size: 1.5rem"></h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row centered">
                <div id="3" class="col-md-3">
                    <div class="card mb-3">
                        <h3 class="card-header"></h3>
                        <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                        <ul class="list-group list-group-flush">
                        </ul>
                        <div class="card-footer">
                            <h5 class="card-title" style="font-size: 1.5rem"></h5>
                        </div>
                    </div>
                </div>
                <div id="4" class="col-md-3">
                    <div class="card mb-3">
                        <h3 class="card-header"></h3>
                        <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                        <ul class="list-group list-group-flush">
                        </ul>
                        <div class="card-footer">
                            <h5 class="card-title" style="font-size: 1.5rem"></h5>
                        </div>
                    </div>
                </div>
                <div id="5" class="col-md-3">
                    <div class="card mb-3">
                        <h3 class="card-header"></h3>
                        <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                        <ul class="list-group list-group-flush">
                        </ul>
                        <div class="card-footer">
                            <h5 class="card-title" style="font-size: 1.5rem"></h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row centered">
                <div id="6" class="col-md-3">
                    <div class="card mb-3">
                        <h3 class="card-header"></h3>
                        <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                        <ul class="list-group list-group-flush">
                        </ul>
                        <div class="card-footer">
                            <h5 class="card-title" style="font-size: 1.5rem"></h5>
                        </div>
                    </div>
                </div>
                <div id="7" class="col-md-3">
                    <div class="card mb-3">
                        <h3 class="card-header"></h3>
                        <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                        <ul class="list-group list-group-flush">
                        </ul>
                        <div class="card-footer">
                            <h5 class="card-title" style="font-size: 1.5rem"></h5>
                        </div>
                    </div>
                </div>
                <div id="8" class="col-md-3">
                    <div class="card mb-3">
                        <h3 class="card-header"></h3>
                        <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                        <ul class="list-group list-group-flush">
                        </ul>
                        <div class="card-footer">
                            <h5 class="card-title" style="font-size: 1.5rem"></h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row centered">
                <div id="9" class="col-md-3">
                    <div class="card mb-3">
                        <h3 class="card-header"></h3>
                        <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                        <ul class="list-group list-group-flush">
                        </ul>
                        <div class="card-footer">
                            <h5 class="card-title" style="font-size: 1.5rem"></h5>
                        </div>
                    </div>
                </div>
                <div id="10" class="col-md-3">
                    <div class="card mb-3">
                        <h3 class="card-header"></h3>
                        <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                        <ul class="list-group list-group-flush">
                        </ul>
                        <div class="card-footer">
                            <h5 class="card-title" style="font-size: 1.5rem"></h5>
                        </div>
                    </div>
                </div>
                <div id="11" class="col-md-3">
                    <div class="card mb-3">
                        <h3 class="card-header"></h3>
                        <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                        <ul class="list-group list-group-flush">
                        </ul>
                        <div class="card-footer">
                            <h5 class="card-title" style="font-size: 1.5rem"></h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row centered">
                <div id="12" class="col-md-3">
                    <div class="card mb-3">
                        <h3 class="card-header"></h3>
                        <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                        <ul class="list-group list-group-flush">
                        </ul>
                        <div class="card-footer">
                            <h5 class="card-title" style="font-size: 1.5rem"></h5>
                        </div>
                    </div>
                </div>
                <div id="13" class="col-md-3">
                    <div class="card mb-3">
                        <h3 class="card-header"></h3>
                        <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                        <ul class="list-group list-group-flush">
                        </ul>
                        <div class="card-footer">
                            <h5 class="card-title" style="font-size: 1.5rem"></h5>
                        </div>
                    </div>
                </div>
                <div id="14" class="col-md-3">
                    <div class="card mb-3">
                        <h3 class="card-header"></h3>
                        <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                        <ul class="list-group list-group-flush">
                        </ul>
                        <div class="card-footer">
                            <h5 class="card-title" style="font-size: 1.5rem"></h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row centered">
                <div id="15" class="col-md-3">
                    <div class="card mb-3">
                        <h3 class="card-header"></h3>
                        <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                        <ul class="list-group list-group-flush">
                        </ul>
                        <div class="card-footer">
                            <h5 class="card-title" style="font-size: 1.5rem"></h5>
                        </div>
                    </div>
                </div>
                <div id="16" class="col-md-3">
                    <div class="card mb-3">
                        <h3 class="card-header"></h3>
                        <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                        <ul class="list-group list-group-flush">
                        </ul>
                        <div class="card-footer">
                            <h5 class="card-title" style="font-size: 1.5rem"></h5>
                        </div>
                    </div>
                </div>
                <div id="17" class="col-md-3">
                    <div class="card mb-3">
                        <h3 class="card-header"></h3>
                        <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                        <ul class="list-group list-group-flush">
                        </ul>
                        <div class="card-footer">
                            <h5 class="card-title" style="font-size: 1.5rem"></h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-5">
                    <button id="btnPrev" type="button" class="button" style="float: right;" onClick="return prevButton();"><span aria-hidden="true" class="glyphicon glyphicon-step-backward" style="text-align: left;"></span> Back</button>
                </div>
                <div class="col-sm-2"><p id="page_num" style="text-align: center; margin-top: 20px;"></p></div>
                <div class="col-sm-5">
                    <button id="btnNext" type="button" class="button" style="float: left;" onClick="return nextButton();">Next <span aria-hidden="true" class="glyphicon glyphicon-step-forward" style="text-align: right;"></span></button>
                </div>
            </div>
        </div>
</asp:Content>