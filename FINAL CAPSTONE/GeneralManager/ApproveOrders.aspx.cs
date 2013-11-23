using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class GeneralManager_ApproveOrders : System.Web.UI.Page
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
                    checkStatus();
                    if (!IsPostBack)
                    {
                        pError.Visible = false;
                        pSuccess.Visible = false;

                        getOrderSummary(Request.QueryString["orderID"].ToString());
                        getOrderDetails(Request.QueryString["orderID"].ToString());

                        if (Session["status"] != "Pending")
                        {
                            btnCancel.Text = "Back";
                            btnApproved.Visible = false;
                            btnDisapproved.Visible = false;
                        }
                        btnCancel.Visible = true;
                        btnApproved.Visible = true;
                        btnDisapproved.Visible = true;
                    }
                }
                else
                    Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/GeneralManager/ViewOrders.aspx");
            }
            else
                Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/WaitforConfirmation.aspx");
        }
        else
            Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Home.aspx");
    }

    void getOrderSummary(string orderID)
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

    void getOrderDetails(string orderID)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM Orders WHERE orderID = @orderID ";
        com.Parameters.Add("@orderID", SqlDbType.Int).Value = orderID;

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
                lblDeliveryStatus.Text = data["deliveryStatus"].ToString();

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
            pError.Visible = true;
            lblError.Visible = true;
            lblError.Text = "You haven't selected an order to view its details.";
        }
        con.Close();
    }

    void checkStatus()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;

        com.CommandText = "SELECT orderStatus FROM Orders WHERE orderID='" + Request.QueryString["orderID"].ToString() + "'";

        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Session["status"] = dr["orderStatus"].ToString();
        }
        dr.Close();
        con.Close();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL CAPSTONE/GeneralManager/ViewOrders.aspx");
    }
    protected void btnApproved_Click(object sender, EventArgs e)
    {
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "UPDATE Orders SET orderStatus=@orderStatus FROM Orders AS A INNER JOIN OrderDetails AS B " +
                    "ON A.orderID = B.orderID WHERE A.orderID=@orderID";

            com.Parameters.Add("@orderID", SqlDbType.Int).Value = Request.QueryString["orderID"];
            com.Parameters.Add("@orderStatus", SqlDbType.NVarChar).Value = "Approved";

            try
            {
                com.ExecuteNonQuery();
                pSuccess.Visible = true;
                lblSuccess.Text = "Sale Order has been Approved!";
                lblSuccess.Visible = true;
            }

            catch
            {
                pError.Visible = true;
                lblError.Text = "Error found!";
                lblError.Visible = true;
            }

            finally
            {
                con.Close();
            }

            btnApproved.Visible = false;
            btnDisapproved.Visible = false;
            btnCancel.Text = "Back";
    }
    protected void btnDisapproved_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;

        com.CommandText = "UPDATE Orders SET orderStatus=@orderStatus FROM Orders AS A INNER JOIN OrderDetails AS B " +
                 "ON A.orderID = B.orderID WHERE A.orderID=@orderID";

        com.Parameters.Add("@orderID", SqlDbType.Int).Value = Request.QueryString["orderID"];
        com.Parameters.Add("@orderStatus", SqlDbType.NVarChar).Value = "Disapproved";

        try
        {
            com.ExecuteNonQuery();
            pSuccess.Visible = true;
            lblSuccess.Text = "Sales order has been Rejected!";
            lblSuccess.Visible = true;
        }

        catch
        {
            pError.Visible = true;
            lblError.Text = "Error found!";
            lblError.Visible = true;
        }

        finally
        {
            con.Close();
        }

        btnApproved.Visible = false;
        btnDisapproved.Visible = false;
        btnCancel.Text = "Back";
    }
}