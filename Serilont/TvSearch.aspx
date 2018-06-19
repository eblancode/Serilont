<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TvSearch.aspx.cs" Inherits="TvSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.darkly.css" />
    <link rel="stylesheet" type="text/css" href="Content/tvsearch.css" />
    <script type="text/javascript" src="js/tmdb_tvsearch.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContingut" runat="Server"> 
 
    <asp:Panel ID="PanelLogin" runat="server" CssClass="primerPanel">
        <ef:EntityDataSource ID="EntityDataSourceGenres" runat="server" ConnectionString="name=serilontEntities" DefaultContainerName="serilontEntities" EntitySetName="Generes">
        </ef:EntityDataSource>
        <div class="row centered menuRow">
            <div class="col-sm-2">
                <asp:DropDownList ID="DropDownListSearch" runat="server" CssClass="form-control" OnSelectedIndexChanged="DropDownListSearch_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Text="TVShows" Selected="True">TVShows</asp:ListItem>
                    <asp:ListItem Text="Multi">Movies</asp:ListItem>
                    <asp:ListItem Text="People">People</asp:ListItem>
                    <asp:ListItem Text="Multi">Multi</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        
        <div id="colFiltres" class="row centered menuRow">
            <div id="divYear" class="col-sm-3 my-1">
                <asp:DropDownList ID="DropDownListYear" runat="server" CssClass="form-control" AppendDataBoundItems="True">
                    <asp:ListItem Value="" Text="&nbsp;" Selected="True">Year of release</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
            
        <div class="row centered menuRow">
            <div class="col-sm-3 my-1" style="display: inline-block;">
                <asp:TextBox ID="TextBoxSearch" runat="server" CssClass="form-control" placeholder="Words search (titles, keywords ...)"></asp:TextBox>
            </div>
        </div>

        <div class="row centered">
            <button id="ButtonSearch" type="button" class="button" onClick="return apiFunction();">Search</button>
        </div>
        <hr id="separator" class="featurette-divider" style="margin-bottom: 20%" />
    </asp:Panel>

    <div id="displaySeries" class="container-fluid" hidden>
        <div class="row centered">
            <div id="0" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <ul class="list-group list-group-flush"></ul>
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
                    <ul class="list-group list-group-flush"></ul>
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
                    <ul class="list-group list-group-flush"></ul>
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
                    <ul class="list-group list-group-flush"></ul>
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
                    <ul class="list-group list-group-flush"></ul>
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
                    <ul class="list-group list-group-flush"></ul>
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
                    <ul class="list-group list-group-flush"></ul>
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
                    <ul class="list-group list-group-flush"></ul>
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
                    <ul class="list-group list-group-flush"></ul>
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
                    <ul class="list-group list-group-flush"></ul>
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
                    <ul class="list-group list-group-flush"></ul>
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
                    <ul class="list-group list-group-flush"></ul>
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
                    <ul class="list-group list-group-flush"></ul>
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
                    <ul class="list-group list-group-flush"></ul>
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
                    <ul class="list-group list-group-flush"></ul>
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
                    <ul class="list-group list-group-flush"></ul>
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
                    <ul class="list-group list-group-flush"></ul>
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
                    <ul class="list-group list-group-flush"></ul>
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
                    <ul class="list-group list-group-flush"></ul>
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
                    <ul class="list-group list-group-flush"></ul>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row centered">
            <div id="20" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <ul class="list-group list-group-flush"></ul>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
            <div id="21" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <ul class="list-group list-group-flush"></ul>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row centered">
            <div id="22" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <ul class="list-group list-group-flush"></ul>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
            <div id="23" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <ul class="list-group list-group-flush"></ul>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row centered">
            <div id="24" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <ul class="list-group list-group-flush"></ul>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
            <div id="25" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <ul class="list-group list-group-flush"></ul>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row centered">
            <div id="26" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <ul class="list-group list-group-flush"></ul>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
            <div id="27" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <ul class="list-group list-group-flush"></ul>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row centered">
            <div id="28" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <ul class="list-group list-group-flush"></ul>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
            <div id="29" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <ul class="list-group list-group-flush"></ul>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row centered">
            <div id="30" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <ul class="list-group list-group-flush"></ul>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
            <div id="31" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <ul class="list-group list-group-flush"></ul>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row centered">
            <div id="32" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <ul class="list-group list-group-flush"></ul>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
            <div id="33" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <ul class="list-group list-group-flush"></ul>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row centered">
            <div id="34" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <ul class="list-group list-group-flush"></ul>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
            <div id="35" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <ul class="list-group list-group-flush"></ul>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row centered">
            <div id="36" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <ul class="list-group list-group-flush"></ul>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
            <div id="37" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <ul class="list-group list-group-flush"></ul>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row centered">
            <div id="38" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <ul class="list-group list-group-flush"></ul>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
            <div id="39" class="col-md-5">
                <div class="card mb-3">
                    <h3 class="card-header"></h3>
                    <img style="width: 300px; height: 450px; display: block; margin: 0 auto; margin-top: 20px;">
                    <div class="card-body">
                        <p class="card-text"></p>
                    </div>
                    <ul class="list-group list-group-flush"></ul>
                    <div class="card-footer">
                        <h5 class="card-title"></h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-5">
                <button id="btnPrev" type="button" class="button" style="float: right;" onClick="return prevButton();"><span aria-hidden="true" class="glyphicon glyphicon-step-backward" style="text-align: left;"></span> Prev</button>
            </div>
            <div class="col-sm-2"><p id="page_num" style="text-align: center; margin-top: 20px;"></p></div>
            <div class="col-sm-5">
                <button id="btnNext" type="button" class="button" style="float: left;" onClick="return nextButton();">Next <span aria-hidden="true" class="glyphicon glyphicon-step-forward" style="text-align: right;"></span></button>
            </div>
        </div>
    </div>
</asp:Content>

