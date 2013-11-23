using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Customers_MyOrders : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 1)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
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

    protected void grdOrders_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["orderID"] = grdOrders.SelectedRow.Cells[0].Text;
    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        int orderID = int.Parse(Session["orderID"].ToString());
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Customers/OrderDetails.aspx?orderID=" + orderID.ToString());
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

    void countItem()
    {
        int numberOfRows = grdOrders.Rows.Count;
        lblNoOrders.Text = numberOfRows.ToString();
    }
}