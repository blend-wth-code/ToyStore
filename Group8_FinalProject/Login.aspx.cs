using System;
using System.Web;


namespace Group8_FinalProject
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtUserName.Text = string.Empty;
            txtEmail.Text = string.Empty;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                HttpCookie cookie = new HttpCookie("userName");
                cookie.Value = txtUserName.Text;
                Response.Cookies.Add(cookie);

                Response.Redirect("./Toys");
            }
        }
    }
}