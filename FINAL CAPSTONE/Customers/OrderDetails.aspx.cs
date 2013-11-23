using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Customers_OrderDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 1)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                if (Request.QueryString["orderID"] != null)//has orderID
                {
                    GetOrderSummary(Request.QueryString["orderID"]);
                    GetOrderDetails(Request.QueryString["orderID"]);
                }
                else
                    Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Customers/MyOrders.aspx");
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

    void GetOrderDetails(string orderID)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;

        com.CommandText = "SELECT * FROM OrderDetails AS A INNER JOIN Products AS B ON A.productID = B.productID " +
                "INNER JOIN ProductClass AS C ON B.productClassID = C.productClassID " +
                "INNER JOIN ProductSubClass AS D ON B.productSubClassID = D.productSubClassID " +
                "WHERE ([orderID] = @orderID)";

        com.Parameters.Add("@orderID", SqlDbType.NVarChar).Value = orderID;

        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);
        grdOrderDetails.DataSource = ds;
        grdOrderDetails.DataBind();

        con.Close();
    }

    void GetOrderSummary(string orderID)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT SUM(Amount) AS Amount, SUM(Quantity) AS Quantity " +
            "FROM OrderDetails WHERE orderID=@orderID HAVING COUNT(*) > 0";
        com.Parameters.Add("@orderID", SqlDbType.Int).Value = orderID;

        SqlDataReader data = com.ExecuteReader();
        if (data.HasRows)
        {
            while (data.Read())
            {
                lblOrderTQuantity.Text = "Total Quantity: " + String.Format("{0:0,0}", data["Quantity"]) + " kg";
                decimal price = decimal.Parse(data["Amount"].ToString());
                lblTOrderPrice.Text = "Total Price: " + String.Format("{0:#,##0.00}", price);
            }

            con.Close();
        }
        else
        {
            lblTOrderPrice.Visible = false;
            lblOrderTQuantity.Visible = false;
            Response.Redirect("http://localhost:12345/FINAL CAPSTONE/404.aspx");
        }
    }   
}