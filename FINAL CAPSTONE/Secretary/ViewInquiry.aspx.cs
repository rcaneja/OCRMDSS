using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Secretary_ViewInquiry : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    void GetCustomerInquiryDetails()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM Inquiry WHERE inquiryID=@inquiryID";

        com.Parameters.Add("@inquiryID", SqlDbType.Int).Value = Session["inquiryID"].ToString();

        SqlDataReader dr = com.ExecuteReader();

        while (dr.Read())
        {
            txtinquiryID.Text = dr["inquiryID"].ToString();
            txtinquiryFN.Text = dr["inquiryFN"].ToString();
            txtinquiryLN.Text = dr["inquiryLN"].ToString();
            txtinquiryEmail.Text = dr["inquiryEmail"].ToString();
            txtinquiryContactNo.Text = dr["inquiryContactNo"].ToString();
            txtinquiryMessage.Text = dr["inquiryMessage"].ToString();
            txtdate.Text = dr["date"].ToString();
            txtstatus.Text = dr["status"].ToString();
        }

        dr.Close();
        con.Close();
    }
    
    void GetCustomerInquiry()
    {
        grdCustomers.SelectedIndex = -1;

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM Inquiry WHERE status='Unread'";

        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);
                
        grdCustomers.DataSource = ds;
        grdCustomers.DataBind();

        con.Close();
    }

    void GetCustomerInquiry(string column, string keyword)
    {
        grdCustomers.SelectedIndex = -1;

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM Inquiry " +
                            "WHERE " + column + " LIKE '%" + keyword + "%' AND status='Unread'";
                            

        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        grdCustomers.DataSource = ds;
        grdCustomers.DataBind();

        con.Close();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 2)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                btnOK.Visible = false;
                if (!IsPostBack)
                {
                    GetCustomerInquiry();
                    pSuccess.Visible = false;
                    pError.Visible = false;
                }
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

    protected void grdCustomers_SelectedIndexChanged(object sender, EventArgs e)
    {        
        Session["inquiryID"] = grdCustomers.SelectedRow.Cells[0].Text;
        Session["inquiryFN"] = grdCustomers.SelectedRow.Cells[1].Text;
        Session["inquiryLN"] = grdCustomers.SelectedRow.Cells[2].Text;
        Session["inquiryEmail"] = grdCustomers.SelectedRow.Cells[3].Text;
        Session["inquiryContactNo"] = grdCustomers.SelectedRow.Cells[4].Text;
        Session["inquiryMessage"] = grdCustomers.SelectedRow.Cells[5].Text;
        Session["date"] = grdCustomers.SelectedRow.Cells[6].Text;
        Session["status"] = grdCustomers.SelectedRow.Cells[7].Text;

        GetCustomerInquiryDetails();

        if (txtstatus.Text == "Unread")
        {
            grdCustomers.Enabled = false;
            btnOK.Visible = true;
            rfvKeyword.Enabled = false;
        }
        else
        {
            grdCustomers.Enabled = true;
        }

        string message = "Hello, " + grdCustomers.SelectedRow.Cells[1].Text + " " +
               grdCustomers.SelectedRow.Cells[2].Text + "! <br /><br /> " +
               "Your Inquiry has been read. <br /> <br />" +
               "Please wait for our detailed response regarding this matter. You will receive a different E-mail containing the detailed discussions and reponse.<br /> <br />" +
               "Thank you.  <br /> <br /> <br />" +
               "Best Regards, <br />" +
               "Oversea Plastic Manufacturing";

        Helper.SendEmail(grdCustomers.SelectedRow.Cells[3].Text, "Inquiry Read", message);
    }   

    protected void grdCustomers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdCustomers.PageIndex = e.NewPageIndex;

        if (txtKeyword.Text == "")
        {
            GetCustomerInquiry();
        }

        else
        {
            GetCustomerInquiry(ddlColumns.SelectedItem.Value, txtKeyword.Text);
        }
    }

    protected void btnOK_Click(object sender, EventArgs e)
    { 
        con.Open();

        SqlCommand com = new SqlCommand();
        com.Connection = con;

        com.CommandText = "UPDATE Inquiry SET status='Read' WHERE inquiryID=@inquiryID";

        com.Parameters.Add("@inquiryID", SqlDbType.Int).Value = Session["inquiryID"].ToString();

        com.Parameters.Add("@status", SqlDbType.NVarChar).Value = "'Read'";

        try
        {
            com.ExecuteNonQuery();
            pSuccess.Visible = true;
            lblSuccess.Text = "Customer Inquiry has been Read!";
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

        grdCustomers.Enabled = true;

        btnOK.Visible = false;

        rfvKeyword.Enabled = true;

        Helper.ClearTextboxes(this.Controls);

        GetCustomerInquiry();
    }

    protected void btnViewAll_Click(object sender, EventArgs e)
    {
        txtKeyword.Text = "";
        GetCustomerInquiry();

        Helper.ClearTextboxes(this.Controls);
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        GetCustomerInquiry(ddlColumns.SelectedItem.Value, txtKeyword.Text);
    }
}