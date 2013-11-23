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

    //==========================================
    //==========================================

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["isApproved"] != null)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                lblLoginStatus.Visible = true;
                lblLoginStatus.Text = "Logout";
            }
            else
            {
                lblLoginStatus.Text = "Login";
            }
        }
        else
        {
            lblLoginStatus.Text = "Login";
        }
    } 

    //==================================================================
    //==================================================================
       
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
                        Response.Redirect("http://localhost:12345/FINAL CAPSTONE/WaitforConfirmation.aspx");
                    }

                    else if (Convert.ToInt32(Session["userType"]) == 2)
                    {
                        Response.Redirect("http://localhost:12345/FINAL CAPSTONE/Secretary/SecretaryDashboard.aspx");
                    }

                    else if (Convert.ToInt32(Session["userType"]) == 3)
                    {
                        Response.Redirect("http://localhost:12345/FINAL CAPSTONE/WarehouseManager/WarehouseManagerDashboard.aspx");
                    }

                    else if (Convert.ToInt32(Session["userType"]) == 4)
                    {
                        Response.Redirect("http://localhost:12345/FINAL CAPSTONE/GeneralManager/GMDashboard.aspx");
                    }

                    else if (Convert.ToInt32(Session["userType"]) == 5)
                    {
                        Response.Redirect("http://localhost:12345/FINAL CAPSTONE/Admin/AdminDashboard.aspx");
                    }
                    else
                    {
                        Response.Redirect("http://localhost:12345/FINAL CAPSTONE/Login.aspx");
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

    //==================================================================
    //==================================================================
    
    protected void lblLoginStatus_Click(object sender, EventArgs e)
    {
        if (Session["userName"] != null)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("http://localhost:12345/FINAL CAPSTONE/Home.aspx");
        }
        else
        {
            Response.Redirect("http://localhost:12345/FINAL CAPSTONE/Login.aspx");
        }
    }
}