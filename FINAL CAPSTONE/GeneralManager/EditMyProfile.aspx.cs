﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class GeneralManager_EditMyProfile : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

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
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 4)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                if (!IsPostBack)
                    GetProfile();
                txtFN.Enabled = true;
                txtLN.Enabled = true;
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

    protected void btnSave_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;

        com.CommandText = "UPDATE EmployeesInfo SET employeeImage=@employeeImage, employeeLN=@employeeLN, employeeFN=@employeeFN " +
                "WHERE userName=@userName";

        if (fuemployeeImage.HasFile)
        {
            com.Parameters.Add("@employeeImage", SqlDbType.Text).Value = "http://localhost:12345/FINAL%20CAPSTONE/assets/img/Employees/" + fuemployeeImage.FileName;
            fuemployeeImage.SaveAs(Server.MapPath("../assets/img/Employees/" + fuemployeeImage.FileName));
        }

        else
        {
            com.Parameters.Add("@employeeImage", SqlDbType.Text).Value = imgEmployee.ImageUrl;
        }

        com.Parameters.Add("@employeeLN", SqlDbType.NVarChar).Value = txtLN.Text;
        com.Parameters.Add("@employeeFN", SqlDbType.NVarChar).Value = txtFN.Text;
        
        com.Parameters.Add("@userName", SqlDbType.NVarChar).Value = Session["userName"].ToString();

        com.ExecuteNonQuery();
        pSuccess.Visible = true;
        lblSuccess.Text = "Profile has been updated!";
        lblSuccess.Visible = true;
        con.Close();
        GetProfile();

        Response.Redirect("http://localhost:12345/FINAL CAPSTONE/GeneralManager/MyProfile.aspx");
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/GeneralManager/MyProfile.aspx");
    }
}