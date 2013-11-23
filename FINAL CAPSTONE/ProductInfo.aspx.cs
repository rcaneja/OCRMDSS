using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class ProductInfo : System.Web.UI.Page
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

            if (Convert.ToInt32(Session["userType"]) != 1)
                btnModal.Visible = false;
        }
        else
        {
            myProfile.Visible = false;
            lblLoginStatus.Text = "Login";
            lblUnitPrice.Visible = false;
            txtQuantity.Enabled = false;
            btnAddToCart.Visible = false;
            btnModal.Visible = false;
        }

        int productID = 0;
        bool isValid = int.TryParse(Request.QueryString["productID"].ToString(),out productID);
        if (isValid == false)           // not a valid category ID
            Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/404.aspx");
        else
        {
            GetProductInfo(Request.QueryString["productID"].ToString());
            ModalProductInfo(Request.QueryString["productID"].ToString());
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
                lblUnitPrice.Text = data["productUnitPrice"].ToString() + " per kilogram";

            }
            data.Close();
            con.Close();
        }
        else
        {
            Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/404.aspx");
        }
    }

    void ModalProductInfo(string productID)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM dbo.Products A " +
            "INNER JOIN dbo.ProductClass B ON A.productClassID = B.productClassID " +
            "INNER JOIN dbo.ProductSubClass C ON A.productSubClassID = C.productSubClassID WHERE a.productID=@productID";
        com.Parameters.Add("@productID", SqlDbType.Int).Value = productID;
        
        SqlDataReader data = com.ExecuteReader();

        lvProducts.DataSource = data;
        lvProducts.DataBind();

        data.Close();
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

    protected void btnAddToCart_Click(object sender, EventArgs e)
    {
        if (Convert.ToString(txtQuantity.Text) != "")
        {
            if (int.Parse(txtQuantity.Text) != 0)
            {
                int productID = int.Parse(Request.QueryString["productID"].ToString());
                Session["quantity"] = txtQuantity.Text;
                Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Customers/AddToCart.aspx?productID=" + productID.ToString());
            }
            else
            {
                lblNoti.Visible = true;
                lblNoti.Text = "Enter a quantity before adding to your shopping cart";
            }
        }
        else
        {
            lblNoti.Visible = true;
            lblNoti.Text = "Enter a quantity before adding to your shopping cart";
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Products.aspx");
    }
}