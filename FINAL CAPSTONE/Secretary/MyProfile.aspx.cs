﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Secretary_MyProfile : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 2)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                if (!IsPostBack)
                    GetProfile();

                pSuccess.Visible = false;
                pError.Visible = false;
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

    void GetProfile()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM dbo.Users AS A INNER JOIN dbo.EmployeesInfo AS B ON A.userName = B.userName " +
            "WHERE A.userName=@userName";
        com.Parameters.Add("@userName", SqlDbType.NVarChar).Value = Session["userName"].ToString();

        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {   
            txtLN.Text = dr["employeeLN"].ToString();
            txtFN.Text = dr["employeeFN"].ToString();
           
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
        con.Close();
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Secretary/EditMyProfile.aspx");
    }

    protected void btnChangePW_Click(object sender, EventArgs e)
    {
        if (txtCurrentPW.Text != "" || txtNewPW.Text != "" || txtConfirmPW.Text != "")
        {
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT * FROM dbo.EmployeesInfo AS A INNER JOIN dbo.Users AS B ON A.userName = B.userName WHERE A.userName='" + Session["userName"] + "'";

            SqlDataReader dr = com.ExecuteReader();

            while (dr.Read())
            {
                Session["dpw"] = dr["userPW"].ToString();
            }
            dr.Close();


            if (txtCurrentPW.Text == Helper.Decrypt(Session["dpw"].ToString(), true))
                {
                    if (txtNewPW.Text == "")
                    {
                        //do nothing
                    }

                    else
                    {
                        if (txtNewPW.Text == txtConfirmPW.Text)
                        {
                            com.CommandText = "UPDATE Users SET userPW=@userPW WHERE userName='" + Session["userName"] + "'";
                        }

                        else
                        {
                            lblError.Text = "Password did not match!";
                            lblError.Visible = true;
                            pError.Visible = true;
                            return;
                        }
                        com.Parameters.Add("@userPW", SqlDbType.NVarChar).Value = Helper.Encrypt(txtConfirmPW.Text, true);
                    }

                    com.ExecuteNonQuery();
                    lblSuccess.Text = "Password has been changed!";
                    lblSuccess.Visible = true;
                    pSuccess.Visible = true;
                }

                else
                {
                    lblError.Text = "Current Password is Invalid.";
                    lblError.Visible = true;
                    pError.Visible = true;
                }

            con.Close();
            GetProfile();
        }
        else
        {
            pError.Visible = true;
            lblError.Visible = true;
            lblError.Text = "You don't supply necessary information to change your credentials.";
        }
    }
}