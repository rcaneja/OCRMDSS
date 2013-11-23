using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class GeneralManager_ApproveCustomers : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 4)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                checkStatus();
                if (Request.QueryString["customerID"] != null)//has customerID
                {
                    if (Session["status"].ToString() == "Approved" || Session["status"].ToString() == "Disapproved")
                    {
                        btnApproved.Visible = false;
                        btnDisapproved.Visible = false;

                        btnCancel.Visible = true;
                        btnCancel.Text = "Back";
                        if (!IsPostBack)
                        {
                            GetProfile(Request.QueryString["customerID"].ToString());
                        }
                        pSuccess.Visible = false;
                        pError.Visible = false;
                    }
                    else
                    {
                        txtbusinessAddress.Enabled = false;
                        txtbusinessCPNo.Enabled = false;
                        txtbusinessFaxNo.Enabled = false;
                        txtbusinessLocalNo.Enabled = false;
                        txtbusinessName.Enabled = false;
                        txtbusinessTelNo.Enabled = false;
                        txtEmailAddress.Enabled = false;
                        txtFN.Enabled = false;
                        txtLN.Enabled = false;
                        if (!IsPostBack)
                        {
                            GetProfile(Request.QueryString["customerID"].ToString());
                        }
                        pError.Visible = false;
                        pSuccess.Visible = false;
                    }
                }
                else
                    Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Secretary/ViewCustomers.aspx");
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

    void GetProfile(string customerID)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM CustomersInfo WHERE customerID=@customerID";
        com.Parameters.Add("@customerID", SqlDbType.NVarChar).Value = customerID;

        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            txtbusinessName.Text = dr["businessName"].ToString();
            txtbusinessAddress.Text = dr["businessAddress"].ToString();
            txtbusinessTelNo.Text = dr["businessTelNo"].ToString();
            txtbusinessLocalNo.Text = dr["businessLocalNo"].ToString();
            txtbusinessCPNo.Text = dr["businessCPNo"].ToString();
            txtbusinessFaxNo.Text = dr["businessFaxNo"].ToString();
            txtFN.Text = dr["customerLN"].ToString();
            txtLN.Text = dr["customerFN"].ToString();
            txtEmailAddress.Text = dr["customerEmail"].ToString();
        }
        dr.Close();
        con.Close();
    }

    protected void btnApprove_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "UPDATE Users SET Users.approval='Approved' FROM Users " +
            "INNER JOIN CustomersInfo ON Users.userName=CustomersInfo.userName " +
            "WHERE Users.userType=1 AND CustomersInfo.customerID=@customerID";

        com.Parameters.Add("@customerID", SqlDbType.Int).Value = Request.QueryString["customerID"].ToString();
        com.Parameters.Add("@approval", SqlDbType.NVarChar).Value = "Approved";        

        try
        {
            com.ExecuteNonQuery();
            pSuccess.Visible =true;
            lblSuccess.Text = "Customer registration is approved!";
            lblSuccess.Visible = true;            
        }

        catch
        {
            pError.Visible = true;
            lblError.Text = "Error found!";
            lblError.Visible = true;
        }

        finally
        {
            con.Close();
        }

        string message = "Hello, " + txtFN.Text + " " + txtLN.Text +
                " from " + txtbusinessName.Text + "! <br /><br /> " +
                "Welcome to Oversea Plastic Manufacturing! <br /> <br />" +
                "Your account has been approved! You can now fully access the system. <br /> <br />" +
                "Thank you.  <br /> <br /><br />" +
                "Sincerely, <br />" +
                "Oversea Plastic Manufacturing";

        Helper.SendEmail(txtEmailAddress.Text, "Confirmation Of Registration", message);

        btnApproved.Visible = false;
        btnDisapproved.Visible = false;
        btnCancel.Text = "Back";
    }

    protected void btnDisapprove_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "UPDATE Users SET Users.approval='Disapproved' FROM Users " +
            "INNER JOIN CustomersInfo ON Users.userName=CustomersInfo.userName " +
            "WHERE Users.userType=1 AND CustomersInfo.customerID=@customerID";

        com.Parameters.Add("@customerID", SqlDbType.Int).Value = Request.QueryString["customerID"].ToString();
        com.Parameters.Add("@approval", SqlDbType.NVarChar).Value = "Disapproved";

        try
        {
            com.ExecuteNonQuery();
            pError.Visible = true;
            lblError.Text = "Customer registration is rejected!";
            lblError.Visible = true;            
        }

        catch
        {
            pError.Visible = true;
            lblError.Text = "Error found!";
            lblError.Visible = true;
        }

        finally
        {
            con.Close();
        }

        string message = "Hello, " + txtFN.Text + " " + txtLN.Text +
                " from " + txtbusinessName.Text + "! <br /><br /> " +
                "We are sorry to inform you but you have not granted access to our system.<br /> <br />" +
                "Thank you for showing your interest in our company.  <br /> <br /><br />" +
                "Sincerely, <br />" +
                "Oversea Plastic Manufacturing";

        Helper.SendEmail(txtEmailAddress.Text, "Declining Of Registration", message);

        btnApproved.Visible = false;
        btnDisapproved.Visible = false;
        btnCancel.Text = "Back";
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL CAPSTONE/GeneralManager/ViewCustomers.aspx");
    }

     void checkStatus()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT B.approval FROM dbo.CustomersInfo AS A INNER JOIN dbo.Users AS B ON A.userName=B.userName WHERE A.customerID=@customerID";
        com.Parameters.Add("@customerID", SqlDbType.Int).Value = Request.QueryString["customerID"].ToString();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Session["status"] = dr["approval"].ToString();
        }
        dr.Close();
        con.Close();
    }
}