using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_AdminDashboard : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    void getEmployeesList()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT TOP 10 * FROM Users AS A INNER JOIN EmployeesInfo AS B ON A.userName = B.userName WHERE userType = 0 AND approval = 'Approved'";
        SqlDataReader dr = com.ExecuteReader();
        grdEmployees.DataSource = dr;
        grdEmployees.DataBind();
        con.Close();
    }

    //====================================
    //====================================

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 5)
        {
            if (Session["isApproved"] != null)
            {
                if (Session["isApproved"].ToString() == "Approved")
                {
                    getEmployeesList();
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
    }
}