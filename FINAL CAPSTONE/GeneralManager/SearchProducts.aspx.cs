using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class GeneralManager_SearchProducts : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    void GetProducts()
    {
        gvProducts.SelectedIndex = -1;

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM Products";

        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        gvProducts.DataSource = ds;
        gvProducts.DataBind();

        con.Close();
    }

    void GetProducts(string column, string keyword)
    {
        gvProducts.SelectedIndex = -1;

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM Products WHERE " + column + " LIKE '%" + keyword + "%'";

        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        gvProducts.DataSource = ds;
        gvProducts.DataBind();

        con.Close();
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 4)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                GetProducts();

            }
            else
            {
                Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/WaitforConfirmation.aspx");
            }

        }
        else
        {
            Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Login.aspx");
        }


        if (!IsPostBack)
            GetProducts();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        GetProducts(ddlColumns.SelectedItem.Value, txtKeyword.Text);
    }

    protected void btnViewAll_Click(object sender, EventArgs e)
    {
        txtKeyword.Text = "";
        GetProducts();
    }

    protected void gvProducts_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["productID"] = gvProducts.SelectedRow.Cells[0].Text;
        Session["productSerialNo"] = gvProducts.SelectedRow.Cells[1].Text;
        Session["productName"] = gvProducts.SelectedRow.Cells[2].Text;
        Session["productClassID"] = gvProducts.SelectedRow.Cells[3].Text;
        Session["productSubClassID"] = gvProducts.SelectedRow.Cells[4].Text;
        Session["productUnitPrice"] = gvProducts.SelectedRow.Cells[5].Text;
        Session["productDescription"] = gvProducts.SelectedRow.Cells[6].Text;
        Session["productCriticalLevel"] = gvProducts.SelectedRow.Cells[7].Text;
    }

    protected void gvProducts_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvProducts.PageIndex = e.NewPageIndex;

        if (txtKeyword.Text == "")
            GetProducts();
        else
            GetProducts(ddlColumns.SelectedItem.Value, txtKeyword.Text);
    }
    protected void ddlColumns_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}