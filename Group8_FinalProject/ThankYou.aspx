<%@ Page Title="Thank You" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ThankYou.aspx.cs" Inherits="Group8_FinalProject.ThankYou" %>

<%@ MasterType VirtualPath="~/Site1.Master" %>
<asp:Content ID="styleContent" ContentPlaceHolderID="headPlaceholder" runat="server">
    <link href="thankYouStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="m-5">
        <h1>Thank you for shopping with us!</h1>
        <h2>Your order is being processed!!</h2>
    </div>
</asp:Content>
