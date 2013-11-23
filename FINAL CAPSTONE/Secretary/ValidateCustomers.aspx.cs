using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Secretary_ValidateCustomers : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 2)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                checkStatus();
                if (Request.QueryString["customerID"] != null)//has customerID
                {
                    if (Session["status"].ToString() == "Validated" || Session["status"].ToString() == "Invalidated")
                    {
                        btnInvalidate.Visible = false;
                        btnValidate.Visible = false;
                        btnEdit.Visible = false;

                        btnCancel.Visible = true;
                        btnCancel.Text = "Back";
                        if (!IsPostBack)
                        {
                            GetProfile(Request.QueryString["customerID"].ToString());
                        }
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

    protected void btnValidate_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "UPDATE Users SET validation='Validated' FROM Users INNER JOIN CustomersInfo " +
                            "ON Users.userName = CustomersInfo.userName WHERE CustomersInfo.customerID=@customerID";

        com.Parameters.Add("@customerID", SqlDbType.Int).Value = Request.QueryString["customerID"].ToString();
        com.Parameters.Add("@validation", SqlDbType.NVarChar).Value = "Validated";

        try
        {
            com.ExecuteNonQuery();
            lblNoti.Text = "Customer registration is Validated!";
            lblNoti.Visible = true;
        }

        catch
        {
            lblNoti.Text = "Error found!";
            lblNoti.Visible = true;
        }

        finally
        {
            con.Close();
        }

        btnValidate.Visible = false;
        btnInvalidate.Visible = false;
        btnEdit.Visible = false;
        btnCancel.Text = "Back";
    }

    protected void btnInvalidate_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;

        com.CommandText = "UPDATE Users SET validation='Invalidated' FROM Users INNER JOIN CustomersInfo " +
                            "ON Users.userName = CustomersInfo.userName WHERE CustomersInfo.customerID=@customerID";

        com.Parameters.Add("@customerID", SqlDbType.Int).Value = Request.QueryString["customerID"].ToString();
        com.Parameters.Add("@validation", SqlDbType.NVarChar).Value = "Invalidated";

        try
        {
            com.ExecuteNonQuery();
            lblNoti.Text = "Customer registration is Invalidated!";
            lblNoti.Visible = true;
        }

        catch
        {
            lblNoti.Text = "Error found!";
            lblNoti.Visible = true;
        }

        finally
        {
            con.Close();
        }

        btnEdit.Visible = false;
        btnValidate.Visible = false;
        btnInvalidate.Visible = false;
        btnCancel.Text = "Back";
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL CAPSTONE/Secretary/ViewCustomers.aspx");
    }

    void checkStatus()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT B.validation FROM dbo.CustomersInfo AS A INNER JOIN dbo.Users AS B ON A.userName=B.userName WHERE A.customerID=@customerID";
        com.Parameters.Add("@customerID", SqlDbType.Int).Value = Request.QueryString["customerID"].ToString();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Session["status"] = dr["validation"].ToString();
        }
        dr.Close();
        con.Close();
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Secretary/EditCustomers.aspx?customerID=" + Request.QueryString["customerID"].ToString());
    }
}