using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class ProductDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] != null) //if existing user
        {
            myProfile.Visible = true;
            lblLoginStatus.Visible = true;
            lblLoginStatus.Text = "Logout";

            if (Request.QueryString["productID"] != null)
            {
                int productID = 0;
                bool isValid = int.TryParse(Request.QueryString["productID"].ToString(), out productID);
                if (isValid == false)
                    Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/404.aspx");
                else
                    GetProductInfo(Request.QueryString["productID"].ToString());
            }
            else
                Response.Redirect("http://localhost:12345/FINAL CAPSTONE/Products.aspx");
        }
        else
        {
            myProfile.Visible = false;
            lblLoginStatus.Text = "Login";

            if (Request.QueryString["productID"] != null)
            {
                int productID = 0;
                bool isValid = int.TryParse(Request.QueryString["productID"].ToString(), out productID);
                if (isValid == false)
                    Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/404.aspx");
                else
                    GetProductInfo(Request.QueryString["productID"].ToString());
            }
            else
                Response.Redirect("http://localhost:12345/FINAL CAPSTONE/Products.aspx");
        }
    }

    void GetProductInfo(string productID)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM dbo.Products A " +
            "INNER JOIN dbo.ProductClass B ON A.productClassID = B.productClassID " +
            "INNER JOIN dbo.ProductSubClass C ON A.productSubClassID = C.productSubClassID WHERE a.productID=@productID";
        com.Parameters.Add("@productID", SqlDbType.Int).Value = productID;
        SqlDataReader data = com.ExecuteReader();
        
        if (data.HasRows)
        {
            while (data.Read())
            {
                imgProduct.ImageUrl = data["productImage"].ToString();
                lblProductName.Text = data["productName"].ToString();
                lblProductClass.Text = data["productClassName"].ToString();
                lblSerialNo.Text = data["productSerialNo"].ToString();
                lblDescription.Text = data["productDescription"].ToString();
            }
            data.Close();
            con.Close();
        }
        else
        {
            Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/404.aspx");
        }
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

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Products.aspx");
    }
}