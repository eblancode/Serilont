<%@ Page Title="Listed TV Series" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Llistat.aspx.cs" Inherits="Llistat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="Content/tvseries.css" />
    <script> $('.navbar-fixed-top').each(function () { $(this).hide(); }); </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContingut" Runat="Server">
    
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="TvSeries.aspx">
                    <img border="0" alt="Series" src="imatges/back.png" class="logo" width="50" height="50">
                </a>
            </div>
        </div>
    </nav>

    <ef:EntityDataSource ID="EntityDataSourceSeries" runat="server" ConnectionString="name=serilontEntities" DefaultContainerName="serilontEntities" EntitySetName="Series"
    Where="it.score>0"></ef:EntityDataSource>
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>

    <asp:Panel ID="PanelContent" runat="server" CssClass="primerPanel">

    <div class="row">
        <div class="col-lg-4" id="s1" runat="server" visible="false">
            <div class="thumbnail">
                <asp:LinkButton ID="FollowButton0" runat="server" CssClass="" OnClick="FollowButton_Click" style="float: right; padding: 5px;" ToolTip="Follow">
                    <span aria-hidden="true" class="glyphicon glyphicon-eye-open"></span>
                </asp:LinkButton>
				<asp:Image ID="ImageSerie0" CssClass="serieImg" runat="server" ImageUrl="~/imatges/series/default.png"/>
				<div class="caption">
					<asp:Label ID="LabelTitle0" runat="server" Text=""></asp:Label>
                    <table class="table table-striped table-hover table-bordered txtJustified">
						<tbody>
							<tr>
								<td>
                                    <asp:Label ID="LabelPlot0" runat="server" Text=""></asp:Label>
								</td>																			
							</tr>
							<tr>
								<td>
                                    <asp:UpdatePanel ID="UpdatePanel0" runat="server" style="margin-left:35%">
                                        <ContentTemplate>
                                            <div class="rating-star-block">
                                                <ajaxToolkit:Rating ID="rating0" runat="server"
                                                    StarCssClass="star"
                                                    FilledStarCssClass="filled"
                                                    EmptyStarCssClass="outline"
                                                    WaitingStarCssClass="waiting"
                                                    MaxRating="5"
                                                    ReadOnly="True">
                                                </ajaxToolkit:Rating>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
								</td>																			
							</tr>
						</tbody>
					</table>
				</div>
			</div>
        </div>

        <div class="col-lg-4"  id="s2" runat="server" visible="false">
            <div class="thumbnail">
                <asp:LinkButton ID="FollowButton1" runat="server" OnClick="FollowButton_Click" style="float: right; padding: 5px;" ToolTip="Follow">
                    <span aria-hidden="true" class="glyphicon glyphicon-eye-open"></span>
                </asp:LinkButton>
				<asp:Image ID="ImageSerie1" CssClass="serieImg" runat="server" ImageUrl="~/imatges/series/default.png"/>
				<div class="caption">
					<asp:Label ID="LabelTitle1" runat="server" Text=""></asp:Label>
					<table class="table table-striped table-hover table-bordered txtJustified" >
						<tbody>
							<tr>
								<td>
                                    <asp:Label ID="LabelPlot1" runat="server" Text=""></asp:Label>
								</td>																			
							</tr>
							<tr>
								<td>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" style="margin-left:35%">
                                        <ContentTemplate>
                                            <div class="rating-star-block">
                                                <ajaxToolkit:Rating ID="rating1" runat="server"
                                                    StarCssClass="star"
                                                    FilledStarCssClass="filled"
                                                    EmptyStarCssClass="outline"
                                                    WaitingStarCssClass="waiting"
                                                    MaxRating="5"
                                                    ReadOnly="True"></ajaxToolkit:Rating>
                                                </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
								</td>																			
							</tr>
						</tbody>
					</table>
				</div>
			</div>
        </div>

        <div class="col-lg-4"  id="s3" runat="server" visible="false">
            <div class="thumbnail">
                <asp:LinkButton ID="FollowButton2" runat="server" OnClick="FollowButton_Click" style="float: right; padding: 5px;" ToolTip="Follow">
                    <span aria-hidden="true" class="glyphicon glyphicon-eye-open"></span>
                </asp:LinkButton>
				<asp:Image ID="ImageSerie2" CssClass="serieImg" runat="server" ImageUrl="~/imatges/series/default.png"/>
				<div class="caption">
					<asp:Label ID="LabelTitle2" runat="server" Text=""></asp:Label>
					<table class="table table-striped table-hover table-bordered txtJustified" >
						<tbody>
							<tr>
								<td>
                                    <asp:Label ID="LabelPlot2" runat="server" Text=""></asp:Label>
								</td>																			
							</tr>
							<tr>
								<td>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" style="margin-left:35%">
                                        <ContentTemplate>
                                            <div class="rating-star-block">
                                                <ajaxToolkit:Rating ID="rating2" runat="server"
                                                    StarCssClass="star"
                                                    FilledStarCssClass="filled"
                                                    EmptyStarCssClass="outline"
                                                    WaitingStarCssClass="waiting"
                                                    MaxRating="5"
                                                    ReadOnly="True"></ajaxToolkit:Rating>
                                                </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
								</td>																			
							</tr>
						</tbody>
					</table>
				</div>
			</div>
        </div>

        </div>

        <div class="row">

        <div class="col-lg-4" id="s4" runat="server" visible="false">
            <div class="thumbnail">
                <asp:LinkButton ID="FollowButton3" runat="server" OnClick="FollowButton_Click" style="float: right; padding: 5px;" ToolTip="Follow">
                    <span aria-hidden="true" class="glyphicon glyphicon-eye-open"></span>
                </asp:LinkButton>
				<asp:Image ID="ImageSerie3" CssClass="serieImg" runat="server" ImageUrl="~/imatges/series/default.png"/>
				<div class="caption">
					<asp:Label ID="LabelTitle3" runat="server" Text=""></asp:Label>
					<table class="table table-striped table-hover table-bordered txtJustified" >
						<tbody>
							<tr>
								<td>
                                    <asp:Label ID="LabelPlot3" runat="server" Text=""></asp:Label>
								</td>																			
							</tr>
							<tr>
								<td>
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" style="margin-left:35%">
                                        <ContentTemplate>
                                            <div class="rating-star-block">
                                                <ajaxToolkit:Rating ID="rating3" runat="server"
                                                    StarCssClass="star"
                                                    FilledStarCssClass="filled"
                                                    EmptyStarCssClass="outline"
                                                    WaitingStarCssClass="waiting"
                                                    MaxRating="5"
                                                    ReadOnly="True"></ajaxToolkit:Rating>
                                                </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
								</td>																			
							</tr>
						</tbody>
					</table>
				</div>
			</div>
        </div>

        <div class="col-lg-4"  id="s5" runat="server" visible="false">
            <div class="thumbnail">
                <asp:LinkButton ID="FollowButton4" runat="server" OnClick="FollowButton_Click" style="float: right; padding: 5px;" ToolTip="Follow">
                    <span aria-hidden="true" class="glyphicon glyphicon-eye-open"></span>
                </asp:LinkButton>
				<asp:Image ID="ImageSerie4" CssClass="serieImg" runat="server" ImageUrl="~/imatges/series/default.png"/>
				<div class="caption">
					<asp:Label ID="LabelTitle4" runat="server" Text=""></asp:Label>
					<table class="table table-striped table-hover table-bordered txtJustified" >
						<tbody>
							<tr>
								<td>
                                    <asp:Label ID="LabelPlot4" runat="server" Text=""></asp:Label>
								</td>																			
							</tr>
							<tr>
								<td>
                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" style="margin-left:35%">
                                        <ContentTemplate>
                                            <div class="rating-star-block">
                                                <ajaxToolkit:Rating ID="rating4" runat="server"
                                                    StarCssClass="star"
                                                    FilledStarCssClass="filled"
                                                    EmptyStarCssClass="outline"
                                                    WaitingStarCssClass="waiting"
                                                    MaxRating="5"
                                                    ReadOnly="True"></ajaxToolkit:Rating>
                                                </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
        </div>

        <div class="col-lg-4"  id="s6" runat="server" visible="false">
            <div class="thumbnail">
                <asp:LinkButton ID="FollowButton5" runat="server" OnClick="FollowButton_Click" style="float: right; padding: 5px;" ToolTip="Follow">
                    <span aria-hidden="true" class="glyphicon glyphicon-eye-open"></span>
                </asp:LinkButton>
				<asp:Image ID="ImageSerie5" CssClass="serieImg" runat="server" ImageUrl="~/imatges/series/default.png"/>
				<div class="caption">
					<asp:Label ID="LabelTitle5" runat="server" Text=""></asp:Label>
					<table class="table table-striped table-hover table-bordered txtJustified" >
						<tbody>
							<tr>
								<td>
                                    <asp:Label ID="LabelPlot5" runat="server" Text=""></asp:Label>
								</td>																			
							</tr>
							<tr>
								<td>
                                    <asp:UpdatePanel ID="UpdatePanel5" runat="server" style="margin-left:35%">
                                        <ContentTemplate>
                                            <div class="rating-star-block">
                                                <ajaxToolkit:Rating ID="rating5" runat="server"
                                                    StarCssClass="star"
                                                    FilledStarCssClass="filled"
                                                    EmptyStarCssClass="outline"
                                                    WaitingStarCssClass="waiting"
                                                    MaxRating="5"
                                                    ReadOnly="True"></ajaxToolkit:Rating>
                                                </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
								</td>																			
							</tr>
						</tbody>
					</table>
				</div>
			</div>
        </div>

    </div>

    </asp:Panel>
</asp:Content>

