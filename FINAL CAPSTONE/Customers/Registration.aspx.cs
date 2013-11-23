using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Customers_Registration : System.Web.UI.Page
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

    bool IsContactPersonExisting()
    {
        bool isExisting = true;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM CustomersInfo INNER JOIN Users ON CustomersInfo.userName=Users.userName WHERE CustomersInfo.customerLN=@customerLN AND CustomersInfo.customerFN=@customerFN";
        com.Parameters.Add("@customerLN", SqlDbType.NVarChar).Value = txtLN.Text;
        com.Parameters.Add("@customerFN", SqlDbType.NVarChar).Value = txtFN.Text;

        SqlDataReader dr = com.ExecuteReader();
        if (!dr.HasRows)
            isExisting = false;
        else
            isExisting = true;
        con.Close();
        return isExisting;
    }

    //==================================================================
    //==================================================================

    protected void Page_Load(object sender, EventArgs e)
    {
        myProfile.Visible = false;
        pSuccess.Visible = false;
        pError.Visible = false;
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        bool isUserExisting = IsUsernameExisting();
        bool isCPExisting = IsContactPersonExisting();

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "INSERT INTO Users VALUES (@userName, @userPW, @userType, @validation, @approval)";

        com.Parameters.Add("@userName", SqlDbType.NVarChar).Value = txtUsername.Text;
        com.Parameters.Add("@userType", SqlDbType.Int).Value = 1;
        com.Parameters.Add("@validation", SqlDbType.NVarChar).Value = "Pending";
        com.Parameters.Add("@approval", SqlDbType.NVarChar).Value = "Pending";
        com.Parameters.Add("@userPW", SqlDbType.NVarChar).Value = Helper.Encrypt(txtPassword.Text, true);

        if (txtPassword.Text == txtConfirmPassword.Text)
        {
            if (isUserExisting || isCPExisting)
            {
                lblError.Text = "Username AND/OR Contact Person already exists!";
                lblError.Visible = true;
                pError.Visible = true;
            }

            else
            {
                com.ExecuteNonQuery();
                addCustomersInfo();
                pSuccess.Visible = true;
                lblSuccess.Visible = true;
                lblSuccess.Text = "Registration done! " +
                    "Please wait for the confirmation. " +
                    "We will notify you through your contact details for the approval of your account. " +
                    "Thank you!";
            }
        }

        else
        {
            pError.Visible = true;
            lblError.Text = "Password does not matched with confirm password!";
            lblError.Visible = true;
            Helper.ClearTextboxes(this.Controls);
        }

        con.Close();

        Helper.ClearTextboxes(this.Controls);
    }

    void addCustomersInfo()
    {
        con.Close();
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "INSERT INTO CustomersInfo VALUES ('" + txtUsername.Text + "', @businessLogo, @businessName, " +
            "@businessAddress, @businessTelNo, @businessLocalNo, @businessCPNo, @businessFaxNo, @customerImage, " +
            "@customerLN, @customerFN, @customerEmail)";

        com.Parameters.Add("@businessLogo", SqlDbType.Text).Value = DBNull.Value;
        com.Parameters.Add("@businessName", SqlDbType.NVarChar).Value = txtbusinessName.Text;
        com.Parameters.Add("@businessAddress", SqlDbType.Text).Value =
            txtHouseNo.Text + " " + txtStreetName.Text + " " + txtBarangay.Text + " " + txtCity.Text + " " 
            + txtProvince.Text + ", Philippines " + txtPostalCode.Text;
        com.Parameters.Add("@businessTelNo", SqlDbType.NVarChar).Value = txtbusinessTelNo.Text;
        com.Parameters.Add("@businessLocalNo", SqlDbType.NVarChar).Value = txtbusinessLocalNo.Text;
        com.Parameters.Add("@businessCPNo", SqlDbType.NVarChar).Value = txtbusinessCPNo.Text;
        com.Parameters.Add("@businessFaxNo", SqlDbType.NVarChar).Value = txtbusinessFaxNo.Text;
        
        com.Parameters.Add("@customerImage", SqlDbType.Text).Value = DBNull.Value;
        com.Parameters.Add("@customerLN", SqlDbType.NVarChar).Value = txtLN.Text;
        com.Parameters.Add("@customerFN", SqlDbType.NVarChar).Value = txtFN.Text;
        com.Parameters.Add("@customerEmail", SqlDbType.NVarChar).Value = txtEmailAddress.Text;

        com.ExecuteNonQuery();
        
        con.Close();
    }

    //protected void lblLoginStatus_Click(object sender, EventArgs e)
    //{
    //    if (Session["userName"] != null)
    //    {
    //        Session.Clear();
    //        Session.Abandon();
    //        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Home.aspx");
    //    }
    //    else
    //    {
    //        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Login.aspx");
    //    }
    //}
}