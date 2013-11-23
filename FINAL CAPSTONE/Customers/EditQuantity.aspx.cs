using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Customers_EditQuantity : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] != null) //if existing user
        {
            myProfile.Visible = true;
            lblLoginStatus.Visible = true;
            lblLoginStatus.Text = "Logout";
            lblUnitPrice.Visible = true;
            btnUpdateShoppingCart.Visible = true;
            lblCurrentQuantity.Visible = true;

         if (Request.QueryString["productID"] != null)
             GetProductInfo(Request.QueryString["productID"]);
         else
             Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Home.aspx");
        }
        else
        {
            myProfile.Visible = false;
            lblLoginStatus.Text = "Login";
            lblUnitPrice.Visible = false;
            lblCurrentQuantity.Enabled = false;
            txtUpdatedQuantity.Enabled = false;
            btnUpdateShoppingCart.Visible = false;
        }

    }

    void GetProductInfo(string productID)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM dbo.ShoppingCart AS A " +
            "INNER JOIN dbo.Products AS B  ON A.productID = B.productID " +
            "INNER JOIN dbo.ProductClass AS C ON B.productClassID = C.productClassID " +
            "INNER JOIN dbo.ProductSubClass AS D ON B.productSubClassID = D.productSubClassID WHERE A.productID=@productID";
        com.Parameters.Add("@productID", SqlDbType.Int).Value = productID;
        SqlDataReader data = com.ExecuteReader();
        while (data.Read())
        {
            imgProduct.ImageUrl = data["productImage"].ToString();
            lblProductName.Text = data["productName"].ToString();
            lblProductClass.Text = data["productClassName"].ToString();
            lblSerialNo.Text = data["productSerialNo"].ToString();
            lblDescription.Text = data["productDescription"].ToString();
            lblUnitPrice.Text = data["productUnitPrice"].ToString() + " per kilogram";
            lblCurrentQuantity.Text = data["quantity"].ToString() + " kg in your Cart";
            Session["userID"] = data["userID"].ToString();
            Session["unitPrice"] = data["productUnitPrice"].ToString();
        }
        data.Close();
        con.Close();
    }

    protected void lblLoginStatus_Click(object sender, EventArgs e)
    {
         if (Session["name"] != null)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Home.aspx");
        }
        else
        {
            Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Login.aspx");
        }
    }

    protected void btnUpdateShoppingCart_Click(object sender, EventArgs e)
    {
        int quantity = GetQuantity(int.Parse(Request.QueryString["productID"].ToString()));
        UpdateQtyFromCart(int.Parse(Request.QueryString["productID"].ToString()));
    }
    protected void btnCancelShoppingCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Customers/ShoppingCart.aspx");
    }

    private int GetQuantity(int productID)
    {
        int quantity = 0;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT quantity FROM ShoppingCart WHERE productID=@productID AND userID=@userID AND cartStatus=@cartStatus";
        com.Parameters.Add("@userID", SqlDbType.NVarChar).Value = Session["userID"];
        com.Parameters.Add("@productID", SqlDbType.Int).Value = productID;
        com.Parameters.Add("@cartStatus", SqlDbType.NVarChar).Value = "Pending";

        if (com.ExecuteScalar() != null)
            quantity = (int)com.ExecuteScalar();
        else
            quantity = 0;

        con.Close();
        return quantity;
    }

    void UpdateQtyFromCart(int productID)
    {

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "UPDATE ShoppingCart SET quantity=@quantity, amount=@amount WHERE productID=@productID AND userID=@userID AND cartStatus=@cartStatus";
        com.Parameters.Add("@productID", SqlDbType.Int).Value = productID;
        com.Parameters.Add("@quantity", SqlDbType.Int).Value = txtUpdatedQuantity.Text;
        com.Parameters.Add("@cartStatus", SqlDbType.NVarChar).Value = "Pending";
        com.Parameters.Add("@userID", SqlDbType.Int).Value = Convert.ToInt32(Session["userID"]);
        com.Parameters.Add("@amount", SqlDbType.Decimal).Value = Convert.ToDecimal(Session["unitPrice"]) * Convert.ToDecimal(txtUpdatedQuantity.Text);
        com.ExecuteNonQuery();
        con.Close();
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Customers/ShoppingCart.aspx");
    }

}