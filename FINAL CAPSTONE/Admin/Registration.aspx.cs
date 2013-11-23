using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class EmployeesRegistration : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    bool IsUsernameExisting()
    {
        bool isExisting = true;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM Users WHERE userName=@userName";
        com.Parameters.Add("@userName", SqlDbType.NVarChar).Value = txtUsername.Text;

        SqlDataReader dr = com.ExecuteReader();
        if (!dr.HasRows)
            isExisting = false;
        else
            isExisting = true;
        con.Close();
        return isExisting;
    }

    bool IsEmployeeExisting()
    {
        bool isExisting = true;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM EmployeesInfo INNER JOIN Users ON EmployeesInfo.userName=Users.userName WHERE EmployeesInfo.employeeLN=@employeeLN AND EmployeesInfo.employeeFN=@employeeFN";
        com.Parameters.Add("@employeeLN", SqlDbType.NVarChar).Value = txtLN.Text;
        com.Parameters.Add("@employeeFN", SqlDbType.NVarChar).Value = txtFN.Text;

        SqlDataReader dr = com.ExecuteReader();
        if (!dr.HasRows)
            isExisting = false;
        else
            isExisting = true;
        con.Close();
        return isExisting;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 5)
        {
            if (Session["isApproved"] != null)
            {
                if (Session["isApproved"].ToString() == "Approved")
                {
                    
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

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        bool isUserExisting = IsUsernameExisting();
        bool isEmployeeExisting = IsEmployeeExisting();

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "INSERT INTO Users VALUES (@userName, @userPW, @userType, @Validation, @Approval)";

        com.Parameters.Add("@userName", SqlDbType.NVarChar).Value = txtUsername.Text;        
        com.Parameters.Add("@userType", SqlDbType.Int).Value = DropDownList1.SelectedValue;
        com.Parameters.Add("@Validation", SqlDbType.NVarChar).Value = "Validated";
        com.Parameters.Add("@Approval", SqlDbType.NVarChar).Value = "Approved";
        com.Parameters.Add("@userPW", SqlDbType.NVarChar).Value = Helper.Encrypt(txtPassword.Text, true);


        if (txtPassword.Text == txtConfirmPassword.Text)
        {
           if (isUserExisting || isEmployeeExisting)
            {
                lblNoti.Text = "Username AND/OR Employee already exists!";
                lblNoti.Visible = true;
            }

            else
            {
                com.ExecuteNonQuery();
                addEmployeesInfo();
                lblNoti.Visible = true;
                lblNoti.Text = "Registration done! " +
                    "Please wait for the confirmation. " +
                    "We will notify you through your contact details for the approval of your account. " +
                    "Thank you!";
            }
        }
        else
        {
            lblNoti.Text = "Password does not matched with confirm password!";
            lblNoti.Visible = true;
        }

        con.Close();

        Helper.ClearTextboxes(this.Controls);        
    }

            

    void addEmployeesInfo()
    {
        con.Close();
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "INSERT INTO EmployeesInfo VALUES ('" + txtUsername.Text + "', @employeeImage, @employeeLN, " +
            "@employeeFN)";

        com.Parameters.Add("@employeeImage", SqlDbType.Text).Value = DBNull.Value;
        com.Parameters.Add("@employeeLN", SqlDbType.NVarChar).Value = txtLN.Text;
        com.Parameters.Add("@employeeFN", SqlDbType.Text).Value = txtFN.Text;

        com.ExecuteNonQuery();
        con.Close();
    }  

    protected void myProfile_Click(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 1)
            Response.Redirect("http://localhost:12345/FINAL CAPSTONE/Customers/MyProfile.aspx");
        else if (Convert.ToInt32(Session["userType"]) == 2)
            Response.Redirect("http://localhost:12345/FINAL CAPSTONE/Secretary/MyProfile.aspx");
        else if (Convert.ToInt32(Session["userType"]) == 3)
            Response.Redirect("http://localhost:12345/FINAL CAPSTONE/WarehouseManager/MyProfile.aspx");
        else if (Convert.ToInt32(Session["userType"]) == 4)
            Response.Redirect("http://localhost:12345/FINAL CAPSTONE/GeneralManager/MyProfile.aspx");
        else if (Convert.ToInt32(Session["userType"]) == 5)
            Response.Redirect("http://localhost:12345/FINAL CAPSTONE/Admin/MyProfile.aspx");
    }
}