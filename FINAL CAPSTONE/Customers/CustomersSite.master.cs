using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Customers_CustomersSite : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 1)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                myProfile.Visible = true;
                lblLoginStatus.Visible = true;
                lblLoginStatus.Text = "Logout";

                countItem();
                GetCartSummary();
            }
            else
            {
                lblLoginStatus.Text = "Login";
                Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/WaitforConfirmation.aspx");
            }

        }
        else
        {
            Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Home.aspx");
            myProfile.Visible = false;
            lblLoginStatus.Text = "Login";
        }
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
                lblTQuantity.Text = "Total Quantity: " + String.Format("{0:0,0}", data["Quantity"]) + " kg";
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
}
