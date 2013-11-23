using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["isApproved"] != null)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                myProfile.Visible = true;
                lblLoginStatus.Visible = true;
                lblLoginStatus.Text = "Logout";
            }
            else
            {
                myProfile.Visible = false;
                lblLoginStatus.Text = "Login";
            }
        }
        else
        {
            myProfile.Visible = false;
            lblLoginStatus.Text = "Login";
        }
    } 

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM Users WHERE userName=@userName";
        com.Parameters.Add("@userName", SqlDbType.VarChar).Value = txtUsername.Text;

        SqlDataReader dr = com.ExecuteReader();
        if (!dr.HasRows)
        {
            lblNoti.Visible = true;
            lblNoti.Text = "Invalid username and password.";
        }
        else
        {
            while (dr.Read())
            {
                if (txtPassword.Text == Helper.Decrypt(dr["userPW"].ToString(), true))
                {
                    Session["userName"] = txtUsername.Text;
                    Session["userID"] = dr["userID"].ToString();
                    Session["userType"] = dr["userType"].ToString();
                    Session["isApproved"] = dr["approval"].ToString();


                    if (Convert.ToInt32(Session["userType"]) == 0)
                    {
                        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/WaitforConfirmation.aspx");
                    }

                    else if (Convert.ToInt32(Session["userType"]) == 1)
                    {
                        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Customers/MyOrders.aspx");
                    }

                    else
                    {
                        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Employees/Login.aspx");
                    }
                }

                else
                {
                    lblNoti.Text = "Invalid username or password.";
                    lblNoti.Visible = true;
                }
            }
        }
        dr.Close();
        con.Close();
    }
    
    protected void lblLoginStatus_Click(object sender, EventArgs e)
    {
        if (Session["userName"] != null)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Home.aspx");
        }
        else
        {
            Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Login.aspx");
        }
    }
}