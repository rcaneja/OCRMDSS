using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class GeneralManager_EditProducts : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    void GetProducts(string productID)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM Products WHERE productID=@productID";
        com.Parameters.Add("productID", SqlDbType.Int).Value = productID;

        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                txtProductName.Text = dr["productName"].ToString();
                ddlProductClassID.SelectedValue = dr["productClassID"].ToString();
                txtProductSubClassID.Text = dr["productSubClassID"].ToString();
                txtUnitPrice.Text = String.Format("{0:0,0}", dr["productUnitPrice"]);
                txtProductDescription.Text = dr["productDescription"].ToString();
                txtCriticalLevel.Text = dr["productCriticalLevel"].ToString();

                if (dr["productImage"] == DBNull.Value)
                {
                    imgProduct.ImageUrl = "http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/noImage.jpg";
                }
                else
                {
                    imgProduct.ImageUrl = dr["productImage"].ToString();
                }
            }
            dr.Close();
            con.Close();
        }
        else
        {
            Response.Redirect("http://localhost:12345/FINAL CAPSTONE/GeneralManager/ViewProducts.aspx");
        }

    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 4)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                if (Request.QueryString["productID"].ToString() != null)
                {
                    if (!IsPostBack)
                        GetProducts(Request.QueryString["productID"].ToString());

                    pError.Visible = false;
                    pSuccess.Visible = false;
                }
                else
                    Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/GeneralManager/ViewProducts.aspx");
            }
            else
                Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/WaitforConfirmation.aspx");
        }
        else
            Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Login.aspx");
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;

        com.CommandText = "UPDATE Products SET productName=@productName, productClassID=@productClassID, " +
            "productSubClassID=@productSubClassID, productImage=@productImage, productUnitPrice=@productUnitPrice, productDescription=@productDescription, " +
            "productCriticalLevel=@productCriticalLevel WHERE productID=@productID";

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
            com.Parameters.Add("@productImage", SqlDbType.Text).Value = imgProduct.ImageUrl;
        }

        com.Parameters.Add("@productUnitPrice", SqlDbType.Decimal).Value = Convert.ToDecimal(txtUnitPrice.Text);
        com.Parameters.Add("@productDescription", SqlDbType.Text).Value = txtProductDescription.Text;
        com.Parameters.Add("@productCriticalLevel", SqlDbType.Int).Value = Convert.ToInt32(txtCriticalLevel.Text);

        com.Parameters.Add("@productID", SqlDbType.Int).Value = Request.QueryString["productID"].ToString();

        try
        {
            com.ExecuteNonQuery();
            pSuccess.Visible = true;
            lblSuccess.Text = "Product has been updated!";
            lblSuccess.Visible = true;

            txtProductName.Enabled = false;
            txtCriticalLevel.Enabled = false;
            txtProductDescription.Enabled = false;
            fuProductImage.Enabled = false;
            txtProductSubClassID.Enabled = false;
            txtUnitPrice.Enabled = false;
            ddlProductClassID.Enabled = false;
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

        btnSave.Visible = false;
        btnCancel.Text = "Back";
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/GeneralManager/ViewProducts.aspx");
    }
}