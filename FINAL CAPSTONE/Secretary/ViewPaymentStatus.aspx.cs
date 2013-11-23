using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Secretary1_ViewPaymentStatus : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 2)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                if (!IsPostBack)
                    getOrderList();  
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

    void getOrderList()
    {
        grdOrders.SelectedIndex = -1;

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM Orders AS B INNER JOIN Users AS A  ON A.userID = B.userID INNER JOIN CustomersInfo AS C ON A.userName = C.userName WHERE orderStatus='Approved' AND paymentStatus='Unpaid' AND deliveryStatus <> 'Pending'";

        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        grdOrders.DataSource = ds;
        grdOrders.DataBind();

        con.Close();
    }

    protected void grdOrders_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["orderID"] = grdOrders.SelectedRow.Cells[0].Text;
    }
    
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        getOrder(ddlColumns.SelectedItem.Value, txtKeyword.Text);
    }

    void getOrder(string column, string keyword)
    {
        grdOrders.SelectedIndex = -1;

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM Orders AS B INNER JOIN Users AS A ON A.userID = B.userID INNER JOIN CustomersInfo AS C ON A.userName = C.userName WHERE orderStatus='Approved' AND " +
            column + " LIKE '%" + keyword + "%'";

        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        grdOrders.DataSource = ds;
        grdOrders.DataBind();

        con.Close();
        Helper.ClearTextboxes(this.Controls);
    }
   
    protected void btnViewAll_Click(object sender, EventArgs e)
    {
        getOrderList();
        Helper.ClearTextboxes(this.Controls);
    }

    protected void grdOrders_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdOrders.PageIndex = e.NewPageIndex;
        getOrderList();
    }
   
    protected void btnPaymentStatus_Click(object sender, EventArgs e)
    {
        int orderID = int.Parse(Session["orderID"].ToString());
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Secretary/UpdatePaymentStatus.aspx?orderID=" + orderID.ToString());
    }
}