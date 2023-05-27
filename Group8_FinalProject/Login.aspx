<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Group8_FinalProject.Login" %>
<%@ MasterType VirtualPath="~/Site1.Master" %>

<asp:Content ID="styleContent" ContentPlaceHolderID="headPlaceholder" runat="server">
    <link href="loginStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="container">
        <div>
            <br /><br />
            <asp:ValidationSummary ID="ValidationSection" runat="server" CssClass="text-danger summary" HeaderText="Please correct these entries:" />
            <br />
            <h2>Enter your credentials:</h2>
            <br />

            <div class="form-group row">
                <label class="control-label col-lg-2">User Name:</label>
                <div class="col-lg-2">
                    <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-lg-2">
                    <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="User Name" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtUserName">User Name is required </asp:RequiredFieldValidator>
                </div>
            </div><br />

            <div class="form-group row">
                <label class="control-label col-lg-2">Email:</label>
                <div class="col-lg-2">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-lg-3">
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email address" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtEmail">Email is required </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Email address" CssClass="text-danger" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail">Must be a valid email address </asp:RegularExpressionValidator>
                </div>
            </div><br />

            <div class="form-group">
                <div class="col-sm-12">
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-primary" OnClick="btnCancel_Click" CausesValidation="False" />
                    &nbsp; &nbsp;
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
                </div>
            </div><br /><br />
        </div>
    </div>
</asp:Content>

