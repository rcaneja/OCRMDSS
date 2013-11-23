
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class WarehouseManager_UpdateDeliveryStatus : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());
    DataSet dsDetail = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 3)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                checkStatus();
                if (Request.QueryString["orderID"] != null)//has orderID
                {
                    getOrderSummary();
                    getOrderDetails();

                    if (Session["status"].ToString() == "Delivered" || Session["status"].ToString() == "Picked Up")
                    {
                        btnDelivered.Visible = false;
                        btnPickedUp.Visible = false;

                        btnCancel.Visible = true;
                        btnCancel.Text = "Back";
                    }
                }
                else
                {
                    Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/WarehouseManager/DeliveryStatus.aspx");
                }
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

    protected void btnDelivered_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "UPDATE Orders SET deliveryStatus='Delivered' FROM Orders WHERE orderID = @orderID ";

        com.Parameters.Add("@orderID", SqlDbType.Int).Value = Request.QueryString["orderID"];

        try
        {
            com.ExecuteNonQuery();
            lblNoti.Text = "Customers orders has been delivered";
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
            selectOrderDetails();
        }
        selectOrderDetails();
        btnDelivered.Visible = false;
        btnPickedUp.Visible = false;
        btnCancel.Text = "Back";
    }
    protected void btnPickedUp_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "UPDATE Orders SET deliveryStatus='Picked Up' FROM Orders WHERE orderID = @orderID ";

        com.Parameters.Add("@orderID", SqlDbType.Int).Value = Request.QueryString["orderID"];

        try
        {
            com.ExecuteNonQuery();
            lblNoti.Text = "Customers orders has been picked up!";
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
            selectOrderDetails();
        }
        btnDelivered.Visible = false;
        btnPickedUp.Visible = false;
        btnCancel.Text = "Back";
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL CAPSTONE/WarehouseManager/DeliveryStatus.aspx");
    }

    void checkStatus()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT deliveryStatus FROM dbo.Orders WHERE orderID=@orderID";
        com.Parameters.Add("@orderID", SqlDbType.NVarChar).Value = Request.QueryString["orderID"];
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Session["status"] = dr["deliveryStatus"].ToString();
        }
        dr.Close();
        con.Close();
    }


    void selectOrderDetails()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT productSerialNo FROM OrderDetails WHERE orderID=@orderID";

        com.Parameters.Add("@orderID", SqlDbType.NVarChar).Value = Request.QueryString["orderID"];

        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        grd.DataSource = ds;
        grd.DataBind();

        con.Close();

        for (int nRow = 0; nRow <= grd.Rows.Count - 1; nRow++)
        {
            string prodSerial = grd.Rows[nRow].Cells[0].Text;

            con.Close();
            con.Open();
            SqlCommand Updatecom = new SqlCommand();
            Updatecom.Connection = con;

            Updatecom.CommandText = "UPDATE Inventory SET existingStock= " +
                    "((SELECT TOP 1 existingStock FROM Inventory WHERE productSerialNo=" + prodSerial + " ORDER BY inventoryID DESC) - (SELECT quantity FROM OrderDetails WHERE productSerialNo=" +
                    prodSerial + " AND orderID=" + Request.QueryString["orderID"] + ")/2) " +
                    "WHERE inventoryID=(SELECT TOP 1 inventoryID FROM Inventory WHERE productSerialNo=" + prodSerial + " ORDER BY inventoryID DESC)";
            Updatecom.ExecuteNonQuery();
            con.Close();
        }
    }
}