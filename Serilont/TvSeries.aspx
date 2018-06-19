<%@ Page Title="TV Series" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TvSeries.aspx.cs" Inherits="TvSeries" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="Content/tvseries.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContingut" Runat="Server">

    <%--FILTRES CERCA--%>
    <asp:Panel ID="PanelSeries" runat="server" CssClass="primerPanel pageTvSeries">
        <ef:EntityDataSource ID="EntityDataSourceSeries" runat="server" ConnectionString="name=serilontEntities" DefaultContainerName="serilontEntities" EntitySetName="Series"
            Where="it.score>0"></ef:EntityDataSource>

        <div id="divSearch" class="row">
            <div class="col-md-2" style="padding-bottom: 20px;">
                <asp:DropDownList ID="DropDownListSeries" runat="server" AutoPostBack="True" DataSourceID="EntityDataSourceSeries" DataTextField="name" DataValueField="id" Height="37px" CssClass="form-control" ViewStateMode="Enabled" AppendDataBoundItems="True" OnSelectedIndexChanged="DropDownListSeries_Changed">
                    <asp:ListItem Selected="True" Value="" Text="&nbsp;">Series list</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="col-md-1"></div>

            <div class="col-md-2">
                <asp:TextBox ID="TextBoxSeries" CssClass="form-control" placeholder="Search (Series)" runat="server"></asp:TextBox>
            </div>
            <div class="col-xs-1">
                <asp:RadioButtonList ID="RadioButtonListSearch" runat="server" CssClass="custom-control custom-radio" style="margin-bottom:20px;">
                    <asp:ListItem Selected="True">Single</asp:ListItem>
                    <asp:ListItem>Multple</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="col-md-1">
                <asp:Button ID="ButtonSearch" CssClass="btn btn-default" runat="server" Text="Search Serie" OnClick="ButtonSearch_Click" />
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-1">
                    <asp:DropDownList ID="DropDownListScore" runat="server" placeholder="Score" CssClass="form-control">
                        <asp:ListItem Value="" Text="&nbsp;" Selected="True">Score</asp:ListItem>
                        <asp:ListItem Value="1"></asp:ListItem>
                        <asp:ListItem Value="2"></asp:ListItem>
                        <asp:ListItem Value="3"></asp:ListItem>
                        <asp:ListItem Value="4"></asp:ListItem>
                        <asp:ListItem Value="5"></asp:ListItem>
                    </asp:DropDownList>
            </div>
            <div class="col-md-1">
                <asp:RadioButtonList ID="RadioButtonListScore" runat="server" CssClass="custom-control custom-radio">
                    <asp:ListItem>More than</asp:ListItem>
                    <asp:ListItem Selected="True">Equal than</asp:ListItem>
                    <asp:ListItem>Less than</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="col-md-1">
                <asp:Button ID="ButtonScore" CssClass="btn btn-default" runat="server" Text="Search by score" OnClick="ButtonScore_Click"/>
            </div>
        </div>

        <hr id="separator" class="featurette-divider" style="margin-bottom: 30%;"/>

        <%--SERIES--%>
        <div id="displaySerie" class="row" style="display: none;">
            <div class="panel panel-primary">
                <div class="panel-body">

                    <div class="col-md-2">
                        <asp:Image ID="ImageSerie" runat="server" ImageUrl="~/imatges/series/default.png" />
                    </div>
                    <div class="col-md-10 text-center">
                        <asp:Panel ID="PanelSerie" runat="server">
                            <ul class="nav nav-tabs">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#desc">Description</a>
                                </li>
                                <li class="nav-item"></li>
                                <li class="nav-item">
                                    <asp:LinkButton ID="FollowButton" runat="server" CssClass="btn btn-primary" OnClick="FollowButton_Click"></asp:LinkButton>
                                </li>
                            </ul>
                            <div id="myTabContent" class="tab-content">
                                <asp:Label ID="LabelNomSerie" runat="server" CssClass="h1"></asp:Label>
                                <div class="tab-pane fade active in" id="desc">
                                    <br />
                                    <br />
                                    <asp:Label ID="LabelPlot" runat="server" Text="" Style="text-align: left;"></asp:Label>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 stars">
                        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel" runat="server">
                            <ContentTemplate>
                                <div class="rating-star-block" runat="server">
                                    <asp:Rating ID="rating" runat="server"
                                        BehaviorID="rating"
                                        MaxRating="5" 
                                        StarCssClass="star"
                                        FilledStarCssClass="filled"
                                        EmptyStarCssClass="outline"
                                        WaitingStarCssClass="waiting"
                                        OnChanged="rating_Changed">
                                    </asp:Rating>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:Label ID="LabelRating" runat="server" Text="" CssClass="labelRating"></asp:Label>

                        <asp:Button ID="btnRating" runat="server" Text="Rate" OnClick="btn_rating_click" 
                        CssClass="btn btn-primary btn-sm" UseSubmitBehavior="False"/>

                        <asp:Label ID="LabelRatingUser" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>