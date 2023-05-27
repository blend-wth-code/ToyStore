using System;
using System.Collections.Generic;

namespace Group8_FinalProject
{
    public partial class Cart : System.Web.UI.Page
    {
        decimal totalAmount =0;
        protected void Page_Load(object sender, EventArgs e)
        {
            var toys = Session["MyCart"] as List<Toy>;
            

            if (!IsPostBack && toys != null)
            {
                foreach (var item in toys)
                {
                    decimal fvalue = Convert.ToDecimal(item.Quantity) * item.Price;

                    lstCart.Items.Add(item.Name + " :     " + item.Quantity + " x " + "$" + item.Price + " = " + "$" + fvalue);
                }
            }

            if (toys == null || toys.Count == 0)
            {
                btnCheckOut.Enabled = false;
                btnRemove.Enabled = false;
                btnEmpty.Enabled = false;

            }


        }

        protected void btnContinueShopping_Click(object sender, EventArgs e)
        {
            Response.Redirect("./Toys.aspx");
        }

        protected void btnRemoveItem(object sender, EventArgs e)
        {
            if (lstCart.SelectedIndex > -1)
            {
                var products = Session["MyCart"] as List<Toy>;
                products.RemoveAt(lstCart.SelectedIndex);
                lstCart.Items.RemoveAt(lstCart.SelectedIndex);

                if (products.Count == 0)
                {
                    btnCheckOut.Enabled = false;
                    btnRemove.Enabled = false;
                    btnEmpty.Enabled = false;
                }

            }
        }

        protected void btnClearCart(object sender, EventArgs e)
        {

            var products = Session["MyCart"] as List<Toy>;
            products.Clear();


            lstCart.Items.Clear();

            if (products.Count == 0)
            {
                btnCheckOut.Enabled = false;
                btnRemove.Enabled = false;
                btnEmpty.Enabled = false;
            }


        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            var checkoutToys = Session["MyCart"] as List<Toy>;

            foreach (var item in checkoutToys)
            {
                totalAmount += item.Quantity * item.Price;
            }

            Response.Redirect("checkout.aspx?totalAmount=" + totalAmount);

        }
    }
}