 <%@ Page Title="Most Populars TV Series" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Mostpopulars.aspx.cs" Inherits="News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.darkly.css" />
    <link rel="stylesheet" type="text/css" href="Content/tvsearch.css" />
    <script type='text/javascript' src="js/tmdb_mostpopulars.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContingut" Runat="Server">

    <ef:EntityDataSource ID="EntityDataSourceGenres" runat="server" ConnectionString="name=serilontEntities" DefaultContainerName="serilontEntities" EntitySetName="Generes">
    </ef:EntityDataSource>

    <div id="divFilters" class="row primerPanel">
        <div class="col-md-3" style="padding-bottom: 20px;">
        </div>
        <div class="col-md-2">
            <asp:DropDownList ID="DropDownListGenres" runat="server" placeholder="Genres" CssClass="form-control" DataSourceID="EntityDataSourceGenres" 
                DataTextField="name" DataValueField="id" AppendDataBoundItems="True" onchange="applyFilters()">
                <asp:ListItem Value="" Text="&nbsp;" Selected="True">Genres</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-md-2">
        </div>
        <div class="col-md-2">
            <asp:DropDownList ID="DropDownListYear" runat="server" placeholder="Year of release" CssClass="form-control" AppendDataBoundItems="True"
                onchange="applyFilters()">
                <asp:ListItem Value="" Text="&nbsp;" Selected="True">Year of release</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-md-2">
            <asp:RadioButtonList ID="RadioButtonListYear" runat="server" CssClass="custom-control custom-radio">
                <asp:ListItem>More than</asp:ListItem>
                <asp:ListItem Selected="True">Equal than</asp:ListItem>
                <asp:ListItem>Less than</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>

    <hr id="separator" class="featurette-divider"/>

    <div class="container-fluid content primerPanel">
        <div class="row centered">
            <div id="0" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
            <div id="1" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
        </div>

        <div class="row centered">
            <div id="2" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
            <div id="3" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row centered">
            <div id="4" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
            <div id="5" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row centered">
            <div id="6" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
            <div id="7" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row centered">
            <div id="8" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
            <div id="9" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row centered">
            <div id="10" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
            <div id="11" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row centered">
            <div id="12" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
            <div id="13" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row centered">
            <div id="14" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
            <div id="15" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row centered">
            <div id="16" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
            <div id="17" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row centered">
            <div id="18" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
            <div id="19" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-5">
                <button id="btnPrev" type="button" class="button" style="float: right; text-align: left;" onClick="return prevButton();"><span aria-hidden="true" class="glyphicon glyphicon-step-backward"></span> Prev</button>
            </div>
            <div class="col-sm-2"><p id="page_num" style="text-align: center; margin-top: 20px;"></p></div>
            <div class="col-sm-5">
                <button id="btnNext" type="button" class="button" style="float: left; text-align: right;" onClick="return nextButton();">Next <span aria-hidden="true" class="glyphicon glyphicon-step-forward"></span></button>
            </div>
        </div>
    </div>

</asp:Content>

