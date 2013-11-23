using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Products : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] != null)
        {
            myProfile.Visible = true;
            lblLoginStatus.Visible = true;
            lblLoginStatus.Text = "Logout";

            GetCategories();
            if (Request.QueryString["productClassID"] != null)
            {
                GetProducts(Request.QueryString["productClassID"].ToString());
            }
            else
            {
                GetProducts();
            }
            countItem();
            GetCartSummary();

            if (Convert.ToInt32(Session["userType"]) != 1)
            {
                btnCheckout.Visible = false;
                btnViewShoppingCart.Visible = false;
            }
        }

        else
        {
            myProfile.Visible = false;
            btnCheckout.Visible = false;
            btnViewShoppingCart.Visible = false;
            lblLoginStatus.Text = "Login";

            GetCategories();
            if (Request.QueryString["productClassID"] != null)
            {
                GetProducts(Request.QueryString["productClassID"].ToString());
            }
            else
            {
                GetProducts();
            }
        }

        countItem();
    }

    private void GetProducts()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM dbo.Products A " +
            "INNER JOIN dbo.ProductClass B ON A.productClassID = B.productClassID " +
            "INNER JOIN dbo.ProductSubClass C ON A.productSubClassID = C.productSubClassID";
        SqlDataReader dr = com.ExecuteReader();
        lvProducts.DataSource = dr;
        lvProducts.DataBind();
        con.Close();
    }

    void GetCategories()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT productClassID FROM ProductClass";
        SqlDataReader data = com.ExecuteReader();
        lvProductClass.DataSource = data;
        lvProductClass.DataBind();
        con.Close();
    }

    void GetProducts(string productClassID)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM dbo.Products AS A " +
            "INNER JOIN dbo.ProductClass AS B ON A.productClassID = B.productClassID " +
            "INNER JOIN dbo.ProductSubClass AS C ON A.productSubClassID = C.productSubClassID " +
            "WHERE A.productClassID=@productClassID";
        com.Parameters.Add("@productClassID", SqlDbType.NVarChar).Value = productClassID.ToString();
        
        SqlDataReader dr = com.ExecuteReader();
        lvProducts.DataSource = dr;
        lvProducts.DataBind();

        if (lvProducts.Items.Count == 0)
        {
            Response.Redirect("http://localhost:12345/FINAL CAPSTONE/404.aspx");
        }

        con.Close();
    }

    protected void lblLoginStatus_Click(object sender, EventArgs e)
    {
        if (Session["userName"] != null)
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

    void countItem()
    {
        int numberOfRows = grdShoppingCart.Rows.Count;
        lblItemCount.Text = numberOfRows.ToString() + " Items";
    }

    void GetCartSummary()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT SUM(Amount) AS Amount, SUM(Quantity) AS Quantity " +
            "FROM ShoppingCart WHERE userID=@userID AND cartStatus=@cartStatus HAVING COUNT(*) > 0";
        com.Parameters.Add("@userID", SqlDbType.Int).Value = Session["userID"];
        com.Parameters.Add("@cartStatus", SqlDbType.NVarChar).Value = "Pending";

        SqlDataReader data = com.ExecuteReader();
        if (data.HasRows)
        {
            while (data.Read())
            {
                lblTQuantity.Text = "Total Quantity: " + data["Quantity"].ToString() + " kg";
                double price = double.Parse(data["Amount"].ToString());
                lblTPrice.Text = "Total Price: " + String.Format("{0:#,##0.00}", price);
            }
        }
        else
        {
            lblTPrice.Visible = false;
            lblTQuantity.Visible = false;
        }
        con.Close();
    }

    protected void btnViewShoppingCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Customers/ShoppingCart.aspx");
    }

    protected void btnCheckout_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Customers/Checkout.aspx");
    }

    protected void myProfile_Click(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 1)
            Response.Redirect("http://localhost:12345/FINAL CAPSTONE/Customers/MyProfile.aspx");
        else if (Convert.ToInt32(Session["userType"]) == 2)
            Response.Redirect("http://localhost:12345/FINAL CAPSTONE/Secretary/MyProfile.aspx");
        else if (Convert.ToInt32(Session["userType"]) == 3)
            Response.Redirect("http://localhost:12345/FINAL CAPSTONE/WarehouseManager/MyProfile.aspx");
        else if (Convert.ToInt32(Session["userType"]) == 4)
            Response.Redirect("http://localhost:12345/FINAL CAPSTONE/GeneralManager/MyProfile.aspx");
        else if (Convert.ToInt32(Session["userType"]) == 5)
            Response.Redirect("http://localhost:12345/FINAL CAPSTONE/Admin/MyProfile.aspx");
    }
    protected void lvProducts_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}