using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class GeneralManager_EmployeeInfo : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 4)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                //checkStatus();
                if (Request.QueryString["employeeID"] != null)
                {
                        btnCancel.Visible = true;
                        btnCancel.Text = "Back";
                        if (!IsPostBack)
                            GetEmployeesProfile(Request.QueryString["employeeID"].ToString());
                }
                else
                    Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/GeneralManager/ViewEmployees.aspx");
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

    void GetEmployeesProfile(string employeeID)
    {
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;

            com.CommandText = "SELECT * FROM EmployeesInfo INNER JOIN Users ON EmployeesInfo.userName=Users.userName WHERE EmployeesInfo.employeeID=@employeeID";

            com.Parameters.Add("@employeeID", SqlDbType.Int).Value = employeeID;

            SqlDataReader dr = com.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    txtemployeeLN.Text = dr["employeeLN"].ToString();
                    txtemployeeFN.Text = dr["employeeFN"].ToString();
                    txtUserName.Text = dr["userName"].ToString();

                    if (dr["employeeImage"] == DBNull.Value)
                    {
                        imgEmployee.ImageUrl = "http://localhost:12345/FINAL%20CAPSTONE/assets/img/Employees/noImage.jpg";
                    }
                    else
                    {
                        imgEmployee.ImageUrl = dr["employeeImage"].ToString();
                    }

                    if (Convert.ToInt32(dr["userType"].ToString()) == 2)
                        txtUserType.Text = "Secretary";
                    else if (Convert.ToInt32(dr["userType"].ToString()) == 3)
                        txtUserType.Text = "Warehouse Manager";
                    else if (Convert.ToInt32(dr["userType"].ToString()) == 4)
                        txtUserType.Text = "General Manager";
                    else if (Convert.ToInt32(dr["userType"].ToString()) == 5)
                        txtUserType.Text = "Admin";
                }
                dr.Close();
                con.Close();
            }
            else
                Response.Redirect("http://localhost:12345/FINAL CAPSTONE/GeneralManager/ViewEmployees.aspx");
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL CAPSTONE/GeneralManager/SearchEmployees.aspx");
    }
}