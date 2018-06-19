<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Cv_pdf_view.aspx.cs" Inherits="Cv_pdf_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContingut" Runat="Server">
    <div style="vertical-align:top" align="center" runat="server" class="primerPanel"> 
        <%--<object type="application/pdf" data="<%=Request.QueryString["Content/CV_Eduard_Blanco.pdf"]%>" width="500" height="650" ></object>--%>
        <iframe src="Content/files/CV_Eduard_Blanco.pdf#toolbar=0&navpanes=0&statusbar=0" width="850" height="1080" ></iframe>
    </div>
</asp:Content>

