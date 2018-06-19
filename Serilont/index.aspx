<%@ Page Title="Welcome to Serilont" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../Content/stars.css"/>
    <script type="text/javascript" src="js/carousel.js"></script>
    <script type="text/javascript" src="js/audio.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContingut" runat="server">
        
        <asp:Panel ID="PanelIndex" runat="server" CssClass="primerPanel pageIndex">
            <div class="container-fluid">
	        <div class="row">
		        <div class="col-md-12" runat="server">
			        <div class="carousel slide" id="carousel-422792">
				        <ol class="carousel-indicators">
					        <li data-slide-to="0" data-target="#carousel-422792" class="active">
					        </li>
					        <li data-slide-to="1" data-target="#carousel-422792">
					        </li>
					        <li data-slide-to="2" data-target="#carousel-422792">
					        </li>
				        </ol>
				        <div id="carousel" class="carousel-inner indexCarousel">
					        <div class="item active" runat="server">
						        <img alt="Carousel Bootstrap First" src="imatges/carousel/got.jpg"/>
						        <div class="carousel-caption">
							        <h4>
								        Game of thrones
							        </h4>
							        <p>
								        In the mythical continent of Westeros, several powerful families fight for control of the Seven Kingdoms. As conflict erupts in the kingdoms of men, an ancient enemy rises once again to threaten them all. Meanwhile, the last heirs of a recently usurped dynasty plot to take back their homeland from across the Narrow Sea.
							        </p>
						        </div>
					        </div>
					        <div class="item" runat="server">
						        <img alt="Carousel Bootstrap Second" src="imatges/carousel/westworld.jpg"/>
						        <div class="carousel-caption">
							        <h4>
								        Westworld
							        </h4>
							        <p>
								        Set at the intersection of the near future and the reimagined past, explore a world in which every human appetite, no matter how noble or depraved, can be indulged without consequence.
							        </p>
						        </div>
					        </div>
					        <div class="item" runat="server">
						        <img alt="Carousel Bootstrap Third" src="imatges/carousel/peaky.jpg"/>
						        <div class="carousel-caption">
							        <h4>
								        Peaky Bliders
							        </h4>
							        <p>
								        A gangster family epic set in 1919 Birmingham, England and centered on a gang who sew razor blades in the peaks of their caps, and their fierce boss Tommy Shelby, who means to move up in the world.
							        </p>
						        </div>
					        </div>
				        </div> 
                        <a class="left carousel-control" href="#carousel-422792" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-422792" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			        </div>
		        </div>
	        </div>
        </div>

        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <hr class="my-4">
                <div class="jumbotron">
                    <h1 style="text-align:center">Welcome to Serilont!</h1><br />
                    <p class="lead" style="text-align:center">In Serilont Website you can view the latest tv series and manage them as you want. You are able to check a tv serie as 
                        followed, you can rate tv series and even search an specific one in an extended API that provides TMDb. Furthermore you can interact with your own user 
                        profile managing it as you want.</p>
                    <div class="row">
                        <div class="col-xs-2 col-center-block">
                            <input class="btn btn-info btnText" type ="button" onclick="PlayText()" value="Play Text"/>
                        </div>
                    </div>
                    <div class="row">
                        <div id="divAudio" class="col-xs-2 col-center-block"></div>
                    </div>
                </div>
            </div>
        </div>


        <div class="panel panel-default">
          <div class="panel-body">
            
              <div id="rowSeries" class="row">
            <div class="col-md-4">
                <div class="thumbnail">
					<asp:Image ID="ImageSerie" runat="server" ImageUrl="~/imatges/series/default.png"/>
					<div class="caption">
						<asp:Label ID="LabelTitle" runat="server" Text=""></asp:Label>
						<table class="table table-striped table-hover table-bordered txtJustified" >
							<tbody>
								<tr>
									<td class="plot">
                                        <asp:Label ID="LabelPlot" runat="server" Text=""></asp:Label>
									</td>																			
								</tr>
								<tr>
									<td>
                                        <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
                                        <asp:UpdatePanel ID="UpdatePanel" runat="server" style="margin-left:38%">
                                            <ContentTemplate>
                                                <div class="rating-star-block">
                                                    <ajaxToolkit:Rating ID="rating" runat="server"
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
            <div class="col-md-4">
                <div class="thumbnail">
					<asp:Image ID="ImageSerie1" runat="server" ImageUrl="~/imatges/series/default.png"/>
					<div class="caption">
						<asp:Label ID="LabelTitle1" runat="server" Text=""></asp:Label>
						<table class="table table-striped table-hover table-bordered txtJustified" >
							<tbody>
								<tr>
									<td class="plot">
                                        <asp:Label ID="LabelPlot1" runat="server" Text=""></asp:Label>
									</td>																			
								</tr>
								<tr>
									<td>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" style="margin-left:38%">
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
            <div class="col-md-4">
                <div class="thumbnail">
					<asp:Image ID="ImageSerie2" runat="server" ImageUrl="~/imatges/series/default.png"/>
					<div class="caption">
						<asp:Label ID="LabelTitle2" runat="server" Text=""></asp:Label>
						<table class="table table-striped table-hover table-bordered txtJustified" >
							<tbody>
								<tr>
									<td class="plot">
                                        <asp:Label ID="LabelPlot2" runat="server" Text=""></asp:Label>
									</td>																			
								</tr>
								<tr>
									<td>
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" style="margin-left:38%">
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

          </div>
        </div>
        
    </asp:Panel>
</asp:Content>

