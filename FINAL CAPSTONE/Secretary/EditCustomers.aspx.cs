using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Secretary_EditCustomers : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

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

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 2)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                if (Request.QueryString["customerID"] != null)//has customerID
                {
                    pError.Visible = false;
                    pSuccess.Visible = false;
                    if (!IsPostBack)
                    {
                        GetProfile(Request.QueryString["customerID"].ToString());
                    }
                }
                else
                {
                    Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Secretary/ViewCustomers.aspx");
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

    protected void btnSave_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;

        com.CommandText = "UPDATE CustomersInfo SET businessName=@businessName, businessAddress=@businessAddress, businessTelNo=@businessTelNo, " +
            "businessLocalNo=@businessLocalNo, businessCPNo=@businessCPNo, businessFaxNo=@businessFaxNo, " +
            "customerLN=@customerLN, customerFN=@customerFN, customerEmail=@customerEmail " +
            "WHERE customerID=@customerID";

        com.Parameters.Add("@businessName", SqlDbType.NVarChar).Value = txtbusinessName.Text;
        com.Parameters.Add("@businessAddress", SqlDbType.Text).Value = txtbusinessAddress.Text;
        com.Parameters.Add("@businessTelNo", SqlDbType.NVarChar).Value = txtbusinessTelNo.Text;
        com.Parameters.Add("@businessLocalNo", SqlDbType.NVarChar).Value =  txtbusinessLocalNo.Text;
        com.Parameters.Add("@businessCPNo", SqlDbType.NVarChar).Value = txtbusinessCPNo.Text;
        com.Parameters.Add("@businessFaxNo", SqlDbType.NVarChar).Value = txtbusinessFaxNo.Text;
        com.Parameters.Add("@customerLN", SqlDbType.NVarChar).Value = txtLN.Text;
        com.Parameters.Add("@customerFN", SqlDbType.NVarChar).Value = txtFN.Text;
        com.Parameters.Add("@customerEmail", SqlDbType.NVarChar).Value = txtEmailAddress.Text;

        com.Parameters.Add("@customerID", SqlDbType.Int).Value = Request.QueryString["customerID"].ToString();

        try
        {
            com.ExecuteNonQuery();
            pSuccess.Visible = true;
            lblSuccess.Visible = true;
            lblSuccess.Text = "Customer information has been updated!";
        }

        catch
        {
            pError.Visible = true;
            lblError.Visible = true;
            lblError.Text = "Error found! Please try again.";
        }

        finally
        {
            con.Close();
            Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Secretary/ValidateCustomers.aspx?customerID=" + Request.QueryString["customerID"].ToString());
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Secretary/ValidateCustomers.aspx?customerID=" + Request.QueryString["customerID"].ToString());
        
    }
}