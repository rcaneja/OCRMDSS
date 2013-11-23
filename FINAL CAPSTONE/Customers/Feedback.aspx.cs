using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Customers_Feedback : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 1)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                getUser();
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

    protected void btnSend_Click(object sender, EventArgs e)
    {
        if (txtFeedbackCommSugg.Text != "")
        {
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "INSERT INTO Feedback VALUES (@userID, @customerID, @feedbackCommSugg,  @date, @status)";

            com.Parameters.Add("@userID", SqlDbType.NVarChar).Value = Session["userID"];
            com.Parameters.Add("@customerID", SqlDbType.Int).Value = Session["customerID"];
            com.Parameters.Add("@feedbackCommSugg", SqlDbType.Text).Value = txtFeedbackCommSugg.Text;
            com.Parameters.Add("@status", SqlDbType.NVarChar).Value = "Unread";
            com.Parameters.Add("@date", SqlDbType.DateTime).Value = DateTime.Today;

            try
            {
                com.ExecuteNonQuery();
                lblNoti.Text = "Message has been sent. Thank you for your response!";
                lblNoti.Visible = true;
                txtFeedbackCommSugg.Text = "";
            }

            catch
            {
                lblNoti.Text = "Error found!";
                lblNoti.Visible = true;
                txtFeedbackCommSugg.Text = "";
            }

            finally
            {
                con.Close();
            }
        }
        else
        {
            lblNoti.Text = "Error found!";
            lblNoti.Visible = true;
            txtFeedbackCommSugg.Text = "";
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Helper.ClearTextboxes(this.Controls);
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Customers/Feedback.aspx");
    }

    void getUser()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM dbo.Users AS A INNER JOIN dbo.CustomersInfo AS B ON A.userName = B.userName WHERE A.userName=@userName";
        com.Parameters.Add("@userName", SqlDbType.NVarChar).Value = Session["userName"].ToString();

        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            txtLN.Text = dr["customerLN"].ToString();
            txtFN.Text = dr["customerFN"].ToString();
            Session["userID"] = dr["userID"].ToString();
            Session["customerID"] = dr["customerID"].ToString();
        }
        dr.Close();
        con.Close();
    }
}