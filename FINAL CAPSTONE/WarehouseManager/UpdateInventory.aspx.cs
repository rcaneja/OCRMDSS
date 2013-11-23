using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class WarehouseManager_InventoryStatus : System.Web.UI.Page
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
                    getInventoryList();
                    btnUpdateInventoryLevel.Visible = false;
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
        com.CommandText = "SELECT * FROM dbo.Products A " +
             "INNER JOIN dbo.ProductClass B ON A.productClassID = B.productClassID " +
             "INNER JOIN dbo.ProductSubClass C ON A.productSubClassID = C.productSubClassID " +
             "INNER JOIN dbo.Inventory D ON A.productID = D.productSerialNo";

        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        grdInventory.DataSource = ds;
        grdInventory.DataBind();
        con.Close();
    }

    protected void btnViewDetails_Click(object sender, EventArgs e)
    {
        int productID = int.Parse(Session["productID"].ToString());
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/WarehouseManager/UpdateInventoryLevels.aspx?productID=" + productID.ToString());
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
        com.CommandText = "SELECT * FROM dbo.Products A " +
            "INNER JOIN dbo.ProductClass B ON A.productClassID = B.productClassID " +
            "INNER JOIN dbo.ProductSubClass C ON A.productSubClassID = C.productSubClassID " +
            "INNER JOIN dbo.Inventory D ON A.productID = D.productSerialNo " +
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
    protected void grdInventory_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["productID"] = grdInventory.SelectedRow.Cells[0].Text;
        btnUpdateInventoryLevel.Visible = true;
    }
    protected void btnUpdateInventoryLevel_Click(object sender, EventArgs e)
    {
        int productID = int.Parse(Session["productID"].ToString());
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/WarehouseManager/UpdateInventoryLevels.aspx?productID=" + productID.ToString());
    }
    protected void grdInventory_PageIndexChanged(object sender, EventArgs e)
    {

    }
    protected void grdInventory_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {

    }
}