using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Customers_Checkout : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 1)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                GetCartSummary();
                GetProfile();
                pError.Visible = false;
                pSuccess.Visible = false;
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
                Session["TAmount"] = price.ToString();
            }
        }
        else
        {
            lblTPrice.Visible = false;
            lblTQuantity.Visible = false;
        }
        con.Close();
    }

    void GetProfile()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM dbo.Users AS A INNER JOIN dbo.CustomersInfo AS B ON A.userName = B.userName WHERE A.userName=@userName";
        com.Parameters.Add("@userName", SqlDbType.NVarChar).Value = Session["userName"].ToString();

        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Session["customerID"] = dr["customerID"].ToString();
            lblFN.Text = dr["customerFN"].ToString();
            lblLN.Text = dr["customerLN"].ToString();
            lblEmail.Text = dr["customerEmail"].ToString();

            lblBusinessName.Text = dr["businessName"].ToString();
            lblBusinessAddress.Text = dr["businessAddress"].ToString();
            lblBusinessContactNo.Text = dr["businessTelNo"].ToString() + "; local-" + dr["businessLocalNo"].ToString() + "; " + dr["businessCPNo"].ToString();
            lblFaxNo.Text = dr["businessFaxNo"].ToString();
        }
        dr.Close();
        con.Close();
    }

    void AddOrders()
    {
        con.Open();
        SqlCommand com = new SqlCommand();

        com.Connection = con;
        com.CommandText = "INSERT INTO Orders (userID, customerID, orderDate, deliveryDate, " +
            "preferredDelivery, deliveryMode, concerns, amount, Validation,  orderStatus, readyForDelivery, " +
            "deliveryStatus, paymentStatus, paymentReceiptNo) " +
            "VALUES (@userID, @customerID, @orderDate, @deliveryDate, " +
            "@preferredDelivery, @deliveryMode, @concerns, @amount, @validation, " +
            "@orderStatus, @readyForDelivery, @deliveryStatus, @paymentStatus, @paymentReceiptNo)";

        com.Parameters.Add("@userID", SqlDbType.Int).Value = Convert.ToInt16(Session["userID"]);
        com.Parameters.Add("@customerID", SqlDbType.Int).Value = Session["customerID"].ToString();
        com.Parameters.Add("@orderDate", SqlDbType.DateTime).Value = Convert.ToDateTime(DateTime.Today.ToString("MMMM dd, yyyy"));
        com.Parameters.Add("@deliveryDate", SqlDbType.DateTime).Value = Convert.ToDateTime(txtDeliveryDate.Text);
        com.Parameters.Add("@preferredDelivery", SqlDbType.DateTime).Value = Convert.ToDateTime(txtDeliveryDate.Text);
        com.Parameters.Add("@deliveryMode", SqlDbType.NVarChar).Value = dropDeliveryMethod.SelectedValue.ToString();
        com.Parameters.Add("@concerns", SqlDbType.NVarChar).Value = txtDeliveryInstruction.Text;
        com.Parameters.Add("@amount", SqlDbType.Decimal).Value = Session["TAmount"].ToString();
        com.Parameters.Add("@validation", SqlDbType.NVarChar).Value = "Pending";
        com.Parameters.Add("@orderStatus", SqlDbType.NVarChar).Value = "Pending";
        com.Parameters.Add("@readyForDelivery", SqlDbType.NVarChar).Value = "Pending";
        com.Parameters.Add("@paymentStatus", SqlDbType.NVarChar).Value = "Unpaid";
        com.Parameters.Add("@deliveryStatus", SqlDbType.NVarChar).Value = "Pending";
        com.Parameters.Add("@paymentReceiptNo", SqlDbType.NVarChar).Value = DBNull.Value;
        com.ExecuteNonQuery();
        con.Close();
    }

    void AddOrderDetails()
    {
        getOrderNo();
        con.Open();
        SqlCommand com = new SqlCommand();

        com.Connection = con;
        com.CommandText = "INSERT INTO OrderDetails (productID, orderID, productSerialNo, productName, " +
            "productClass, productUnitPrice, quantity, amount) " +
            "SELECT A.productID, " + Session["orderNo"] + ", B.productSerialNo, B.productName, " +
            "B.productClassID, B.productUnitPrice, A.quantity, A.amount " +
            "FROM ShoppingCart AS A INNER JOIN Products AS B ON A.productID = B.productID " +
            "WHERE userID=" + Session["userID"] + " AND cartStatus='Pending'";
        com.ExecuteNonQuery();
        con.Close();
    }

    void getOrderNo()
    {
        con.Open();
        SqlCommand com = new SqlCommand();

        com.Connection = con;
        com.CommandText = "SELECT TOP 1 orderID FROM Orders WHERE userID=" + Session["userID"] + " ORDER BY orderID DESC";

        Session["orderNo"] = Convert.ToInt32(com.ExecuteScalar().ToString());

        con.Close();
    }

    void UpdateShoppingCart()
    {
        con.Open();
        SqlCommand com = new SqlCommand();

        com.Connection = con;
        com.CommandText = "UPDATE ShoppingCart SET cartStatus=@cartStatus WHERE userID=@userID AND cartStatus='Pending'";
        com.Parameters.Add("@cartStatus", SqlDbType.NVarChar).Value = "Checkout";
        com.Parameters.Add("@userID", SqlDbType.Int).Value = Convert.ToInt16(Session["userID"]);

        com.ExecuteNonQuery();
        con.Close();
    }

    protected void btnCheckout_Click(object sender, EventArgs e)
    {
        if (grdShoppingCart.Rows.Count == 0)
        {
            pError.Visible = true;
            lblError.Visible = true;
            lblError.Text = "Your orders cannot be added because there is no item in your shopping cart";
        }
        else
        {
            if (txtDeliveryDate.Text != String.Empty)
            {
                if (Convert.ToDateTime(txtDeliveryDate.Text) >= DateTime.Today)
                {
                    AddOrders();
                    AddOrderDetails();
                    UpdateShoppingCart();
                    pSuccess.Visible = true;
                    lblSuccess.Visible = true;
                    lblSuccess.Text = "Your orders have been added";
                    Helper.ClearTextboxes(this.Controls);
                    Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Customers/MyOrders.aspx");
                }
                else
                {
                    pError.Visible = true;
                    lblError.Visible = true;
                    lblError.Text = "You selected a final delivery that is already in the past. Change your inputs.";
                }                
            }
            else
            {
                pError.Visible = true;
                lblError.Visible = true;
                lblError.Text = "Please input your preferred delivery date. Thank you.";
            }
        }
    }
}