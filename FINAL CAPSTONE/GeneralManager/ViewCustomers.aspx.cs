using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class GeneralManager_ViewCustomers : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    void GetCustomers()
    {
        gvCustomers.SelectedIndex = -1;

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT CustomersInfo.customerID, CustomersInfo.businessName, " +
            "CustomersInfo.businessAddress, CustomersInfo.businessTelNo, " +
            "CustomersInfo.businessLocalNo, CustomersInfo.businessCPNo, " +
            "CustomersInfo.businessFaxNo, " +
            "CustomersInfo.customerLN, CustomersInfo.customerFN, " +
            "CustomersInfo.customerEmail, " +
            "Users.validation, Users.approval " +
            "FROM CustomersInfo INNER JOIN Users " +
            "ON CustomersInfo.userName=Users.userName " +
            "WHERE Users.userType=1 AND Users.validation='Validated' AND Users.Approval='Pending'";

        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        gvCustomers.DataSource = ds;
        gvCustomers.DataBind();

        con.Close();
    }

    void GetCustomers(string column, string keyword)
    {
        gvCustomers.SelectedIndex = -1;

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT CustomersInfo.customerID, CustomersInfo.businessName, " +
            "CustomersInfo.businessAddress, CustomersInfo.businessTelNo, " +
            "CustomersInfo.businessLocalNo, CustomersInfo.businessCPNo, " +
            "CustomersInfo.businessFaxNo, " +
            "CustomersInfo.customerLN, CustomersInfo.customerFN, " +
            "CustomersInfo.customerEmail, " +
            "Users.validation, Users.approval " +
            "FROM CustomersInfo INNER JOIN Users " +
            "ON CustomersInfo.userName=Users.userName " +
            "WHERE Users.userType=1 AND " + column + " LIKE '%" + keyword + "%' AND Users.validation='Validated' AND Users.Approval='Pending'";

        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        gvCustomers.DataSource = ds;
        gvCustomers.DataBind();

        con.Close();
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 4)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                GetCustomers();
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
        GetCustomers(ddlColumns.SelectedItem.Value, txtKeyword.Text);
    }

    protected void btnViewAll_Click(object sender, EventArgs e)
    {
        txtKeyword.Text = "";
        GetCustomers();
    }

    protected void gvCustomers_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["customerID"] = gvCustomers.SelectedRow.Cells[0].Text;
        Session["businessName"] = gvCustomers.SelectedRow.Cells[1].Text;
        Session["businessAddress"] = gvCustomers.SelectedRow.Cells[2].Text;
        Session["businessTelNo"] = gvCustomers.SelectedRow.Cells[3].Text;
        Session["businessLocalNo"] = gvCustomers.SelectedRow.Cells[4].Text;
        Session["businessCPNo"] = gvCustomers.SelectedRow.Cells[5].Text;
        Session["businessFaxNo"] = gvCustomers.SelectedRow.Cells[6].Text;
        Session["customerLN"] = gvCustomers.SelectedRow.Cells[7].Text;
        Session["customerFN"] = gvCustomers.SelectedRow.Cells[8].Text;
        Session["customerEmail"] = gvCustomers.SelectedRow.Cells[9].Text;
        Session["validation"] = gvCustomers.SelectedRow.Cells[10].Text;
        Session["approval"] = gvCustomers.SelectedRow.Cells[11].Text;
    }

    protected void gvCustomers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvCustomers.PageIndex = e.NewPageIndex;

        if (txtKeyword.Text == "")
            GetCustomers();
        else
            GetCustomers(ddlColumns.SelectedItem.Value, txtKeyword.Text);
    }

    protected void btnApprove_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/GeneralManager/ApproveCustomers.aspx");
    }
}