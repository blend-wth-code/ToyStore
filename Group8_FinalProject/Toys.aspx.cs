using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group8_FinalProject
{
    public partial class Toys : System.Web.UI.Page
    {
        public string userName;
        Toy toy;
        List<Toy> toys = new List<Toy>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["userName"] != null)
            {
                userName = Request.Cookies["userName"].Value;
            }

            if (Session["MyCart"] == null)
            {
                Session["MyCart"] = toys;
            }
           
            if (!IsPostBack )
            {
                ddlToy.DataBind();
            }

            toy = this.getToy();

            lblName.Text = toy.Name.ToString();
            lblManufacturedBy.Text = "Manufacturer: " +toy.ManufacturedBy.ToString();
            lblDesc.Text = toy.Desc.ToString();
            lblPrice.Text = "$ " + toy.Price.ToString();

            string imageUrl = "~/Images/" + toy.ImageName;

            if (!File.Exists(Server.MapPath(imageUrl)))
            {
                imageUrl = "~/Images/Default Image.jpg";
            }

            imgToy.ImageUrl = imageUrl;

        }

        public Toy getToy()
        {
            DataView dvToy = (DataView)SqlDataSourceToy.Select(DataSourceSelectArguments.Empty);

            dvToy.RowFilter = "Id = '"+ ddlToy.SelectedValue +"'";

            DataRowView row = dvToy[0];

            toy = new Toy();
            toy.Id = Convert.ToInt32(row["Id"]);
            toy.Name = row["ToyName"].ToString();
            toy.Desc = row["ToyDescription"].ToString();
            toy.Price = Convert.ToDecimal(row["Price"]);
            toy.ImageName = row["ImageName"].ToString();

            using (SqlConnection connection = new SqlConnection(SqlDataSourceToy.ConnectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("SELECT BrandName FROM Brand WHERE Id = @BrandId", connection);
                command.Parameters.AddWithValue("@BrandId", row["BrandId"]);
                toy.ManufacturedBy = (string)command.ExecuteScalar();
            }

            return toy;
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                List<Toy> addToys = (List<Toy>)Session["MyCart"];
                Toy addToy = addToys.FirstOrDefault(t => t.Id == Convert.ToInt32(ddlToy.SelectedValue));

                if (addToy == null)
                {
                    addToy = new Toy();
                    addToys.Add(addToy);
                    addToy.Id = Convert.ToInt32(ddlToy.SelectedValue);
                    addToy.Name = lblName.Text;
                    string priceWithoutDollar = lblPrice.Text.Replace("$ ", "");
                    addToy.Price = Convert.ToDecimal(priceWithoutDollar);
                }

                if ((addToy.Quantity + Convert.ToInt32(txtQuantity.Text)) > 10)
                {
                    string message = "You cannot have more than 10 items of `" + addToy.Name + "` in your cart. You have already added " + addToy.Quantity + " items of `" + addToy.Name + "`";
                    string script = "alert('" + message + "');";
                    ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);


                    return;
                }


                addToy.Quantity += Convert.ToInt32(txtQuantity.Text);
                Session["MyCart"] = addToys;
                Response.Redirect("~/Cart.aspx");
            }
        }

    }
}