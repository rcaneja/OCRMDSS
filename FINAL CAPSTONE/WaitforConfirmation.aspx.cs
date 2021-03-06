﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class TeamCReMe : System.Web.UI.Page
{
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

    //============================================
    //============================================

    protected void lblLoginStatus_Click(object sender, EventArgs e)
    {
        if (Session["isApproved"] != null)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                Session.Clear();
                Session.Abandon();                
                Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Home.aspx");
            }
            else
            {
                Session.Clear();
                Session.Abandon();
                Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Login.aspx");
            }
        }
        else
        {            
            Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Login.aspx");
            
        }    
    }
}