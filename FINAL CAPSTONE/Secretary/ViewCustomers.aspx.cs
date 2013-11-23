using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Secretary_ViewCustomers : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 2)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                getCustomerList();
                getUser();
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

    //=====================================================================================================>
    //=====================================================================================================>

    protected void grdCustomers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdCustomers.PageIndex = e.NewPageIndex;
        getCustomerList();
    }

    protected void grdCustomers_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["customerUserID"] = grdCustomers.SelectedRow.Cells[0].Text;
    }
    
    //=====================================================================================================>
    //=====================================================================================================>

    protected void btnView_Click(object sender, EventArgs e)
    {
        getCustomerID();
        int customerID = int.Parse(Session["customerID"].ToString());
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Secretary/ValidateCustomers.aspx?customerID=" + customerID.ToString());
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        getCustomers(ddlColumns.SelectedItem.Value, txtKeyword.Text);
    }


    //=====================================================================================================>
    //=====================================================================================================>

    void getCustomerID()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT A.customerID FROM dbo.CustomersInfo AS A INNER JOIN dbo.Users AS B ON A.userName=B.userName WHERE B.userName=@customerUserID";
        com.Parameters.Add("@customerUserID", SqlDbType.NVarChar).Value = Session["customerUserID"].ToString();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Session["customerID"] = dr["customerID"].ToString();
        }
        dr.Close();
        con.Close();
    }

    void getCustomerList()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM Users AS A INNER JOIN CustomersInfo AS B ON A.userName=B.userName WHERE A.userType = 1 AND A.validation='Pending'";
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        grdCustomers.DataSource = ds;
        grdCustomers.DataBind();
        con.Close();
    }

    void getUser()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT B.userID FROM dbo.CustomersInfo AS A INNER JOIN dbo.Users AS B ON A.userName=B.userName WHERE B.userName=@userName";
        com.Parameters.Add("@userName", SqlDbType.NVarChar).Value = Session["userName"].ToString();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Session["userID"] = dr["userID"].ToString();
        }
        dr.Close();
        con.Close();
    }
    
    void getCustomers(string column, string keyword)
    {
        grdCustomers.SelectedIndex = -1;

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM dbo.Users AS A INNER JOIN dbo.CustomersInfo  AS B ON A.userName = B.userName WHERE " +
                            column + " LIKE '%" + keyword + "%' AND A.userType=1";

        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        grdCustomers.DataSource = ds;
        grdCustomers.DataBind();

        con.Close();
    }
    protected void btnViewAll_Click(object sender, EventArgs e)
    {
        getCustomerList();
    }
}