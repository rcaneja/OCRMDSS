using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Customers_ShoppingCart : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 1)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                GetCartSummary();
                getUser();
                countItem();
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

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        int productID = int.Parse(Session["productID"].ToString());
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Customers/EditQuantity.aspx?productID=" + productID.ToString());
    }

    protected void grdShoppingCart_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["productID"] = grdShoppingCart.SelectedRow.Cells[0].Text;
    }

    protected void btnRemoveAll_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "DELETE FROM ShoppingCart WHERE userID=@userID AND cartStatus=@cartStatus";
        com.Parameters.Add("@userID", SqlDbType.Int).Value = Convert.ToInt32(Session["userID"]);
        com.Parameters.Add("@cartStatus", SqlDbType.NVarChar).Value = "Pending";
        com.ExecuteNonQuery();
        con.Close();
        btnRemoveAll.Visible = false;
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Customers/ShoppingCart.aspx");
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
                decimal price = decimal.Parse(data["Amount"].ToString());
                lblTPrice.Text = "Total Price: " + String.Format("{0:#,##0.00}", price);
            }
        }
        else
        {
            lblTPrice.Visible = false;
            lblTQuantity.Visible = false;
        }
        con.Close();

        if (grdShoppingCart.Rows.Count == 0)
        {
            btnCheckout.Visible = false;
            btnModalRemoveAll.Visible = false;
        }
        else
        {
            btnCheckout.Visible = true;
            btnModalRemoveAll.Visible = true;
        }
    }

    void getUser()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT B.userID FROM dbo.CustomersInfo AS A INNER JOIN dbo.Users AS B ON A.userName=B.userName WHERE B.userName=@userName";
        com.Parameters.Add("@userName", SqlDbType.NVarChar).Value = Session["userName"].ToString();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Session["userID"] = dr["userID"].ToString();
        }
        dr.Close();
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

    void countItem()
    {
        int numberOfRows = grdShoppingCart.Rows.Count;
        lblItemCount.Text = numberOfRows.ToString() + " Items";
    }
}