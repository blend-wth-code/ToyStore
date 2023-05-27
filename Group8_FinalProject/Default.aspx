<%@ Page Title="Home - Noddy's Toy Store" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Group8_FinalProject.Default" %>

<%@ MasterType VirtualPath="~/Site1.Master" %>
<asp:Content ID="styleContent" ContentPlaceHolderID="headPlaceholder" runat="server">
    <link href="headStyle.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="mainContent" ContentPlaceHolderID="ImagePlaceholder" runat="server">
    <div class="w-100 p-10 m-auto">
        <img src="Images/toyStore.png" alt="Toy Store" id="banner" class="d-inline-block vh-50 w-100 object-fit-cover object-position-bottom"/>
    </div>
</asp:Content>

