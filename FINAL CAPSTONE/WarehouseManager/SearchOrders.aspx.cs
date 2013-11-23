using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class WarehouseManager_SearchOrders : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 3)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                if (!IsPostBack)
                {
                    getOrderList();
                }                
                btnViewDetails.Visible = false;
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
        com.CommandText = "SELECT * FROM Users AS A INNER JOIN Orders AS B  ON A.userID = B.userID INNER JOIN CustomersInfo AS C ON A.userName = C.userName ";

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
        Session["businessName"] = grdOrders.SelectedRow.Cells[1].Text;
        Session["deliveryDate"] = grdOrders.SelectedRow.Cells[2].Text;
        Session["deliveryMode"] = grdOrders.SelectedRow.Cells[3].Text;
        Session["amount"] = grdOrders.SelectedRow.Cells[4].Text;
        Session["orderStatus"] = grdOrders.SelectedRow.Cells[5].Text;
        Session["deliveryStatus"] = grdOrders.SelectedRow.Cells[6].Text;

        btnViewDetails.Visible = true;
    }
    
    protected void btnViewDetails_Click(object sender, EventArgs e)
    {
        int orderID = int.Parse(Session["orderID"].ToString());
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/WarehouseManager/OrderDetails.aspx?orderID=" + orderID.ToString());
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
        com.CommandText = "SELECT * FROM Users AS A INNER JOIN Orders AS B  ON A.userID = B.userID INNER JOIN CustomersInfo AS C ON A.userName = C.userName " +
            "WHERE " + column + " LIKE '%" + keyword + "%'";

        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        grdOrders.DataSource = ds;
        grdOrders.DataBind();

        con.Close();
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
}