using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group8_FinalProject
{
    public partial class checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["totalAmount"] != null)
            {
                decimal cartValue = decimal.Parse(Request.QueryString["totalAmount"]);
                decimal hst = cartValue * (13m / 100m); 
                decimal grandTotal = cartValue + hst + 10m;
                lblCartValue.Text = "Cart Value:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$" + cartValue.ToString("0.00");
                lblHST.Text = "HST(13%):&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$" + hst.ToString("0.00");
                lblDelivery.Text = "Delivery:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp$10.00";
                lblGrandTotal.Text = "Grand Total:&nbsp;&nbsp;&nbsp;&nbsp;$" + grandTotal.ToString("0.00");

            }


        }

        protected void CheckOut_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                Response.Redirect("./ThankYou.aspx");
            }
        }

        protected void ContinueShopping(object sender, EventArgs e)
        {
            Response.Redirect("./Toys.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtEmail1.Text = "";
            txtEmail2.Text = "";
            txtFname.Text = "";
            txtLName.Text = "";
            txtPhone.Text = "";
            txtCardholderName.Text = "";
            txtCardNumber.Text = "";
            txtCVV.Text = "";
            txtExpiry.Text = "";
            txtAddress.Text = "";
            txtCity.Text = "";
            txtZip.Text = "";
            rblContactVia.SelectedIndex = -1;

        }
    }
}