using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Secretary1_OrderDetails : System.Web.UI.Page
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
                        getOrderSummary();
                        getOrderDetails(Request.QueryString["orderID"].ToString());

                        if (Session["status"].ToString() != "Pending")
                        {
                            btnCancel.Text = "Back";
                            btnInvalidate.Visible = false;
                            btnValidate.Visible = false;
                        }
                        btnCancel.Visible = true;
                        btnInvalidate.Visible = true;
                        btnValidate.Visible = true;
                        pError.Visible = false;
                        pSuccess.Visible = false;
                    }
                }
                else
                    Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Secretary/ViewOrders.aspx");
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
                lblDeiveryStatus.Text = data["deliveryStatus"].ToString();
                txtFinalDeliveryDate.Text = String.Format("{0:MMMM dd, yyyy}", Convert.ToDateTime(data["preferredDelivery"].ToString()));
                ddlDeliveryMode.SelectedValue = data["deliveryMode"].ToString();

                if (lblComments.Text == String.Empty)
                {
                    lblComments.Text = "No Comment";
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
            lblError.Text = "You haven't selected an order to view its details.";
        }
        con.Close();
    }
    protected void btnValidate_Click(object sender, EventArgs e)
    {
        if (txtFinalDeliveryDate.Text != "" && ddlDeliveryMode.SelectedValue != null && Convert.ToDateTime(txtFinalDeliveryDate.Text) >= DateTime.Today)
        {
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "UPDATE Orders SET validation=@validation, deliveryDate=@deliveryDate, deliveryMode=@deliveryMode FROM Orders AS A INNER JOIN OrderDetails AS B " +
                    "ON A.orderID = B.orderID WHERE A.orderID=@orderID";

            com.Parameters.Add("@deliveryDate", SqlDbType.DateTime).Value = Convert.ToDateTime(txtFinalDeliveryDate.Text);
            com.Parameters.Add("@deliveryMode", SqlDbType.NVarChar).Value = ddlDeliveryMode.SelectedValue.ToString();
            com.Parameters.Add("@orderID", SqlDbType.Int).Value = Request.QueryString["orderID"];
            com.Parameters.Add("@validation", SqlDbType.NVarChar).Value = "Validated";
            
            try
            {
                com.ExecuteNonQuery();
                pSuccess.Visible = true;   
                lblSuccess.Text = "Sale Order has been Validated!";
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

            btnValidate.Visible = false;
            btnInvalidate.Visible = false;
            btnCancel.Text = "Back";
        }
        else
        {
            pError.Visible = true;
            lblError.Text = "You have selected a final delivery that is already in the past. Change your inputs.";
            lblError.Visible = true;
        }
    }
    protected void btnInvalidate_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;

        com.CommandText = "UPDATE Orders SET validation=@validation, deliveryDate=@deliveryDate, deliveryMode=@deliveryMode FROM Orders AS A INNER JOIN OrderDetails AS B " +
                 "ON A.orderID = B.orderID WHERE A.orderID=@orderID";

        com.Parameters.Add("@deliveryDate", SqlDbType.DateTime).Value = Convert.ToDateTime(txtFinalDeliveryDate.Text);
        com.Parameters.Add("@deliveryMode", SqlDbType.NVarChar).Value = ddlDeliveryMode.SelectedValue.ToString();
        com.Parameters.Add("@orderID", SqlDbType.Int).Value = Request.QueryString["orderID"];
        com.Parameters.Add("@validation", SqlDbType.NVarChar).Value = "Invalidated";

        try
        {
            com.ExecuteNonQuery();
            pSuccess.Visible = true;
            lblSuccess.Text = "Sales order has been Invalidated!";
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

        btnValidate.Visible = false;
        btnInvalidate.Visible = false;
        btnCancel.Text = "Back";
    }

    void checkStatus()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;

        com.CommandText = "SELECT validation FROM Orders WHERE orderID='" + Request.QueryString["orderID"].ToString() + "'";

        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Session["status"] = dr["validation"].ToString();
        }
        dr.Close();
        con.Close();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL CAPSTONE/Secretary/ViewOrders.aspx");
    }
}