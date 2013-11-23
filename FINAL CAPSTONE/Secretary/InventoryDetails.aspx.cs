using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Secretary_InventoryDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 2)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                if (Request.QueryString["inventoryID"] != null)//has orderID
                {
                    getInventoryDetails(Request.QueryString["inventoryID"].ToString());
                }
                else
                    Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Secretary/InventoryStatus.aspx");
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

    void getInventoryDetails(string inventoryID)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM Inventory AS A INNER JOIN Products AS B ON A.productSerialNo = B.productSerialNo " +
                "INNER JOIN ProductClass AS C On B.productClassID = C.productClassID INNER JOIN ProductSubClass AS D " +
                "ON B.productSubClassID = D.productSubClassID WHERE A.inventoryID = @inventoryID";
        com.Parameters.Add("@inventoryID", SqlDbType.Int).Value = inventoryID;

        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                prodImage.ImageUrl = dr["productImage"].ToString();
                lblProdName.Text = dr["productName"].ToString();
                lblProdID.Text = dr["productID"].ToString();
                lblProdSerialNo.Text = dr["productSerialNo"].ToString();
                lblProdClassName.Text = dr["productClassName"].ToString();
                lblProdSubClass.Text = dr["productSubClass"].ToString();
                lblProdDescription.Text = dr["productDescription"].ToString();
                lblProdUnitPrice.Text = dr["productUnitPrice"].ToString();
                lblProdStatus.Text = dr["productStatus"].ToString();
                lblCriticalLevel.Text = dr["productCriticalLevel"].ToString();
                lblWarehouseStock.Text = dr["warehouseStock"].ToString();
                lblExistingStock.Text = dr["existingStock"].ToString();
            }
        }
        else
        {
            lblNoti.Text = "You haven't selected an order to view its details.";
        }
        con.Close();
    }
}