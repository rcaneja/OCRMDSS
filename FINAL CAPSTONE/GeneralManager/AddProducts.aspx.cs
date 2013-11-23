using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class GeneralManager_AddProducts : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 4)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                pError.Visible = false;
                pSuccess.Visible = false;
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

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "INSERT INTO Products VALUES (@productSerialNo, @productName, @productClassID, " +
        "@productSubClassID, @productImage, @productUnitPrice, @productDescription, @productCriticalLevel)";

        com.Parameters.Add("@productSerialNo", SqlDbType.NVarChar).Value = txtProductSerialNo.Text;
        com.Parameters.Add("@productName", SqlDbType.NVarChar).Value = txtProductName.Text;
        com.Parameters.Add("@productClassID", SqlDbType.NVarChar).Value = ddlProductClassID.SelectedValue;
        com.Parameters.Add("@productSubClassID", SqlDbType.NVarChar).Value = txtProductSubClassID.Text;
        
        if (fuProductImage.HasFile)
        {
            com.Parameters.Add("@productImage", SqlDbType.Text).Value = "http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/" + fuProductImage.FileName;
            fuProductImage.SaveAs(Server.MapPath("../assets/img/Products/" + fuProductImage.FileName));
        }
        else
        {
            com.Parameters.Add("@productImage", SqlDbType.Text).Value = "http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/noImage";
        } 

        com.Parameters.Add("@productUnitPrice", SqlDbType.Decimal).Value = txtUnitPrice.Text;
        com.Parameters.Add("@productDescription", SqlDbType.Text).Value = txtProductDescription.Text;
        com.Parameters.Add("@productCriticalLevel", SqlDbType.Int).Value = txtCriticalLevel.Text;

        try
        {
            com.ExecuteNonQuery();
            pSuccess.Visible = true;
            lblSuccess.Text = "Product has been added!";
            lblSuccess.Visible = true;

            Helper.ClearTextboxes(this.Controls);

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
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/GeneralManager/ViewProducts.aspx");
    }
}