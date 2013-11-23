using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class WarehouseManager_AddInventory : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 3)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                if (!IsPostBack)
                {
                    getProductList();
                }
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
    }

    void getProductList()
    {
        grdProducts.SelectedIndex = -1;

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM dbo.Products AS A INNER JOIN dbo.ProductClass AS B ON A.productClassID = B.productClassID " +
                "INNER JOIN dbo.ProductSubClass AS C ON A.productSubClassID = C.productSubClassID";
        
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        grdProducts.DataSource = ds;
        grdProducts.DataBind();

        con.Close();
    }

    protected void grdProducts_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["productID"] = grdProducts.SelectedRow.Cells[0].Text;
    }
    protected void btnViewDetails_Click(object sender, EventArgs e)
    {
        int productID = int.Parse(Session["productID"].ToString());
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/WarehouseManager/UpdateInventoryLevels.aspx?productID=" + productID.ToString());
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        getProduct(ddlColumns.SelectedItem.Value, txtKeyword.Text);
    }

    void getProduct(string column, string keyword)
    {
        grdProducts.SelectedIndex = -1;

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM dbo.Products AS A INNER JOIN dbo.ProductClass AS B ON A.productClassID = B.productClassID " +
                "INNER JOIN dbo.ProductSubClass AS C ON A.productSubClassID = C.productSubClassID " +
                "WHERE " + column + " LIKE '%" + keyword + "%'";

        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        grdProducts.DataSource = ds;
        grdProducts.DataBind();

        con.Close();
        txtKeyword.Text = "";
    }
    protected void btnViewAll_Click(object sender, EventArgs e)
    {
        getProductList();
    }

    protected void grdProducts_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdProducts.PageIndex = e.NewPageIndex;
        getProductList();
    }
}