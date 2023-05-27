<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="Group8_FinalProject.checkout" %>
<%@ MasterType VirtualPath="~/Site1.Master" %>

<asp:Content ID="styleContent" ContentPlaceHolderID="headPlaceholder" runat="server">
    <link href="checkoutStyle.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
        <div class="container">
            <br /> <br />
            <h3>Order Summary</h3>
            <p><asp:Label ID="lblCartValue" runat="server" Text=""></asp:Label></p>
            <p><asp:Label ID="lblHST" runat="server" Text=""></asp:Label></p>
            <p><asp:Label ID="lblDelivery" runat="server" Text=""></asp:Label></p>
            <p class="grandTotal"><asp:Label ID="lblGrandTotal" runat="server" Text=""></asp:Label></p>

            <br />

            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger summary" HeaderText="Please correct these entries:" />
            <br />
            <h3>Contact information</h3>

            <div class="form-group row">
                <label class="control-label col-lg-2">Email Address: </label>
                <div class="col-lg-2">
                    <asp:TextBox ID="txtEmail1" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                </div>
                <div class="col-lg-2">
                    <asp:RequiredFieldValidator ID="rfvEmail1" runat="server" ErrorMessage="Email address" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtEmail1">Email is required </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail1" runat="server" ErrorMessage="Email address" CssClass="text-danger" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail1">Must be a valid email address </asp:RegularExpressionValidator>
                </div>
            </div>
            <br />

            <div class="form-group row">
                <label class="control-label col-lg-2">Email Re-entry:</label>
                <div class="col-lg-2">
                    <asp:TextBox ID="txtEmail2" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                </div>
                <div class="col-lg-2">
                    <asp:RequiredFieldValidator ID="rfvEmail2" runat="server" ErrorMessage="Email re-entry" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtEmail2">Email re-entry is required </asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvEmail2" runat="server" ControlToValidate="txtEmail2" CssClass="text-danger" ControlToCompare="txtEmail1" Display="Dynamic" ErrorMessage="Email re-entry">Must match first email </asp:CompareValidator>
                </div>
            </div>
            <br />

            <div class="form-group row">
                <label class="control-label col-lg-2">First Name:</label>
                <div class="col-lg-2">
                    <asp:TextBox ID="txtFname" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-lg-2">
                    <asp:RequiredFieldValidator ID="rfvFname" runat="server" ErrorMessage="First Name" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtFname">First Name is required </asp:RequiredFieldValidator>
                </div>
            </div>
            <br />

            <div class="form-group row">
                <label class="control-label col-lg-2">Last Name:</label>
                <div class="col-lg-2">
                    <asp:TextBox ID="txtLName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-lg-2">
                    <asp:RequiredFieldValidator ID="rfvLname" runat="server" ErrorMessage="Last Name" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtLname">Last Name is required </asp:RequiredFieldValidator>
                </div>
            </div>
            <br />

            <div class="form-group row">
                <label class="control-label col-lg-2">Phone Number:</label>
                <div class="col-lg-2">
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                </div>
                <div class="col-lg-2">
                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ErrorMessage="Phone Number" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtPhone">Phone Number is required </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revPhone" runat="server" ErrorMessage="Phone Number" CssClass="text-danger" Display="Dynamic" ValidationExpression="^\d{10}$" ControlToValidate="txtPhone">Phone number must be 10 digit only</asp:RegularExpressionValidator>
                </div>
            </div>
            <br />
            <br />

            <h3>Payment Details</h3>
            <div class="form-group row">
              <label class="control-label col-lg-2">Cardholder Name:</label>
              <div class="col-lg-2">
                <asp:TextBox ID="txtCardholderName" runat="server" CssClass="form-control"></asp:TextBox>
              </div>
              <div class="col-lg-2">
                <asp:RequiredFieldValidator ID="rfvCardholderName" runat="server" ErrorMessage="Cardholder Name" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtCardholderName">Cardholder Name is required </asp:RequiredFieldValidator>
              </div>
            </div>
            <br />

             <div class="form-group row">
              <label class="control-label col-lg-2">Card Number:</label>
              <div class="col-lg-2">
                <asp:TextBox ID="txtCardNumber" runat="server" CssClass="form-control"></asp:TextBox>
              </div>
              <div class="col-lg-2">
                <asp:RequiredFieldValidator ID="rfvCardNumber" runat="server" ErrorMessage="Card Number" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtCardNumber">Card Number is required </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revCardNumber" runat="server" ErrorMessage="Card Number" CssClass="text-danger" Display="Dynamic" ValidationExpression="^\d{16}$" ControlToValidate="txtCardNumber">Enter 16-digit Card Number</asp:RegularExpressionValidator>
              </div>
            </div>
            <br />

            <div class="form-group row">
              <label class="control-label col-lg-2">CVV:</label>
              <div class="col-lg-2">
                <asp:TextBox ID="txtCVV" runat="server" CssClass="form-control"></asp:TextBox>
              </div>
              <div class="col-lg-2">
                <asp:RequiredFieldValidator ID="rfvCVV" runat="server" ErrorMessage="CVV" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtCVV">CVV is required </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revCVV" runat="server" ErrorMessage="CVV" CssClass="text-danger" Display="Dynamic" ValidationExpression="^\d{3}$" ControlToValidate="txtCVV">Enter 3-digit CVV</asp:RegularExpressionValidator>
              </div>
            </div>
            <br />

            <div class="form-group row">
                <label class="control-label col-lg-2">Expiry Date(MM/YYYY):</label>
                <div class="col-lg-2">
                    <asp:TextBox ID="txtExpiry" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-lg-2">
                    <asp:RequiredFieldValidator ID="rfvExpiry" runat="server" ErrorMessage="Expiry Date" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtExpiry">Expiry Date is required </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revExpiry" runat="server" ErrorMessage="Expiry Date" CssClass="text-danger" Display="Dynamic" ValidationExpression="^(0[4-9]|1[0-2])\/(2023|2024|2025|2026)$" ControlToValidate="txtExpiry">Valid Expiry is between 04/2023 and 04/2026</asp:RegularExpressionValidator>
                </div>
            </div>
            <br />
            <br />


            <h3>Billing Address</h3>
            <div class="form-group row">
                <label class="control-label col-lg-2">Address:</label>
                <div class="col-lg-2">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-lg-2">
                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Address" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtAddress">Address is required </asp:RequiredFieldValidator>
                </div>
            </div>
            <br />

            <div class="form-group row">
                <label class="control-label col-lg-2">City:</label>
                <div class="col-lg-2">
                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-lg-2">
                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="City" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtCity">City is required </asp:RequiredFieldValidator>
                </div>
            </div>
            <br />

            <div class="form-group row">
                <label class="control-label col-lg-2">State:</label>
                <div class="col-lg-2">
                    <asp:DropDownList ID="txtState" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Ontario" Value="1"></asp:ListItem>
                        <asp:ListItem Text="British Columbia" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Manitoba" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Alberta" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Quebec" Value="5"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-lg-2">
                    <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="State" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtState">State is required </asp:RequiredFieldValidator>
                </div>
            </div>
            <br />

            <div class="form-group row">
                <label class="control-label col-lg-2">Zip code:</label>
                <div class="col-lg-2">
                    <asp:TextBox ID="txtZip" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-lg-2">
                    <asp:RequiredFieldValidator ID="rfvZip" runat="server" ErrorMessage="Zip Code" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtZip">Zip Code is required</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revZip" runat="server" ErrorMessage="Zip Code" CssClass="text-danger" Display="Dynamic" ValidationExpression="^(\d{5})$" ControlToValidate="txtZip">Expected Format (example): 00501</asp:RegularExpressionValidator>
                </div>
            </div>
            <br />
            <br />

           <div class="form-group">
                <br />
                <div class="col-lg-12">
                    <label>Please contact me via:</label>
                    <asp:RadioButtonList ID="rblContactVia" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>Twitter &nbsp;</asp:ListItem>
                        <asp:ListItem>Facebook &nbsp;</asp:ListItem>
                        <asp:ListItem>Text message &nbsp;</asp:ListItem>
                        <asp:ListItem>Email</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <br />
            <div class="form-group">
                <div class="col-lg-12">
                    <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" CssClass="btn btn-primary" OnClick="CheckOut_Click" />
                    &nbsp; &nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel Order" CssClass="btn btn-primary" OnClick="btnCancel_Click" CausesValidation="False" />
                    &nbsp; &nbsp;
                    <asp:LinkButton ID="lbtnContinueShopping" runat="server" OnClick="ContinueShopping" CausesValidation="False">Continue Shopping</asp:LinkButton>
                </div>
            </div>
            <br />
            <br />
        </div>
</asp:Content>

