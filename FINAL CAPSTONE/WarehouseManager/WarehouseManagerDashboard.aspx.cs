using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class WarehouseManager_WarehouseManagerDashboard : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    void getAllInventory()
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
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 3)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                getAllInventory();

            }
            else
            {
                Response.Redirect("http://localhost:12345/FINAL CAPSTONE/WaitforConfirmation.aspx");
            }
        }
        else
        {
            Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Login.aspx");
        }
    }
    
    protected void btnViewAllInventory_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/WarehouseManager/InventoryStatus.aspx");
    }

    protected void grdInventory_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["inventoryID"] = grdInventory.SelectedRow.Cells[0].Text;
        Session["productName"] = grdInventory.SelectedRow.Cells[1].Text;
        Session["productClass"] = grdInventory.SelectedRow.Cells[2].Text;
        Session["productStatus"] = grdInventory.SelectedRow.Cells[3].Text;
        Session["productCriticalLevel"] = grdInventory.SelectedRow.Cells[4].Text;
        Session["existingStock"] = grdInventory.SelectedRow.Cells[5].Text;
    }

    protected void grdInventory_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdInventory.PageIndex = e.NewPageIndex;

        getAllInventory();
    }
}