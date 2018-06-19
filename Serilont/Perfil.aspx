<%@ Page Title="Profile" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Perfil.aspx.cs" Inherits="Perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="Content/perfil.css" />
    <script src="js/perfil.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContingut" runat="Server">

    <asp:Panel ID="PanelPerfil" runat="server" CssClass="primerPanel">
        <div class="row">
            <div class="col-sm-3">
                <div class="panel panel-primary panel1">
                  <div class="panel-heading">
                    <h3 class="panel-title">Profile picture</h3>
                  </div>
                  <div class="panel-body">
                        <asp:Image ID="profileImage" runat="server" ImageURL="~/imatges/users/userimage.png" Width="202px" Height="187px" style="margin-left:20%"/>
                        <br />
                        <br />
                        <asp:FileUpload ID="FileUpload" runat="server" CssClass="btn btn-primary" Font-Size="small"/>
                        <br />
                        <asp:Label ID="LabelTxt" runat="server" Text="Label"><small id="fileTxt" class="form-text text-muted">Upload your profile picture.</small></asp:Label>
                        <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="btn btn-primary boto" OnClick="btnUpload_Click"/>
                        <br />
                        <asp:TextBox ID="TextBoxURL" runat="server" CssClass="form-control input" Visible="false"></asp:TextBox>
                      <asp:Button ID="ButtonURL" runat="server" Text="Button" CssClass="btn btn-primary" Visible="false"/>
                  </div>
                </div>
            </div>

            <div class="col-xs-9">
                <div class="panel panel-primary">
                  <div class="panel-heading">
                    <h3 class="panel-title">User panel</h3>
                  </div>
                  <div class="panel-body">
                      <div class="row" style="padding-left:15px;">
                          <div id="colInfo1" class="col-xs-1">
                              <p>Username:</p><br />
                              <p>Email:</p><br />
                              <p>Birth date:</p><br />
                          </div>
                          <div id="colInfo2" class="col-xs-1">
                              <p><asp:Label ID="LabelUsernameProfile" runat="server" Text=""></asp:Label></p><br />
                              <p><asp:Label ID="LabelEmailProfile" runat="server" Text=""></asp:Label></p><br />
                              <p><asp:Label ID="LabelDataProfile" runat="server" Text=""></asp:Label></p><br /><br />
                          </div>
                          <div class="col-xs-4">
                              <p><asp:Label ID="LabelBio" runat="server" Text=""></asp:Label></p>
                          </div>
                      </div>

                      <%--Panel Missatge--%>
                      <asp:Panel ID="PanelMsg" runat="server" Visible="False">
                        <button type="button" class="close" data-dismiss="alert">x</button>
                        <asp:Label ID="LabelMensaje" runat="server" Text=""></asp:Label>
                      </asp:Panel>

                      <asp:Panel ID="PanelSeriesAdmin" runat="server" Visible="False">
                        <asp:Label ID="Label1" runat="server" Text="Display all series "></asp:Label>
                        <asp:CheckBox ID="CheckBoxSeries" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBoxSeries_CheckedChanged" />
                      </asp:Panel>

                      <%--Grid que nomes mostra series vistes o seguides per l'usuari diferenciades per un gilphyicon--%>
                      <asp:GridView ID="GridViewSeries" runat="server" CssClass="table table-striped table-hover" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" PageSize="6" 
                          DataKeyNames="id" BorderColor="#375A7F" BorderWidth="1px" 
                          OnRowDeleting="GridViewSeries_OnRowDeleting" OnSelectedIndexChanged="GridViewSeries_OnUnfollow" OnRowCancelingEdit="GridViewSeries_RowCancelingEdit" 
                          OnPageIndexChanging="GridViewSeries_PageIndexChanging" OnRowEditing="GridViewSeries_OnRowEditing" OnRowUpdating="GridViewSeries_OnRowUpdating">
                          <Columns>
                              <asp:BoundField DataField="id" ItemStyle-CssClass="hiddenCol" HeaderStyle-CssClass="hiddenCol">
                              </asp:BoundField>
                              <asp:BoundField DataField="name" HeaderText="Seriename">
                                  <ItemStyle CssClass="active" />
                              </asp:BoundField>
                              <asp:BoundField DataField="plot" HeaderText="Plot" />
                              <asp:BoundField DataField="score" HeaderText="Score" />
                              <asp:CommandField EditText="&lt;span class=&quot;glyphicon glyphicon-pencil&quot;&gt;&lt;/span&gt;" HeaderText="Edit" ShowEditButton="True" 
                                  CancelText="&lt;span class=&quot;glyphicon glyphicon-remove&quot;&gt;&lt;/span&gt;" UpdateText="&lt;span class=&quot;glyphicon glyphicon-ok&quot;&gt;&lt;/span&gt;" 
                                  HeaderStyle-Width="50" Visible="false">
                                  <ItemStyle CssClass="boto .edit" />
                              </asp:CommandField>
                              <asp:CommandField DeleteText="&lt;span class=&quot;glyphicon glyphicon-trash&quot;&gt;&lt;/span&gt;" HeaderText="Delete" ShowDeleteButton="True" Visible="false">
                                  <ItemStyle CssClass="boto .del" />
                              </asp:CommandField>
                              <asp:CommandField DeleteText="&lt;span class=&quot;glyphicon glyphicon-eye-close&quot;&gt;&lt;/span&gt;" HeaderText="Unfollow" 
                                  SelectText="&lt;span class=&quot;glyphicon glyphicon-eye-close&quot;&gt;&lt;/span&gt;" ShowSelectButton="True" >
                                  <ItemStyle CssClass="boto" />
                              </asp:CommandField>
                          </Columns>
                          <PagerStyle HorizontalAlign="Right" CssClass="GridPager" />
                      </asp:GridView>

                      <%--Grid que mostra tots els usuaris, nomes visible per usuari administrador--%>
                      <asp:GridView ID="GridViewUsers" runat="server" CssClass="table table-striped table-hover" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" PageSize="6" BorderColor="#375A7F" 
                          BorderWidth="1px" Visible="False" ToolTip="Users" OnRowDeleting="GridViewUsers_OnRowDeleting" OnPageIndexChanging="GridViewUsers_PageIndexChanging">
                          <Columns>
                             <asp:BoundField DataField="username" HeaderText="Username" >
                                <ItemStyle CssClass="active" />
                             </asp:BoundField>
                             <asp:BoundField DataField="password" HeaderText="Password">
                                 <ItemStyle CssClass="pwdFormat" />
                              </asp:BoundField>
                             <asp:BoundField DataField="email" HeaderText="Email" />
                             <asp:BoundField DataField="data_naixement" HeaderText="Birth date" DataFormatString="{0:dd/MM/yyyy}" />
                              <asp:TemplateField HeaderText="Delete">
                                  <ItemTemplate>
                                      <asp:LinkButton ID="LinkButtonDelete" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-default" Text="&lt;span class=&quot;glyphicon glyphicon-trash&quot;&gt;&lt;/span&gt;" ToolTip="Borrar Usuario"></asp:LinkButton>
                                  </ItemTemplate>
                              </asp:TemplateField>
                          </Columns>
                      </asp:GridView>

                      <asp:LinkButton ID="LinkButtonDisplayUsers" CssClass="btn btn-primary" runat="server" Visible="false" OnClick="LinkButtonDisplayUsers_Click" ToolTip="Display Users">
                          <span aria-hidden="true" class="glyphicon glyphicon-user"></span>
                      </asp:LinkButton>

                      <asp:LinkButton ID="LinkButtonLogOut" CssClass="btn btn-primary" runat="server" OnClick="LinkButtonLogOut_Click" ToolTip="Log Out">
                        <asp:Label ID="LabelLogOut" runat="server" Text=""></asp:Label><span aria-hidden="true" class="glyphicon glyphicon-log-out"></span>
                      </asp:LinkButton>
                  </div>
                </div>
            </div>
        </div>      
    </asp:Panel>
</asp:Content>