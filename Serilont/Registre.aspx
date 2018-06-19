<%@ Page Title="Register to Serilont" Language="C#" AutoEventWireup="true" CodeFile="Registre.aspx.cs" Inherits="Registre" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>    
    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="js/background.js"></script>

    <link rel="stylesheet" type="text/css" href="Content/bootstrap.darkly.min.css" />
    <link rel="stylesheet" type="text/css" href="Content/login_and_register.css" />

    <link runat="server" rel="shortcut icon" href="../imatges/favicon.ico" type="image/x-icon"/>
    <link runat="server" rel="icon" href="../imatges/favicon.ico" type="image/ico"/>
</head>
<body>

    <form id="form1" runat="server">
        <asp:Panel ID="pnlRegister" runat="server">
            <div class="regContent modal-content">
                <div class="modal-header" style="margin-bottom: 20px; text-align: center;">
                    <h4 class="modal-title">Sign up</h4>
                </div>

                <%--EMAIL--%>
                <div class="input-group col-xs-8 col-xs-offset-2" runat="server">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-send"></i></span>
                    <asp:TextBox ID="TextBoxEmail" runat="server" placeholder="Email *" CssClass="form-control input"></asp:TextBox>
                </div>
                <div class="col-xs-8 col-xs-offset-2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="ERROR: Email field can't be empty." CssClass="labelsError"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="ERROR: This is not an email."  SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="labelsError"></asp:RegularExpressionValidator>
                </div>

                <%--USUARI--%>
                <div class="input-group col-xs-8 col-xs-offset-2" runat="server">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <asp:TextBox ID="TextBoxNomUsuari" runat="server" placeholder="Username *" CssClass="form-control input"></asp:TextBox>
                </div>
                <div class="col-xs-8 col-xs-offset-2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorNomUsuari" runat="server" ErrorMessage="ERROR: Username field can't be empty." ControlToValidate="TextBoxNomUsuari" CssClass="labelsError"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorUsuari" runat="server" ControlToValidate="TextBoxNomUsuari" ErrorMessage="ERROR: Invalid username." SetFocusOnError="False" ValidationExpression="^[a-zA-Z\d]{4,9}$" CssClass="labelsError"></asp:RegularExpressionValidator>
                </div>

                <%--PWD--%>
                <div class="input-group col-xs-8 col-xs-offset-2" runat="server">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <asp:TextBox ID="TextBoxContrasenya" runat="server" TextMode="Password" placeholder="Password *" CssClass="form-control input"></asp:TextBox>   
                </div>
                <div class="col-xs-8 col-xs-offset-2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorContrasenya" runat="server" ErrorMessage="ERROR: Password field can't be empty." ControlToValidate="TextBoxContrasenya" CssClass="labelsError"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorContrasenya" runat="server" ControlToValidate="TextBoxContrasenya" ErrorMessage="ERROR: Invalid password." SetFocusOnError="False" ValidationExpression="(?=^.{6,255}$)((?=.*\d)(?=.*[A-Z])(?=.*[a-z])|(?=.*\d)(?=.*[^A-Za-z0-9])(?=.*[a-z])|(?=.*[^A-Za-z0-9])(?=.*[A-Z])(?=.*[a-z])|(?=.*\d)(?=.*[A-Z])(?=.*[^A-Za-z0-9]))^.*" CssClass="labelsError"></asp:RegularExpressionValidator>
                </div>
                <div class="input-group col-xs-8 col-xs-offset-2" runat="server">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <asp:TextBox ID="TextBoxConfirmarContrasenya" runat="server" TextMode="Password" placeholder="Confim Password *" CssClass="form-control input"></asp:TextBox>
                </div>
                <div class="col-xs-8 col-xs-offset-2">
                    <asp:CompareValidator ID="CompareValidatorContrasenya" runat="server" ControlToCompare="TextBoxContrasenya" ControlToValidate="TextBoxConfirmarContrasenya" ErrorMessage="ERROR: Password fields must be the same." CssClass="labelsError"></asp:CompareValidator>
                </div>

                <%--DATA--%>
                <div class="input-group col-xs-8 col-xs-offset-2" runat="server">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                    <asp:TextBox ID="TextBoxData" runat="server" placeholder="Date of birth" CssClass="form-control input"></asp:TextBox>
                </div>
                <div class="col-xs-8 col-xs-offset-2">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorDate" runat="server" CssClass="labelsError" SetFocusOnError="True" ForeColor="Red"
                    ControlToValidate="TextBoxData" ValidationGroup="check" ErrorMessage="ERROR: Date format in DD/MM/YYYY"
                    ValidationExpression="^(((((0[1-9])|(1\d)|(2[0-8]))\/((0[1-9])|(1[0-2])))|((31\/((0[13578])|(1[02])))|((29|30)\/((0[1,3-9])|(1[0-2])))))\/((20[0-9][0-9])|(19[0-9][0-9])))|((29\/02\/(19|20)(([02468][048])|([13579][26]))))$"><br /></asp:RegularExpressionValidator>
                </div>

                <%--ETIQUETES I BOTONS--%>
                <asp:Label ID="LabelAsterisc" runat="server" Text="(Fields with * are required)" CssClass="col-xs-offset-2"></asp:Label><br />
                <asp:Label ID="LabelError" runat="server" CssClass="col-xs-offset-2" Visible="false"></asp:Label>
                <div class="input-group col-xs-8 col-xs-offset-2" runat="server">
                    <hr class="featurette-divider" />
                    <asp:Button ID="ButtonRegistre" runat="server" CssClass="btn btn-default" Text="Sign Up" OnClick="ButtonRegistre_Click" />
                    <asp:Button ID="ButtonLogin" runat="server" Text="Sign In" CssClass="btn btn-primary" OnClick="ButtonLogin_Click" CausesValidation="false"/>
                </div>
            </div>
        </asp:Panel>
    </form>

    <div class="bkground" runat="server">
        <img border="0" alt="Serilont" src="imatges/logo.png" class="logo" width="50" height="50">
    </div>
</body>
</html>
