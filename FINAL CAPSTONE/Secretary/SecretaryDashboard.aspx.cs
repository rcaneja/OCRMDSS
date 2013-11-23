using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Secretary_SecretaryDashboard : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 2)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                lblCustomerCount.Text = Convert.ToString(grdCustomers.Rows.Count) + " new";
                lblDeliveryCount.Text = Convert.ToString(grdDeliveryStatus.Rows.Count) + " new";
                lblFeedbackCount.Text = Convert.ToString(grdCustomersFeedback.Rows.Count) + " new";
                lblInquiriesCount.Text = Convert.ToString(grdCustomersInqury.Rows.Count) + " new";
                lblOrdersCount.Text = Convert.ToString(grdOrders.Rows.Count) + " new";
                lblPaymentCount.Text = Convert.ToString(grdPayment.Rows.Count) + " new";
            }
            else
            {
                Response.Redirect("http://localhost:12345/FINAL CAPSTONE/WaitforConfirmation.aspx");
            }
        }
        else
        {
            Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Login.aspx");
        }
    }
}