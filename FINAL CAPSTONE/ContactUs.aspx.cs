using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class ContactUs : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    //==========================================
    //==========================================

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] != null)
        {
            myProfile.Visible = true;
            lblLoginStatus.Visible = true;
            lblLoginStatus.Text = "Logout";
            pSuccess.Visible = false;
            pError.Visible = false;
            if (!IsPostBack)
            { }
        }
        else
        {
            myProfile.Visible = false;
            lblLoginStatus.Text = "Login";
            pSuccess.Visible = false;
            pError.Visible = false;
        }
    }

    //==========================================
    //==========================================

    protected void btnSend_Click(object sender, EventArgs e)
    {
        if (txtInquiryFN.Text != String.Empty && txtInquiryLN.Text != String.Empty && txtInquiryEmail.Text != String.Empty && txtInquiryContactNo.Text != String.Empty && txtInquiryMessage.Text != String.Empty)
        {
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "INSERT INTO Inquiry VALUES (@inquiryFN, @inquiryLN, @inquiryEmail, " +
                "@inquiryContactNo, @inquiryMessage, @date, @status)";

            com.Parameters.Add("@inquiryFN", SqlDbType.NVarChar).Value = txtInquiryFN.Text;
            com.Parameters.Add("@inquiryLN", SqlDbType.NVarChar).Value = txtInquiryLN.Text;
            com.Parameters.Add("@inquiryEmail", SqlDbType.NVarChar).Value = txtInquiryEmail.Text;
            com.Parameters.Add("@inquiryContactNo", SqlDbType.NVarChar).Value = txtInquiryContactNo.Text;
            com.Parameters.Add("@inquiryMessage", SqlDbType.Text).Value = txtInquiryMessage.Text;
            com.Parameters.Add("@date", SqlDbType.DateTime).Value = DateTime.Now;
            com.Parameters.Add("@status", SqlDbType.NVarChar).Value = "Unread";

            try
            {
                com.ExecuteNonQuery();
                lblSuccess.Text = "Your concern has been sent. " +
                    "We will respond to you through your contact details as soon as possible. Thank you!";
                lblSuccess.Visible = true;
                pSuccess.Visible = true;
                Helper.ClearTextboxes(this.Controls);
            }

            catch
            {
                lblError.Text = "Error found!";
                pError.Visible = true;
                lblError.Visible = true;
            }

            finally
            {
                con.Close();
                Helper.ClearTextboxes(this.Controls);
            }
        }
        else
        {
            lblError.Text = "Please supply necessary information to submit your inquiries. Thank you.";
            lblError.Visible = true;
            pError.Visible = true;
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
}