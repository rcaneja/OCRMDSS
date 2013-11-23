using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Home : System.Web.UI.Page
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
    protected void myProfile_Click(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 1)
            Response.Redirect("http://localhost:12345/FINAL CAPSTONE/Customers/MyProfile.aspx");
        else if(Convert.ToInt32(Session["userType"]) == 2)
            Response.Redirect("http://localhost:12345/FINAL CAPSTONE/Secretary/MyProfile.aspx");
        else if (Convert.ToInt32(Session["userType"]) == 3)
            Response.Redirect("http://localhost:12345/FINAL CAPSTONE/WarehouseManager/MyProfile.aspx");
        else if (Convert.ToInt32(Session["userType"]) == 4)
            Response.Redirect("http://localhost:12345/FINAL CAPSTONE/GeneralManager/MyProfile.aspx");
        else if (Convert.ToInt32(Session["userType"]) == 5)
            Response.Redirect("http://localhost:12345/FINAL CAPSTONE/Admin/MyProfile.aspx");
    }
}