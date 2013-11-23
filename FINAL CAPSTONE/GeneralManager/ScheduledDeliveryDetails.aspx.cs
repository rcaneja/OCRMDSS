using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class GeneralManager_ScheduledDeliveryDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 4)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                if (Request.QueryString["orderID"] != null)//has orderID
                {
                    if (!IsPostBack)
                    {
                        Request.QueryString["orderID"].ToString();
                        getOrderSummary();
                        getOrderDetails();
                    }
                }
                else
                    Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/GeneralManager/ViewScheduledDeliveries.aspx");
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

    void getOrderSummary()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT SUM(Amount) AS Amount, SUM(Quantity) AS Quantity " +
            "FROM OrderDetails WHERE orderID=@orderID HAVING COUNT(*) > 0";
        com.Parameters.Add("@orderID", SqlDbType.Int).Value = Request.QueryString["orderID"];

        SqlDataReader data = com.ExecuteReader();
        if (data.HasRows)
        {
            while (data.Read())
            {
                lblOrderTQuantity.Text = "Total Quantity: " + data["Quantity"].ToString() + " kg";
                decimal price = decimal.Parse(data["Amount"].ToString());
                lblTOrderPrice.Text = "Total Price: " + price.ToString();
            }
        }
        else
        {
            lblTOrderPrice.Visible = false;
            lblOrderTQuantity.Visible = false;
        }
        con.Close();
    }

    void getOrderDetails()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM Orders WHERE orderID = @orderID ";
        com.Parameters.Add("@orderID", SqlDbType.Int).Value = Request.QueryString["orderID"];

        SqlDataReader data = com.ExecuteReader();
        if (data.HasRows)
        {
            while (data.Read())
            {
                lblOrderNo.Text = data["orderID"].ToString();
                lblOrderDate.Text = data["orderDate"].ToString();
                lblAmount.Text = data["amount"].ToString();
                lblDeliveryDate.Text = data["deliveryDate"].ToString();
                lblDeliveryMode.Text = data["deliveryMode"].ToString();
                lblOrderStatus.Text = data["orderStatus"].ToString();
                lblReadyForDelivery.Text = data["readyForDelivery"].ToString();
                lblDeiveryStatus.Text = data["deliveryStatus"].ToString();

                if (lblComments.Text == String.Empty)
                {
                    lblComments.Text = "No Special Instruction";
                }
                else
                {
                    lblComments.Text = data["concerns"].ToString();
                }
            }
        }
        else
        {
            lblNoti.Text = "You haven't selected an order to view its details.";
        }
        con.Close();
    }
}