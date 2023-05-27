<%@ Page Title="Toys" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Toys.aspx.cs" Inherits="Group8_FinalProject.Toys"  MaintainScrollPositionOnPostback="true"%>
<%@ Import Namespace="System.Globalization" %>
<%@ MasterType VirtualPath="~/Site1.Master" %>

<asp:Content ID="styleContent" ContentPlaceHolderID="headPlaceholder" runat="server">
      <link href="toyStyle.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="container">
       <h3 class="greeting">Hi <%= userName %>, nice to see you! </h3>
       <div class="dropdownSection form-group row">
            <div class="col-sm-1">
                <label style="font-size:22px" for="ddlToy">Toy: </label>
            </div>
            <div class="col-sm-3">
                <asp:DropDownList ID="ddlToy" runat="server" CssClass="form-control" AutoPostBack="True" DataTextField="ToyName" DataValueField="Id" DataSourceID="SqlDataSourceToy"></asp:DropDownList>
            </div>                
        </div>

    
    <div class="row">
         <div class="toyInfoSection col-sm-4">
             <h4>
                 <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
             </h4>
            <br /><asp:Label ID="lblDesc" runat="server" Text="Description"></asp:Label>
            <br /><br /><asp:Label ID="lblManufacturedBy" runat="server" Text="ManufacturedBy"></asp:Label>
            <br /><br /><asp:Label ID="lblPrice" runat="server" Text="Price"></asp:Label>
         </div>
         <div class="col-sm-4 imageSection">
             <asp:Image runat="server" ID="imgToy" width="280px" height="240px" border="1px solid black"/>
         </div>
    </div>

    <div class="row quantitySection form-group" >
        <div class="col-sm-1">
            <label style="font-size:22px" for="txtQuantity">Quantity: </label>
        </div>
        <div class="col-sm-3">
            <asp:TextBox type="number" ID="txtQuantity" runat="server" CssClass="form-control" ></asp:TextBox>
        </div>  

        <div class="col-sm-4">
            <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtQuantity" ErrorMessage="Quantity is required"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="rvQuantity" runat="server" CssClass="text-danger" ControlToValidate="txtQuantity" MinimumValue="1" MaximumValue="10" Type="Integer" ErrorMessage="Quantity must be between 1 and 10" />
        </div> 
    </div>

    <div class="buttonSection">
        <div>
            <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" class="btn btn-primary" OnClick="btnAdd_Click" />
            &nbsp; &nbsp;
            <asp:Button ID="btnCart" runat="server" Text="Go to Cart" PostBackUrl="~/Cart.aspx" class="btn btn-primary" CausesValidation="false" />
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSourceToy" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Toys] ORDER BY [ToyName]"></asp:SqlDataSource>
</div>
</asp:Content>

