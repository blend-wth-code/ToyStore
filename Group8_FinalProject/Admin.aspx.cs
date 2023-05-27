using System;
using System.Web.UI.WebControls;

namespace Group8_FinalProject
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void AddNewBrandButton_Click(object sender, EventArgs e)
        {
            string brandName = BrandNameInput.Text;
            string brandDesc = BrandDescInput.Text;

            SqlDataSourceBrand.InsertParameters.Clear();
            SqlDataSourceBrand.InsertParameters.Add("BrandName", brandName);
            SqlDataSourceBrand.InsertParameters.Add("BrandDescription", brandDesc);
            SqlDataSourceBrand.InsertCommand = "INSERT INTO [Brand] ([BrandName], [BrandDescription]) VALUES (@BrandName, @BrandDescription)";
            SqlDataSourceBrand.Insert();

            BrandNameInput.Text = "";
            BrandDescInput.Text = "";

            DropDownListBrand.DataBind();
        }

        protected void GridViewToys_PageIndexChanged(object sender, EventArgs e)
        {
            DetailsViewToys.Visible = false;
        }

        protected void GridViewToys_SelectedIndexChanged(object sender, EventArgs e)
        {
            DetailsViewToys.Visible = true;
        }


        protected void Brand_RowDeleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            SqlDataSourceToys.DataBind();
            GridViewToys.DataBind();
            DropDownListBrand.DataBind();
            DataListToys.DataBind();
        }
        protected void DetailsViewToys_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
                SqlDataSourceToys.DataBind();
                GridViewToys.DataBind();
                DetailsViewToys.Visible = false;
                DropDownListBrand.DataBind();
                DataListToys.DataBind();
        }

        protected void DetailsViewToys_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
                SqlDataSourceToys.DataBind();
                GridViewToys.DataBind();
                DropDownListBrand.DataBind();
                DataListToys.DataBind();
        }

        protected void DetailsViewToys_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
                SqlDataSourceToys.DataBind();
                GridViewToys.DataBind();
                DropDownListBrand.DataBind(); 
                DataListToys.DataBind();
        }

        protected void GridViewToys_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortExpression = e.SortExpression;
            string sortDirection = (string)ViewState["SortDirection"];

            if (sortDirection == "ASC")
            {
                sortDirection = "DESC";
            }
            else
            {
                sortDirection = "ASC";
            }

            
            SqlDataSourceToysGrid.SelectCommand = "SELECT * FROM Toys ORDER BY " + sortExpression + " " + sortDirection;
            ViewState["SortDirection"] = sortDirection;
            GridViewToys.DataBind();
        }


    }
}