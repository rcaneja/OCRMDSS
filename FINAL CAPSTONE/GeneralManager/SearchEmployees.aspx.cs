using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class GeneralManager_SearchEmployees : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    void GetEmployees()
    {
        grdEmployees.SelectedIndex = -1;

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM dbo.Users AS A INNER JOIN dbo.EmployeesInfo AS B ON A.userName = B.userName";

        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        grdEmployees.DataSource = ds;
        grdEmployees.DataBind();

        con.Close();
    }

    void GetEmployees(string column, string keyword)
    {
        grdEmployees.SelectedIndex = -1;

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM dbo.Users AS A INNER JOIN dbo.EmployeesInfo  AS B ON A.userName = B.userName WHERE " +
                            column + " LIKE '%" + keyword + "%'";

        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        grdEmployees.DataSource = ds;
        grdEmployees.DataBind();

        con.Close();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 4)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                if (!IsPostBack)
                    GetEmployees();
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

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        GetEmployees(ddlColumns.SelectedItem.Value, txtKeyword.Text);

        Helper.ClearTextboxes(this.Controls);
    }

    protected void btnViewAll_Click(object sender, EventArgs e)
    {
        txtKeyword.Text = "";
        GetEmployees();

        Helper.ClearTextboxes(this.Controls);
    }

    protected void grdEmployees_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdEmployees.PageIndex = e.NewPageIndex;

        if (txtKeyword.Text == "")
        {
            GetEmployees();
        }
        else
        {
            GetEmployees(ddlColumns.SelectedItem.Value, txtKeyword.Text);
        }
    }

    protected void grdEmployees_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
}