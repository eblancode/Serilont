<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Memoria_pdf_view.aspx.cs" Inherits="Memoria_pdf_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContingut" Runat="Server">
    <%--https://goo.gl/4xEJ5Q--%>
    <div style="vertical-align:top" align="center" runat="server" class="primerPanel"> 
        <iframe src="Content/files/Memoria_Serilont.pdf#toolbar=0&navpanes=0&statusbar=0" width="850" height="1080" ></iframe>
    </div>
</asp:Content>

