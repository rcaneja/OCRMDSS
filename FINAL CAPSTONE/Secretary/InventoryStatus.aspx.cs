using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Secretary1_InventoryStatus : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 2)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                if (!IsPostBack)
                {
                    getInventoryList();
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

    void getInventoryList()
    {
        grdInventory.SelectedIndex = -1;

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM dbo.Products AS A INNER JOIN dbo.ProductClass AS B ON A.productClassID = B.productClassID " +
            "INNER JOIN dbo.ProductSubClass AS C ON A.productSubClassID = C.productSubClassID " +
            "INNER JOIN dbo.Inventory AS D ON A.productSerialNo = (RIGHT('0000' + CAST( D.productSerialNo as varchar), 4))";
        
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        grdInventory.DataSource = ds;
        grdInventory.DataBind();
        con.Close();
    }

    protected void btnViewDetails_Click(object sender, EventArgs e)
    {
        int inventoryID = int.Parse(Session["inventoryID"].ToString());
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Secretary/InventoryDetails.aspx?inventoryID=" + inventoryID.ToString());
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        getInventory(ddlColumns.SelectedItem.Value, txtKeyword.Text);
    }

    void getInventory(string column, string keyword)
    {
        grdInventory.SelectedIndex = -1;

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM dbo.Products AS A INNER JOIN dbo.ProductClass AS B ON A.productClassID = B.productClassID " +
            "INNER JOIN dbo.ProductSubClass AS C ON A.productSubClassID = C.productSubClassID " +
            "INNER JOIN dbo.Inventory AS D ON A.productSerialNo = (RIGHT('0000' + CAST( D.productSerialNo as varchar), 4)) "+
            "WHERE " + column + " LIKE '%" + keyword + "%'";

        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        grdInventory.DataSource = ds;
        grdInventory.DataBind();

        con.Close();
        txtKeyword.Text = "";
    }
    protected void btnViewAll_Click(object sender, EventArgs e)
    {
        getInventoryList();
        txtKeyword.Text = "";
    }

    protected void grdInventory_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdInventory.PageIndex = e.NewPageIndex;

        if (txtKeyword.Text == "")
        {
            getInventoryList();
        }
        else
        {
            getInventory(ddlColumns.SelectedItem.Value, txtKeyword.Text);
        }
    }
  
    protected void btnUpdateInventoryLevel_Click(object sender, EventArgs e)
    {
        int inventoryID = int.Parse(Session["inventoryID"].ToString());
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/WarehouseManager/UpdateInventoryLevels.aspx?inventoryID=" + inventoryID.ToString());
    }
    protected void grdInventory_PageIndexChanged(object sender, EventArgs e)
    {

    }

}