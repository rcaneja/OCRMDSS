using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Customers_DeleteToCart : System.Web.UI.Page
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
                    DeleteProductToCart(Convert.ToInt32(Request.QueryString["productID"]));
                }
                else
                    Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Customers/ShoppingCart.aspx");
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

    void DeleteProductToCart(int productID)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandType = CommandType.Text;

        com.CommandText = "DELETE FROM ShoppingCart WHERE productID=@productID AND userID=@userID AND cartStatus=@cartStatus";
        com.Parameters.Add("@productID", SqlDbType.Int).Value = productID;
        com.Parameters.Add("@userID", SqlDbType.Int).Value = Convert.ToInt32(Session["userID"]);
        com.Parameters.Add("@cartStatus", SqlDbType.NVarChar).Value = "Pending";
        com.ExecuteNonQuery();

        con.Close();
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Customers/ShoppingCart.aspx");
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