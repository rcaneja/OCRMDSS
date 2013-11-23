using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Secretary1_CustomerDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 2)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                if (Request.QueryString["customerID"] != null)
                {
                    if (!IsPostBack)
                    {

                        getCustomer(Request.QueryString["customerID"].ToString());
                        pError.Visible = false;
                        pSuccess.Visible = false;
                    }
                }
                else
                    Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Secretary/SearchCustomers.aspx");
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

    void getCustomer(string customerID)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM CustomersInfo WHERE customerID = @customerID ";
        com.Parameters.Add("@customerID", SqlDbType.Int).Value = customerID;

        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                lbluserName.Text = dr["userName"].ToString();
                lblbusinessName.Text = dr["businessName"].ToString();
                lblbusinessAddress.Text = dr["businessAddress"].ToString();
                lblbusinessTelNo.Text = dr["businessTelNo"].ToString();
                lblbusinessLocalNo.Text = dr["businessLocalNo"].ToString();
                lblBusinessCPNo.Text = dr["businessCPNo"].ToString();
                lblbusinessFaxNo.Text = dr["businessFaxNo"].ToString();
                lblCustomerLN.Text = dr["customerLN"].ToString();
                lblCustomerFN.Text = dr["customerFN"].ToString();
                lblCustomerEmail.Text = dr["customerEmail"].ToString();

                if (dr["businessLogo"] == DBNull.Value || dr["customerImage"] == DBNull.Value)
                {
                    imgBusinessLogo.ImageUrl = "http://localhost:12345/FINAL%20CAPSTONE/assets/img/Business/noImage.jpg";
                    imgCP.ImageUrl = "http://localhost:12345/FINAL%20CAPSTONE/assets/img/ContactPerson/noImage.jpg";
                }
                else
                {
                    imgBusinessLogo.ImageUrl = dr["businessLogo"].ToString();
                    imgCP.ImageUrl = dr["customerImage"].ToString();
                }
            }
        }
        else
        {
            pError.Visible = true;
            lblError.Visible = true;
            lblError.Text = "You haven't selected an order to view its details.";
        }
        con.Close();
    }
}