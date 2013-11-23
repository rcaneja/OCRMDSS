using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class WarehouseManager_UpdateInventoryLevels : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    void getInventory(int prod)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT TOP 1 * FROM dbo.Products AS A INNER JOIN dbo.ProductClass AS B ON A.productClassID = B.productClassID " +
                "INNER JOIN dbo.ProductSubClass AS C ON A.productSubClassID = C.productSubClassID " +
                "INNER JOIN dbo.Inventory AS D ON A.productSerialNo = (RIGHT('0000' + CAST( D.productSerialNo as varchar), 4)) " +
                "WHERE A.productID=@productID ORDER BY inventoryID DESC";
        com.Parameters.Add("@productID", SqlDbType.Int).Value = prod;

        SqlDataReader dr = com.ExecuteReader();

        while (dr.Read())
        {
            imgProduct.ImageUrl = dr["productImage"].ToString();
            txtProdID.Text = dr["productID"].ToString();
            txtProdName.Text = dr["productName"].ToString();
            txtProdSerialNo.Text = dr["productSerialNo"].ToString();
            txtProdClassName.Text = dr["productClassName"].ToString();
            txtProdSubClass.Text = dr["productSubClass"].ToString();
            txtProdDescription.Text = dr["productDescription"].ToString();
            txtProdUnitPrice.Text = dr["productUnitPrice"].ToString();
            txtproductStatus.Text = dr["productStatus"].ToString();
            txtinventoryID.Text = dr["inventoryID"].ToString();
            txtCriticalLevel.Text = dr["productCriticalLevel"].ToString();
            txtwarehouseStock.Text = dr["warehouseStock"].ToString();
            txtExistingStock.Text = dr["existingStock"].ToString();
        }
        dr.Close();
        con.Close();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 3)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                if (Request.QueryString["productID"] != null)//has orderID
                {
                    Session["invUpdate"] = Convert.ToInt32(Request.QueryString["productID"].ToString());
                    if (!IsPostBack)
                    {
                        getInventory(Convert.ToInt32(Session["invUpdate"]));
                    }                   

                    pSuccess.Visible = false;
                    pError.Visible = false;
                    
                }
                else
                {
                    Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/WarehouseManager/InventoryStatus.aspx");
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

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;

        if (txtproductStatus.Text == "Soldout")
        {
            com.CommandText = "UPDATE dbo.Inventory SET " +
                "existingStock=@existingStock, producedStock=@producedStock, " +
                "warehouseStock=@warehouseStock, batchNo=@batchNo, productStatus=@productStatus " +
                "WHERE productID=@productID";
            
            com.Parameters.Add("@productID", SqlDbType.Int).Value = Convert.ToInt32(Session["productID"].ToString());
            com.Parameters.Add("@existingStock", SqlDbType.Int).Value = Convert.ToInt32(txtproducedStock.Text);
            com.Parameters.Add("@producedStock", SqlDbType.Int).Value = Convert.ToInt32(txtproducedStock.Text);
            com.Parameters.Add("@warehouseStock", SqlDbType.Int).Value = Convert.ToInt32(txtproducedStock.Text);
            com.Parameters.Add("@batchNo", SqlDbType.Int).Value = Convert.ToInt32(txtbatchNo.Text);
            com.Parameters.Add("@productStatus", SqlDbType.NVarChar).Value = "Active";
            }
        else
        {
            com.CommandText = "INSERT INTO Inventory (productSerialNo, existingStock, producedStock, warehouseStock, batchNo, productStatus) " +
                "VALUES ((RIGHT('0000' + CAST( @productSerialNo as varchar), 4)), @existingStock, @producedStock, @warehouseStock, @batchNo, @productStatus)";

            com.Parameters.Add("@productSerialNo", SqlDbType.Int).Value = Convert.ToInt32(txtProdSerialNo.Text); 
            com.Parameters.Add("@existingStock", SqlDbType.Int).Value = Convert.ToInt32(txtExistingStock.Text);
            com.Parameters.Add("@producedStock", SqlDbType.Int).Value = Convert.ToInt32(txtproducedStock.Text);
            com.Parameters.Add("@warehouseStock", SqlDbType.Int).Value = Convert.ToInt32(txtExistingStock.Text) + Convert.ToInt32(txtproducedStock.Text);
            com.Parameters.Add("@batchNo", SqlDbType.Int).Value = Convert.ToInt32(txtbatchNo.Text);
            com.Parameters.Add("@productStatus", SqlDbType.NVarChar).Value = txtproductStatus.Text;
        }

        try
        {
            com.ExecuteNonQuery();
            pSuccess.Visible = true;
            lblSuccess.Text = "Inventory has been updated";
            lblSuccess.Visible = true;
            btnUpdate.Visible = false;
            lblBTN.Text = "Back";


            txtbatchNo.Text = "";
            txtproducedStock.Text = "";

        }

        catch
        {
            pError.Visible = true;
            lblError.Text = "Error found!";
            lblError.Visible = true;
        }

        finally
        {
            con.Close();
            updateExisting();
        }

        updateExisting();

        getInventory(Convert.ToInt32(Session["invUpdate"]));
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL CAPSTONE/WarehouseManager/AddInventory.aspx");
    }

    void updateExisting()
    {
        selectUpdatedStock();

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "UPDATE Inventory SET existingStock=@existingStock WHERE inventoryID=@inventoryID";

        com.Parameters.Add("@inventoryID", SqlDbType.Int).Value = Convert.ToInt32(Session["inventoryID"].ToString());
        com.Parameters.Add("@existingStock", SqlDbType.Int).Value = Convert.ToInt32(Session["updatedWarehouseStock"].ToString());

        com.ExecuteNonQuery();
        con.Close();
    }

    void selectUpdatedStock()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT TOP 1 warehouseStock, inventoryID FROM Inventory ORDER BY inventoryID DESC";

        SqlDataReader dr = com.ExecuteReader();

        while (dr.Read())
        {
            Session["updatedWarehouseStock"] = dr["warehouseStock"].ToString();
            Session["inventoryID"] = dr["inventoryID"].ToString();
        }
        dr.Close();
        con.Close();
    }        
}