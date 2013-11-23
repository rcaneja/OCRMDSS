using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Customers_AddToCart : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 1)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                getUser();
                if (Request.QueryString["productID"] != null) //if there is a selection of product
                {
                    bool isExisting = isProductExisting(int.Parse(Request.QueryString["productID"].ToString()));

                    int quantity = GetQuantity(int.Parse(Request.QueryString["productID"].ToString()));

                    GetUnitPrice(int.Parse(Request.QueryString["productID"].ToString()));

                    if (Session["quantity"] != null) //if there is product selected and quantity 
                    {
                        if (isExisting)
                        {
                            UpdateQtyFromCart(int.Parse(Request.QueryString["productID"].ToString()), quantity + int.Parse(Session["quantity"].ToString()));
                        }
                        else
                        {
                            AddProductToCart(int.Parse(Request.QueryString["productID"].ToString()), int.Parse(Session["quantity"].ToString()));
                        }
                    }
                    else
                    {
                        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/ProductInfo.aspx?productID=" + Request.QueryString["productID"]);
                    }
                }
                else
                    Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Products.aspx");
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

    void AddProductToCart(int productID, int quantity)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "INSERT INTO ShoppingCart VALUES (@userID, @productID, @quantity, @amount, @dateCreated, @cartStatus)";
        com.Parameters.Add("@userID", SqlDbType.Int).Value = Convert.ToInt32(Session["userID"]);
        com.Parameters.Add("@productID", SqlDbType.Int).Value = productID;
        com.Parameters.Add("@quantity", SqlDbType.Int).Value = quantity;
        com.Parameters.Add("@amount", SqlDbType.Decimal).Value = Convert.ToDecimal(Session["unitPrice"]) * Convert.ToDecimal(quantity);
        com.Parameters.Add("@dateCreated", SqlDbType.DateTime).Value = DateTime.Now;
        com.Parameters.Add("@cartStatus", SqlDbType.NVarChar).Value = "Pending";
        com.ExecuteNonQuery();
        con.Close();
        Session["quantity"] = null;
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Products.aspx");
    }

    void UpdateQtyFromCart(int productID, int quantity)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "UPDATE ShoppingCart SET quantity=@quantity, amount=@amount WHERE productID=@productID AND userID=@userID AND cartStatus=@cartStatus";
        com.Parameters.Add("@productID", SqlDbType.Int).Value = productID;
        com.Parameters.Add("@quantity", SqlDbType.Int).Value = quantity;
        com.Parameters.Add("@cartStatus", SqlDbType.NVarChar).Value = "Pending";
        com.Parameters.Add("@userID", SqlDbType.Int).Value = Convert.ToInt32(Session["userID"]);
        com.Parameters.Add("@amount", SqlDbType.Decimal).Value = Convert.ToDecimal(Session["unitPrice"]) * Convert.ToDecimal(quantity);
        com.ExecuteNonQuery();
        con.Close();
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Products.aspx");
    }

    private bool isProductExisting(int productID)
    {
        bool isExisting = true;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM ShoppingCart WHERE productID=@productID AND userID=@userID AND cartStatus=@cartStatus";
        com.Parameters.Add("@productID", SqlDbType.Int).Value = productID;
        com.Parameters.Add("@userID", SqlDbType.Int).Value = Convert.ToInt32(Session["userID"]);
        com.Parameters.Add("@cartStatus", SqlDbType.NVarChar).Value = "Pending";

        SqlDataReader data = com.ExecuteReader();
        if (data.HasRows)
            isExisting = true;
        else
            isExisting = false;
        con.Close();
        return isExisting;
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

    void GetUnitPrice(int productID)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT productUnitPrice FROM Products WHERE productID=@productID";
        com.Parameters.Add("@productID", SqlDbType.Int).Value = productID;
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Session["unitPrice"] = dr["productUnitPrice"].ToString();
        }
        dr.Close();
        con.Close();
    }

    void getUser()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT A.userID FROM dbo.ShoppingCart AS A INNER JOIN dbo.Users AS B ON A.userID=B.userID WHERE B.userName=@userName";
        com.Parameters.Add("@userName", SqlDbType.NVarChar).Value = Session["userName"].ToString();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Session["userID"] = dr["userID"].ToString();
        }
        dr.Close();
        con.Close();
    }
}