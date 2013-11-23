using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Customers_SearchProducts : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    void GetProducts()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM dbo.Products AS A " +
            "INNER JOIN dbo.ProductClass AS B ON A.productClassID = B.productClassID " +
            "INNER JOIN dbo.ProductSubClass AS C ON A.productSubClassID = C.productSubClassID";

        SqlDataReader dr = com.ExecuteReader();
        lvProducts.DataSource = dr;
        lvProducts.DataBind();
        con.Close();
    }

    void GetProducts(string category, string search)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM dbo.Products AS A " +
            "INNER JOIN dbo.ProductClass AS B ON A.productClassID = B.productClassID " +
            "INNER JOIN dbo.ProductSubClass AS C ON A.productSubClassID = C.productSubClassID " +
            "WHERE " + category + " LIKE '%" + search + "%' ";

        SqlDataReader dr = com.ExecuteReader();
        lvProducts.DataSource = dr;
        lvProducts.DataBind();
        con.Close();
    }

    //===================================
    //===================================

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 1)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                if (!IsPostBack)
                {
                    GetProducts();
                }
            }
            else
            {
                Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/WaitforConfirmation.aspx");
            }
        }
        else
        {
            Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Home.aspx");
        }        
    }

    //===================================
    //===================================

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtSearch.Text == "")
        {
            GetProducts();
        }

        else
        {
            GetProducts(ddlColumns.SelectedValue, txtSearch.Text);
        }
    }

    //===================================
    //===================================

    protected void ViewAll(object sender, EventArgs e)
    {
        txtSearch.Text = "";
        GetProducts();

        Helper.ClearTextboxes(this.Controls);
    }

    //===================================
    //===================================
    protected void lvProducts_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}