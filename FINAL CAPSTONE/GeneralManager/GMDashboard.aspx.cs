using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class GeneralManager_GMDashboard : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());
    
    void GetCustomersList()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT TOP 10 * FROM Users AS A INNER JOIN CustomersInfo AS B ON A.userName=B.userName WHERE userType = 1 AND approval='Pending'";
        SqlDataReader dr = com.ExecuteReader();
        grdCustomers.DataSource = dr;
        grdCustomers.DataBind();
        con.Close();
    }

    void GetOrdersList()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT TOP 10 * FROM Orders AS A INNER JOIN CustomersInfo AS B ON A.customerID = B.customerID WHERE orderStatus='Pending'";

        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        grdOrders.DataSource = ds;
        grdOrders.DataBind();

        con.Close();
    }

    void GetProductsList()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT TOP 10 * FROM Products";

        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        grdProducts.DataSource = ds;
        grdProducts.DataBind();

        con.Close();
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 4)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                GetCustomersList();
                GetOrdersList();
                GetProductsList();
            }
            else
            {
                Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/WaitforConfirmation.aspx");
            }

        }
        else
        {
            Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Login.aspx");
        }
    }

    protected void btnViewAllCustomers_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/GeneralManager/ViewCustomers.aspx");
    }

    protected void btnViewAllEmployees_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/GeneralManager/ViewEmployees.aspx");
    }

    protected void btnViewAllOrders_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/GeneralManager/ViewOrders.aspx");
    }

    protected void btnViewAllProducts_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/GeneralManager/ViewProducts.aspx");
    }
}