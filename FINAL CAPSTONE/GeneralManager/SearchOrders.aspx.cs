using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class GeneralManager_SearchOrders : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    void GetOrders()
    {
        gvOrders.SelectedIndex = -1;

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM Users AS A INNER JOIN Orders AS B  ON A.userID = B.userID INNER JOIN CustomersInfo AS C ON A.userName = C.userName";

        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        gvOrders.DataSource = ds;
        gvOrders.DataBind();

        con.Close();
    }

    void GetOrders(string column, string keyword)
    {
        gvOrders.SelectedIndex = -1;

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM Users AS A INNER JOIN Orders AS B  ON A.userID = B.userID INNER JOIN CustomersInfo AS C ON A.userName = C.userName " +
        "WHERE " + column + " LIKE '%" + keyword + "%'";

        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        gvOrders.DataSource = ds;
        gvOrders.DataBind();

        con.Close();
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 4)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                GetOrders();
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

        if (!IsPostBack)
            GetOrders();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        GetOrders(ddlColumns.SelectedItem.Value, txtKeyword.Text);
    }

    protected void btnViewAll_Click(object sender, EventArgs e)
    {
        txtKeyword.Text = "";
        GetOrders();
    }

    protected void gvOrders_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }

    protected void gvOrders_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvOrders.PageIndex = e.NewPageIndex;

        if (txtKeyword.Text == "")
            GetOrders();
        else
            GetOrders(ddlColumns.SelectedItem.Value, txtKeyword.Text);
    }
}