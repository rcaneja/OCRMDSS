using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Secretary1_UpdatePaymentStatus : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 2)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                if (Request.QueryString["orderID"] != null)//has orderID
                {
                    checkStatus();
                    if (!IsPostBack)
                    {
                        Request.QueryString["orderID"].ToString();
                            getOrderSummary();
                            getOrderDetails();

                        if (Session["status"].ToString() == "Paid")
                        {
                            btnPaid.Visible = false;
                            btnUnpaid.Visible = false;
                        }
                    }
                }
                else
                    Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Secretary/SearchOrders.aspx");
            }
            else
                Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/WaitforConfirmation.aspx");
        }
        else
            Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Home.aspx");     
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
    protected void btnPaid_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "UPDATE Orders SET paymentStatus=@paymentStatus, paymentReceiptNo=@paymentReceiptNo FROM Orders AS A INNER JOIN OrderDetails AS B " +
                "ON A.orderID = B.orderID WHERE A.orderID=@orderID";

        com.Parameters.Add("@orderID", SqlDbType.Int).Value = Request.QueryString["orderID"].ToString();
        com.Parameters.Add("@paymentStatus", SqlDbType.NVarChar).Value = "Paid";
        com.Parameters.Add("@paymentReceiptNo", SqlDbType.NVarChar).Value = txtReceiptNo.Text;

        try
        {
            com.ExecuteNonQuery();
            lblNoti.Text = "The order has been paid.";
            lblNoti.Visible = true;
        }

        catch
        {
            lblNoti.Text = "Error found!";
            lblNoti.Visible = true;
        }

        finally
        {
            con.Close();
        }

        btnPaid.Visible = false;
        btnUnpaid.Visible = false;
    }
    protected void btnUnpaid_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;

        com.CommandText = "UPDATE Orders SET paymentStatus=@paymentStatus FROM Orders AS A INNER JOIN OrderDetails AS B " +
                 "ON A.orderID = B.orderID WHERE A.orderID=@orderID";

        com.Parameters.Add("@orderID", SqlDbType.Int).Value = Request.QueryString["orderID"].ToString();
        com.Parameters.Add("@paymentStatus", SqlDbType.NVarChar).Value = "Unpaid";

        try
        {
            com.ExecuteNonQuery();
            lblNoti.Text = "This order has not yet been paid.";
            lblNoti.Visible = true;
        }

        catch
        {
            lblNoti.Text = "Error found!";
            lblNoti.Visible = true;
        }

        finally
        {
            con.Close();
        }

        btnPaid.Visible = false;
        btnUnpaid.Visible = false;
    }

    void checkStatus()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;

        com.CommandText = "SELECT paymentStatus FROM Orders WHERE orderID='" + Request.QueryString["orderID"].ToString() + "'";

        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Session["status"] = dr["paymentStatus"].ToString();
        }
        dr.Close();
        con.Close();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL CAPSTONE/Secretary/ViewPaymentStatus.aspx");
    }
}