using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Customers_SearchOrders : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    //==========================================
    //==========================================

    void GetOrders(string category, string search)
    {
        grdOrders.SelectedIndex = -1;
        
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;    

        com.CommandText = "SELECT Orders.orderID, Orders.orderDate, Orders.preferredDelivery, " +
                           "Orders.deliveryMode, Orders.amount, Orders.orderStatus, Orders.deliveryStatus " +
                           "FROM Orders INNER JOIN Users ON Orders.userID=Users.userID WHERE " +
                           category + " LIKE '%" + search + "%' AND Users.userName=@userName";
        

        com.Parameters.Add("@userName", SqlDbType.NVarChar).Value = Session["userName"].ToString();


        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        grdOrders.DataSource = ds;
        grdOrders.DataBind();

        con.Close();
    }

    //==========================================
    //==========================================   

    void GetOrders(string orderID)
    {
        grdOrders.SelectedIndex = -1;

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;

        com.CommandText = "SELECT Orders.orderID, Orders.orderDate, Orders.preferredDelivery, " +
                           "Orders.deliveryMode, Orders.amount, Orders.orderStatus, Orders.deliveryStatus " +
                           "FROM Orders INNER JOIN Users ON Orders.userID=Users.userID WHERE orders.OrderID = " + orderID +
                           " AND Users.userName=@userName";


        com.Parameters.Add("@userName", SqlDbType.NVarChar).Value = Session["userName"].ToString();


        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        grdOrders.DataSource = ds;
        grdOrders.DataBind();

        con.Close();
    }

    //==========================================
    //==========================================   

    void GetOrders()
    {
        grdOrders.SelectedIndex = -1;
        
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;      

        com.CommandText = "SELECT Orders.orderID, Orders.orderDate, Orders.preferredDelivery, " +
                            "Orders.deliveryMode, Orders.amount, Orders.orderStatus, Orders.deliveryStatus " +
                            "FROM Orders INNER JOIN Users ON Orders.userID=Users.userID WHERE " +
                            "Users.userName=@userName";     

        com.Parameters.Add("@userName", SqlDbType.NVarChar).Value = Session["userName"].ToString();


        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        grdOrders.DataSource = ds;
        grdOrders.DataBind();

        con.Close();
    }

    //==========================================
    //==========================================   

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 1)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                if (!IsPostBack)
                {
                    GetOrders();
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

    //==========================================
    //==========================================   

    protected void grdOrders_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["orderID"] = grdOrders.SelectedRow.Cells[0].Text;
        Session["orderDate"] = grdOrders.SelectedRow.Cells[1].Text;
        Session["preferredDelivery"] = grdOrders.SelectedRow.Cells[2].Text;
        Session["deliveryMode"] = grdOrders.SelectedRow.Cells[3].Text;
        Session["amount"] = grdOrders.SelectedRow.Cells[4].Text;
        Session["orderStatus"] = grdOrders.SelectedRow.Cells[5].Text;
        Session["deliveryStatus"] = grdOrders.SelectedRow.Cells[6].Text;
        rfvSearch.Enabled = false;
    }

    //==========================================
    //==========================================   

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (ddlColumns.SelectedIndex == 0)
        {
            if (txtSearch.Text == "")
            {
                GetOrders();
            }
            else
            {
                GetOrders(txtSearch.Text);
            }
        }

        else
        {
            if (txtSearch.Text == "")
            {
                GetOrders();
            }
            else
            {
                GetOrders(ddlColumns.SelectedItem.Value, txtSearch.Text);
            }
        }    
    }

    //==========================================
    //==========================================   

    protected void btnViewAll_Click(object sender, EventArgs e)
    {
        txtSearch.Text = "";
        GetOrders();

        Helper.ClearTextboxes(this.Controls);
    }

    //==========================================
    //==========================================

    protected void grdOrders_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdOrders.PageIndex = e.NewPageIndex;

        if (txtSearch.Text == "")
        {
            GetOrders();
        }
        else
        {
            GetOrders(ddlColumns.SelectedItem.Value, txtSearch.Text);
        }
    }

    //==========================================
    //==========================================

    protected void btnViewDetails_Click(object sender, EventArgs e)
    {
        int orderID = int.Parse(Session["orderID"].ToString());
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Customers/OrderDetails.aspx" + orderID.ToString());
    }
}