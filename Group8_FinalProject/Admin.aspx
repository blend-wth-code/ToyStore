<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Group8_FinalProject.Admin" MaintainScrollPositionOnPostback="true" %>
<%@ Import Namespace="System.Globalization" %>
<%@ MasterType VirtualPath="~/Site1.Master" %>

<asp:Content ID="styleContent" ContentPlaceHolderID="headPlaceholder" runat="server">
    <link href="adminStyle.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="container">
        <div class="form-group dropdownSection">
            <label class="p-3">Pick a Brand:</label>
            <asp:DropDownList ID="DropDownListBrand" runat="server" DataTextField="BrandName" DataValueField="Id" DataSourceID="SqlDataSourceBrand" AutoPostBack="True"></asp:DropDownList>
        </div>   
        <div class="toyTable row table-bordered">
            <asp:DataList ID="DataListToys" runat="server" DataSourceID="SqlDataSourceToys" DataKeyField="Id" CssClass="table table-bordered table-striped table-condensed">
                <HeaderTemplate>
                    <div class="row tableHeading">
                        <div class="col-sm-1">Toy ID</div>
                        <div class="col-sm-3">Name</div>
                        <div class="col-sm-4">Description</div>
                         <div class="col-sm-2">InStock</div>
                        <div class="col-sm-2">Price</div>
                    </div>
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="row">
                        <div class="col-sm-1">
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' /></div>
                        <div class="col-sm-3">
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("ToyName") %>' /></div>
                        <div class="col-sm-4 text-right">
                            <asp:Label ID="DescLabel" runat="server" Text='<%# Eval("ToyDescription") %>' /></div>
                        <div class="col-sm-2 text-right">
                            <asp:Label ID="InStockLabel" runat="server" Text='<%# Eval("InStock") %>' /></div>
                        <div class="col-sm-2 text-right">
                            <asp:Label ID="PriceLabel" runat="server" Text='<%# Convert.ToDecimal(Eval("Price")).ToString("C2", CultureInfo.CreateSpecificCulture("en-US")) %>' /></div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>

        <h2 class="brandTableCaption">Brand Data Maintenance</h2>
        <asp:GridView ID="GridViewBrand" CssClass="table table-bordered table-striped table-condensed" runat="server" DataSourceID="SqlDataSourceBrand" AutoGenerateColumns="False" DataKeyNames="Id">
             <Columns>
                <asp:BoundField DataField="Id" HeaderText="Brand ID" ReadOnly="True">
                    <ItemStyle Width="80px" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label ID="lblBrandName" runat="server" Text='<%# Bind("BrandName") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtBrandName" runat="server" Text='<%# Bind("BrandName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqBrandName" runat="server" ControlToValidate="txtBrandName"
                            ForeColor="Red" ErrorMessage="<br /> Brand Name is required." ValidationGroup="vgEdit"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description">
                    <ItemTemplate>
                        <asp:Label ID="lblBrandDesc" runat="server" Text='<%# Bind("BrandDescription") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtBrandDesc" runat="server" Text='<%# Bind("BrandDescription") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqLongName" runat="server" ControlToValidate="txtBrandDesc"
                            ForeColor="Red" ErrorMessage="<br />Brand Description is required." ValidationGroup="vgEdit"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemStyle Width="230px" />
                </asp:TemplateField>
                <asp:CommandField HeaderText="Change Name/ Description" ButtonType="Button" ShowEditButton="True" CausesValidation="True" ValidationGroup="vgEdit" ItemStyle-Width="180px" ControlStyle-CssClass="edit-button" />
                <asp:CommandField HeaderText="Remove Brand" ButtonType="Button" ShowDeleteButton="True" CausesValidation="False" ItemStyle-Width="120px" ControlStyle-CssClass="delete-button"/>
            </Columns>
        </asp:GridView>


        <h6 class="addBrandCaption">To add a new Toy Brand, enter the details below and click on "Add New Brand"</h6>
        <div class="form-group addBrandSection">
            <div>
                <asp:Label ID="BrandNameLabel" runat="server" Text="Name:" AssociatedControlID="BrandNameInput" />
                <asp:TextBox ID="BrandNameInput" runat="server" class="nameFieldSection"></asp:TextBox>
                <asp:RequiredFieldValidator ID="BrandNameValidator" runat="server" ControlToValidate="BrandNameInput" ErrorMessage="Brand Name is required." ValidationGroup="AddBrandGroup" CssClass="error-message" />
            </div>
            <div class="descSection">
                <asp:Label ID="BrandDescLabel" runat="server" Text="Description:" AssociatedControlID="BrandDescInput" />
                <asp:TextBox ID="BrandDescInput" runat="server" class="descFieldSection"></asp:TextBox>
                <asp:RequiredFieldValidator ID="BrandDescValidator" runat="server" ControlToValidate="BrandDescInput" ErrorMessage="Brand Description is required." ValidationGroup="AddBrandGroup" CssClass="error-message" />
            </div>
            <div>
                <asp:Button CssClass="btn btn-primary" ID="AddNewBrandButton" runat="server" Text="Add New Brand" OnClick="AddNewBrandButton_Click" ValidationGroup="AddBrandGroup" />
            </div>
        </div> <br /> <br /> <br />


        <h2 class="toyGridCaption">Toy Data Maintenance</h2>
        
        <div class="row toyGridSection">
            <div class="col-md-7">
                <asp:GridView ID="GridViewToys" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceToysGrid" DataKeyNames="Id" CssClass="table table-bordered table-striped table-condensed" Style="width: 100%" AllowSorting="true" AllowPaging="true" PageSize="4" OnPageIndexChanged="GridViewToys_PageIndexChanged" OnSelectedIndexChanged="GridViewToys_SelectedIndexChanged" OnSorting="GridViewToys_Sorting">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Toy ID" ReadOnly="True" SortExpression="Id">
                            <HeaderStyle ForeColor="Black" CssClass="gridview-header" />
                            <ItemStyle Width="110px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ToyName" HeaderText="Name" ReadOnly="True" SortExpression="ToyName">
                            <HeaderStyle ForeColor="Black" CssClass="gridview-header" />
                            <ItemStyle Width="230px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Price" HeaderText="Price" ReadOnly="True" DataFormatString="{0:$0.00}" SortExpression="Price">
                            <HeaderStyle ForeColor="Black" CssClass="gridview-header" />
                            <ItemStyle Width="140px" />
                        </asp:BoundField>
                        <asp:CommandField HeaderText="Action" ShowSelectButton="True" SelectText="Select" />
                    </Columns>
                    <PagerStyle CssClass="pager" HorizontalAlign="Center" />
                </asp:GridView>
            </div>
            
            <div class="col-md-5">
                <asp:DetailsView DataKeyNames="Id" ID="DetailsViewToys" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSourceToyDetails" CssClass="table table-bordered table-striped table-condensed" OnItemDeleted="DetailsViewToys_ItemDeleted" OnItemUpdated="DetailsViewToys_ItemUpdated" OnItemInserted="DetailsViewToys_ItemInserted">
                    <Fields>
                        
                       <asp:TemplateField HeaderText="Id" HeaderStyle-Font-Bold="True">
                            <ItemTemplate>
                                <asp:Label ID="LabelId" runat="server" Text='<%# Bind("Id") %>' Visible="true" ReadOnly="true"></asp:Label>
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <asp:Label ID="LabelId" runat="server" Text="Auto-generated" Visible="true" ReadOnly="true"></asp:Label>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Name" HeaderStyle-Font-Bold="True">
                            <ItemTemplate>
                                <asp:Label ID="LabelName" runat="server" Text='<%# Bind("ToyName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox width="100%" ID="TextBoxName" runat="server" Text='<%# Bind("ToyName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ControlToValidate="TextBoxName" ErrorMessage="</br> Please enter a toy name" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Description" HeaderStyle-Font-Bold="True">
                            <ItemTemplate>
                                <asp:Label ID="LabelDescription" runat="server" Text='<%# Bind("ToyDescription") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox width="100%" ID="TextBoxDescription" runat="server" Text='<%# Bind("ToyDescription") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDescription" runat="server" ControlToValidate="TextBoxDescription" ErrorMessage="</br> Please enter a description" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="In Stock" HeaderStyle-Font-Bold="True">
                            <ItemTemplate>
                                <asp:Label ID="LabelInStock" runat="server" Text='<%# Bind("InStock") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox width="100%" ID="TextBoxInStock" runat="server" Text='<%# Bind("InStock") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorInStock" runat="server" ControlToValidate="TextBoxInStock" ErrorMessage="</br> Please enter quantity in stock" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorInStoack" runat="server" ControlToValidate="TextBoxInStock" ForeColor="Red" ErrorMessage="</br>Please enter a valid quantity" ValidationExpression="^\d*[1-9]\d*$"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Price" HeaderStyle-Font-Bold="True">
                            <ItemTemplate>
                                <asp:Label ID="Price" runat="server" Text='<%# Bind("Price", "{0:$0.00}") %>'> </asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox  width="100%" ID="TextBoxPrice" runat="server" DataFormatString="{0:$0.00}" Text='<%# Bind("Price") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrice" runat="server" ControlToValidate="TextBoxPrice" ErrorMessage="</br> Please enter a Price" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorPrice" runat="server" ControlToValidate="TextBoxPrice" ErrorMessage="</br> Please enter a valid value for the Price" ForeColor="Red" ValidationExpression="^[1-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Image Name" HeaderStyle-Font-Bold="True">
                            <ItemTemplate>
                                <asp:Label ID="LabelImageName" runat="server" Text='<%# Bind("ImageName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox width="100%" ID="TextBoxImageName" runat="server" Text='<%# Bind("ImageName") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Brand" HeaderStyle-Font-Bold="True">
                            <ItemTemplate>
                                <asp:Label ID="LabelBrandName" runat="server" Text='<%# Eval("BrandName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList width="100%" ID="DropDownListBrandName" runat="server" DataSourceID="SqlDataSourceBrand" DataTextField="BrandName" DataValueField="BrandName" SelectedValue='<%# Bind("BrandName") %>'></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorBrandName" runat="server" ControlToValidate="DropDownListBrandName" ErrorMessage="Please select a Brand" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:CommandField ShowInsertButton="True" ShowEditButton="True" ShowDeleteButton="True" ControlStyle-CssClass="my-command-field" />
                    </Fields>
                </asp:DetailsView>

            </div>
        </div>

        <asp:SqlDataSource ID="SqlDataSourceBrand" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Brand]" DeleteCommand="DELETE FROM [Brand] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Brand] ([BrandName], [BrandDescription]) VALUES (@BrandName, @BrandDescription)" UpdateCommand="UPDATE [Brand] SET [BrandName] = @BrandName, [BrandDescription] = @BrandDescription WHERE [Id] = @Id" OnDeleted="Brand_RowDeleted">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="BrandName" Type="String"></asp:Parameter>
                <asp:Parameter Name="BrandDescription" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="BrandName" Type="String"></asp:Parameter>
                <asp:Parameter Name="BrandDescription" Type="String"></asp:Parameter>
                <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource> 

        <asp:SqlDataSource ID="SqlDataSourceToys" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [ToyName], [ToyDescription], [InStock], [ImageName], [Price], [BrandId] FROM [Toys] WHERE ([BrandId] = @BrandId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownListBrand" PropertyName="SelectedValue" Name="BrandId" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>

         <asp:SqlDataSource ID="SqlDataSourceToysGrid" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT t.Id, t.ToyName, t.ToyDescription, t.InStock, t.ImageName, t.Price, b.BrandName FROM Toys t INNER JOIN Brand b ON t.BrandId = b.Id ORDER BY t.Id">
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSourceToyDetails" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT t.Id, t.ToyName, t.ToyDescription, t.InStock, t.ImageName, t.Price, b.BrandName FROM Toys t INNER JOIN Brand b ON t.BrandId = b.Id WHERE t.Id = @Id"
            InsertCommand="INSERT INTO Toys (BrandId, ToyName, ToyDescription, InStock, ImageName, Price) VALUES ((SELECT Id FROM Brand WHERE BrandName = @BrandName), @ToyName, @ToyDescription, @InStock, @ImageName, @Price)"
            UpdateCommand="UPDATE Toys SET BrandId = (select Id from Brand where BrandName = @BrandName), ToyName = @ToyName, ToyDescription = @ToyDescription, InStock = @InStock, ImageName = @ImageName, Price = @Price WHERE Id = @Id"
            DeleteCommand="DELETE FROM Toys WHERE Id = @Id">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridViewToys" Name="Id" PropertyName="SelectedValue" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="BrandName" Type="String" />
                <asp:Parameter Name="ToyName" Type="String" />
                <asp:Parameter Name="ToyDescription" Type="String" />
                <asp:Parameter Name="InStock" Type="Int32" />
                <asp:Parameter Name="ImageName" Type="String" />
                <asp:Parameter Name="Price" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ToyName" Type="String" />
                <asp:Parameter Name="ToyDescription" Type="String" />
                <asp:Parameter Name="InStock" Type="Int32" />
                <asp:Parameter Name="ImageName" Type="String" />
                <asp:Parameter Name="Price" Type="Decimal" />
                <asp:ControlParameter ControlID="GridViewToys" Name="Id" PropertyName="SelectedValue" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

