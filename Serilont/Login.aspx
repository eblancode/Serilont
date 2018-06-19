<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" Title="Login to Serilont" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.darkly.min.css" />
    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="js/background.js"></script>
    <link rel="stylesheet" type="text/css" href="Content/login_and_register.css" />

    <link runat="server" rel="shortcut icon" href="../imatges/favicon.ico" type="image/x-icon"/>
    <link runat="server" rel="icon" href="../imatges/favicon.ico" type="image/ico"/>
</head>
<body>
     <div class="bkground"> <img border="0" alt="Serilont" src="imatges/logo.png" class="logo" width="50" height="50"> </div>

     <form id="form1" runat="server">
           <asp:Panel ID="pnlModal" runat="server" 
           role="dialog" 
           CssClass="modal fade" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog">
                <div class="modal-content" runat="server">
                    <div class="modal-header">
                        <h4 class="modal-title">Login</h4>
                    </div>
                    <div class="modal-body">
                        <div class="input-group col-xs-8 col-xs-offset-2" runat="server">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <asp:TextBox ID="TextBoxNomUsuari" runat="server" placeholder="Username" CssClass="form-control input"></asp:TextBox>
                        </div>
                        <br />
                        <div class="input-group col-xs-8 col-xs-offset-2" runat="server">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <asp:TextBox ID="TextBoxContrasenya" runat="server" TextMode="Password" placeholder="Password" CssClass="form-control input"></asp:TextBox>
                        </div>

                        <br />
                        <div id="alertError" class="alert alert-dismissible alert-danger" style="display: none; width: 100%">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <asp:Label ID="LabelError" runat="server" ForeColor="White"></asp:Label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="ButtonEntrar" runat="server" Text="Sign In" CssClass="btn btn-default" OnClick="ButtonEntrar_Click"/>
                        <asp:Button ID="ButtonRegistre" runat="server" Text="Sign Up" CssClass="btn btn-primary" OnClick="ButtonRegistre_Click" CausesValidation="false"/>
                    </div>
                </div>
             </div>
         </asp:Panel>
      </form>
    
</body>
</html>
