using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_SearchEmployees : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    void GetEmployeesProfile()
    {
        try
        {
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
        
            com.CommandText = "SELECT employeeImage, userName, employeeLN, employeeFN " +
                                "FROM EmployeesInfo WHERE employeeID=@employeeID";

            com.Parameters.Add("@employeeID", SqlDbType.Int).Value = Session["employeeID"].ToString();

            SqlDataReader dr = com.ExecuteReader();

            while (dr.Read())
            {
                txtUserName.Text = dr["userName"].ToString();
                txtemployeeLN.Text = dr["employeeLN"].ToString();
                txtemployeeFN.Text = dr["employeeFN"].ToString();

                if (dr["employeeImage"] == DBNull.Value)
                {
                    imgEmployee.ImageUrl = "http://localhost:12345/FINAL%20CAPSTONE/assets/img/Employees/noImage.jpg";
                }
                else
                {
                    imgEmployee.ImageUrl = dr["employeeImage"].ToString();
                }
            }

            dr.Close();
        }
        catch
        {
            lblMessage.Text = "Error found!";
            lblMessage.Visible = true;
        }
        finally
        {
            con.Close();
        }
        
    }

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
        if (Convert.ToInt32(Session["userType"]) == 5)
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
    }

    protected void btnViewAll_Click(object sender, EventArgs e)
    {
        txtKeyword.Text = "";
        GetEmployees();

        Helper.ClearTextboxes(this.Controls);

        imgEmployee.Visible = false;
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
        Session["employeeID"] = grdEmployees.SelectedRow.Cells[0].Text;
        Session["userName"] = grdEmployees.SelectedRow.Cells[1].Text;
        Session["employeeLN"] = grdEmployees.SelectedRow.Cells[2].Text;
        Session["employeeFN"] = grdEmployees.SelectedRow.Cells[3].Text;

        GetEmployeesProfile();

        imgEmployee.Visible = true;
    }
}