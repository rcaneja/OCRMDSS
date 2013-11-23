using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Secretary_ViewFeedback : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    //====================================
    //====================================

    void GetCustomerFeedbackDetails()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT CustomersInfo.businessLogo, CustomersInfo.businessName, " +
                            "CustomersInfo.businessAddress, CustomersInfo.businessTelNo, " +
                            "Feedback.feedbackCommSugg, Feedback.date, Feedback.status " +
                            "FROM Feedback INNER JOIN Users ON Feedback.userID = Users.userID INNER JOIN " +
                            "CustomersInfo ON Users.userName = CustomersInfo.userName " +
                            "WHERE Feedback.feedbackID=@feedbackID";      

        com.Parameters.Add("@feedbackID", SqlDbType.Int).Value = Session["feedbackID"].ToString();

        SqlDataReader dr = com.ExecuteReader();

        while (dr.Read())
        {
            imgBusiness.ImageUrl = dr["businessLogo"].ToString();
            txtbusinessName.Text = dr["businessName"].ToString();
            txtbusinessAddress.Text = dr["businessAddress"].ToString();
            txtbusinessTelNo.Text = dr["businessTelNo"].ToString();
            txtfeedbackCommSugg.Text = dr["feedbackCommSugg"].ToString();
            txtdate.Text = dr["date"].ToString();
            txtstatus.Text = dr["status"].ToString();
        }

        dr.Close();

        con.Close();
    }
    
    //====================================
    //====================================
    
    void GetCustomerFeedback()
    {
        grdCustomers.SelectedIndex = -1;

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT Feedback.feedbackID, CustomersInfo.customerID, CustomersInfo.businessName, " +
                            "CustomersInfo.businessTelNo, CustomersInfo.customerEmail, " +
                            "Feedback.feedbackCommSugg, Feedback.date, Feedback.status " +
                            "FROM Feedback INNER JOIN Users ON Feedback.userID = Users.userID INNER JOIN " +
                            "CustomersInfo ON Users.userName = CustomersInfo.userName AND Feedback.status='Unread'";
        
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);
                
        grdCustomers.DataSource = ds;
        grdCustomers.DataBind();

        con.Close();
    }

    //====================================
    //====================================

    void GetCustomerFeedback(string column, string keyword)
    {
        grdCustomers.SelectedIndex = -1;

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT Feedback.feedbackID, CustomersInfo.customerID, CustomersInfo.businessName, " +
                            "CustomersInfo.businessTelNo, CustomersInfo.customerEmail, " +
                            "Feedback.feedbackCommSugg, Feedback.date, Feedback.status " +
                            "FROM Feedback INNER JOIN Users ON Feedback.userID = Users.userID INNER JOIN " +
                            "CustomersInfo ON Users.userName = CustomersInfo.userName WHERE " +
                            column + " LIKE '%" + keyword + "%' AND Feedback.status='Unread'";
                             
        
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        grdCustomers.DataSource = ds;
        grdCustomers.DataBind();

        con.Close();
    }

    //====================================
    //====================================    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 2)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                btnOK.Visible = false;

                if (!IsPostBack)
                    GetCustomerFeedback();
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

    //====================================
    //====================================

    protected void grdCustomers_SelectedIndexChanged(object sender, EventArgs e)
    {        
        Session["feedbackID"] = grdCustomers.SelectedRow.Cells[0].Text;
        Session["userID"] = grdCustomers.SelectedRow.Cells[1].Text;
        Session["businessName"] = grdCustomers.SelectedRow.Cells[2].Text;
        Session["businessTelNo"] = grdCustomers.SelectedRow.Cells[3].Text;
        Session["feedbackCommSugg"] = grdCustomers.SelectedRow.Cells[4].Text;
        Session["customerEmail"] = grdCustomers.SelectedRow.Cells[5].Text;
        Session["date"] = grdCustomers.SelectedRow.Cells[6].Text;
        Session["status"] = grdCustomers.SelectedRow.Cells[7].Text;

        GetCustomerFeedbackDetails();        

        if (txtstatus.Text == "Unread")
        {
            btnOK.Visible = true;
            grdCustomers.Enabled = false;
        }
        else
        {
            grdCustomers.Enabled = true;
        }
                
        imgBusiness.Visible = true;

        string message = "Hello, " + grdCustomers.SelectedRow.Cells[2].Text + "! <br /><br /> " +
                "Your Feedback / Review has been read. <br /> <br />" +
                "Rest assured that we will take all necessary actions with your feedback.<br /> <br />" +
                "Thank you.  <br /> <br /> <br />" +
                "Best Regards, <br />" +
                "Oversea Plastic Manufacturing";

        Helper.SendEmail(grdCustomers.SelectedRow.Cells[5].Text, "Feedback/Review Read", message);
    }

    protected void grdCustomers_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        
    }

    protected void grdCustomers_PageIndexChanged(object sender, EventArgs e)
    {

    }

    //====================================
    //====================================

    protected void grdCustomers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdCustomers.PageIndex = e.NewPageIndex;

        if (txtKeyword.Text == "")
        {
            GetCustomerFeedback();
        }

        else
        {
            GetCustomerFeedback(ddlColumns.SelectedItem.Value, txtKeyword.Text);
        }
    }

    //====================================
    //====================================

    protected void grdCustomers_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
    }

    //====================================
    //====================================

    protected void btnOK_Click(object sender, EventArgs e)
    { 
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "UPDATE Feedback SET status='Read' WHERE feedbackID=@feedbackID";

        com.Parameters.Add("@feedbackID", SqlDbType.Int).Value = Session["feedbackID"].ToString();

        com.Parameters.Add("@status", SqlDbType.NVarChar).Value = "Read";

        try
        {
            com.ExecuteNonQuery();
            lblMessage.Text = "Customer Feedback has been Read!";
            lblMessage.Visible = true;
        }

        catch
        {
            lblMessage.Text = "Error found!";
            lblMessage.Visible = true;
        }

        finally
        {
            con.Close();
        }

        grdCustomers.Enabled = true;

        btnOK.Visible = false;

        Helper.ClearTextboxes(this.Controls);
        
        imgBusiness.Visible = false;

        Response.Redirect("http://localhost:12345/FINAL CAPSTONE/Secretary/ViewFeedback.aspx");
    }

    //====================================
    //====================================

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        GetCustomerFeedback(ddlColumns.SelectedItem.Value, txtKeyword.Text);
    }

    //====================================
    //====================================

    protected void btnViewAll_Click(object sender, EventArgs e)
    {
        txtKeyword.Text = "";
        GetCustomerFeedback();

        Helper.ClearTextboxes(this.Controls);

        imgBusiness.Visible = false;
    }

    //====================================
    //====================================
}