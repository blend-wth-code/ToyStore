<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Group8_FinalProject.Cart" %>
<%@ MasterType VirtualPath="~/Site1.Master" %>

<asp:Content ID="styleContent" ContentPlaceHolderID="headPlaceholder" runat="server">
    <link href="cartStyle.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 marg">
                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:ListBox ID="lstCart" runat="server" CssClass="form-control"></asp:ListBox>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 marg">
                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Button ID="btnRemove" runat="server" Text="Remove Item" OnClick="btnRemoveItem" CssClass="btn btn-primary" />
                    </div>
                    <div class="col-sm-12">
                        <asp:Button ID="btnEmpty" runat="server" Text="Empty Cart" OnClick="btnClearCart" CssClass="btn btn-primary" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group marg">
                <div class="col-sm-12">
                    <asp:Button ID="btnContinue" runat="server" OnClick="btnContinueShopping_Click" Text="Continue Shopping" CssClass="btn btn-primary" />
                    &nbsp; &nbsp;
                    <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" OnClick="btnCheckOut_Click" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="ImageContent" ContentPlaceHolderID="ImagePlaceholder" runat="server">
    <div class="imgContainer">
        <img id="imgCart" src="./Images/cart.jpg" />
    </div>
</asp:Content>

