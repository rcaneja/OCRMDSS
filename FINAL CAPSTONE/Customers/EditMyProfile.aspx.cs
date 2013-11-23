using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Customers_EditMyProfile : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 1)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                if (!IsPostBack)
                {
                    GetProfile();
                }
                pError.Visible = false;
                pSuccess.Visible = false;
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

    //=======================================
    //=======================================

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;

            com.CommandText = "UPDATE CustomersInfo SET businessLogo=@businessLogo, " +
                    "businessName=@businessName, businessAddress=@businessAddress, " +
                    "businessTelNo=@businessTelNo, businessLocalNo=@businessLocalNo, "+
                    "businessCPNo=@businessCPNo, businessFaxNo=@businessFaxNo, " +                    
                    "customerImage=@customerImage, customerLN=@customerLN, " +
                    "customerFN=@customerFN, " +
                    "customerEmail=@customerEmail " +
                    "WHERE userName=@userName";

            if (fubusinessLogo.HasFile)
            {
                com.Parameters.Add("@businessLogo", SqlDbType.Text).Value = "http://localhost:12345/FINAL%20CAPSTONE/assets/img/Business/" + fubusinessLogo.FileName;
                fubusinessLogo.SaveAs(Server.MapPath("../assets/img/Business/" + fubusinessLogo.FileName));
            }

            else
            {
                com.Parameters.Add("@businessLogo", SqlDbType.Text).Value = imgBusiness.ImageUrl;
            }

            com.Parameters.Add("@businessName", SqlDbType.NVarChar).Value = txtbusinessName.Text;
            com.Parameters.Add("@businessAddress", SqlDbType.Text).Value = txtbusinessAddress.Text;
            com.Parameters.Add("@businessTelNo", SqlDbType.NVarChar).Value = txtbusinessTelNo.Text;
            com.Parameters.Add("@businessLocalNo", SqlDbType.NVarChar).Value = txtbusinessLocalNo.Text;
            com.Parameters.Add("@businessCPNo", SqlDbType.NVarChar).Value = txtbusinessCPNo.Text;
            com.Parameters.Add("@businessFaxNo", SqlDbType.NVarChar).Value = txtbusinessFaxNo.Text;
            
            if (fuuserImage.HasFile)
            {
                com.Parameters.Add("@customerImage", SqlDbType.Text).Value = "http://localhost:12345/FINAL%20CAPSTONE/assets/img/ContactPerson/" + fuuserImage.FileName;
                fuuserImage.SaveAs(Server.MapPath("../assets/img/ContactPerson/" + fuuserImage.FileName));
            }

            else
            {
                com.Parameters.Add("@customerImage", SqlDbType.Text).Value = imgUser.ImageUrl;
            }

            com.Parameters.Add("@customerLN", SqlDbType.NVarChar).Value = txtLN.Text;
            com.Parameters.Add("@customerFN", SqlDbType.NVarChar).Value = txtFN.Text;
            com.Parameters.Add("@customerEmail", SqlDbType.NVarChar).Value = txtEmailAddress.Text;
            
            com.Parameters.Add("@userName", SqlDbType.NVarChar).Value = Session["userName"].ToString();

            com.ExecuteNonQuery();
            pSuccess.Visible = true;
            lblSuccess.Text = "Profile has been updated!";
            lblSuccess.Visible = true;
        }
        catch
        {
            pError.Visible = false;
            lblError.Text = "Error found!";
            lblError.Visible = true;
        }

        finally
        {
            con.Close();
            GetProfile();
        }

        txtbusinessAddress.Enabled = false;
        txtbusinessCPNo.Enabled = false;
        txtbusinessFaxNo.Enabled = false;
        txtbusinessLocalNo.Enabled = false;
        txtbusinessName.Enabled = false;
        txtbusinessTelNo.Enabled = false;
        txtEmailAddress.Enabled = false;
        txtFN.Enabled = false;
        txtLN.Enabled = false;

        btnSave0.Visible = false;
        btnCancel.Text = "Back";
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Customers/MyProfile.aspx");
    }

    void GetProfile()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM dbo.Users AS A INNER JOIN dbo.CustomersInfo AS B ON A.userName = B.userName " +
            "WHERE A.userName=@userName";
        com.Parameters.Add("@userName", SqlDbType.NVarChar).Value = Session["userName"].ToString();

        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            txtbusinessName.Text = dr["businessName"].ToString();
            txtbusinessAddress.Text = dr["businessAddress"].ToString();
            txtbusinessTelNo.Text = dr["businessTelNo"].ToString();
            txtbusinessLocalNo.Text = dr["businessLocalNo"].ToString();
            txtbusinessCPNo.Text = dr["businessCPNo"].ToString();
            txtbusinessFaxNo.Text = dr["businessFaxNo"].ToString();
            
            txtLN.Text = dr["customerLN"].ToString();
            txtFN.Text = dr["customerFN"].ToString();
            txtEmailAddress.Text = dr["customerEmail"].ToString();
            
            if (dr["businessLogo"] == DBNull.Value || dr["customerImage"] == DBNull.Value)
            {
                imgBusiness.ImageUrl = "http://localhost:12345/FINAL%20CAPSTONE/assets/img/Business/noImage.jpg";
                imgUser.ImageUrl = "http://localhost:12345/FINAL%20CAPSTONE/assets/img/ContactPerson/noImage.jpg";
            }
            else
            {
                imgBusiness.ImageUrl = dr["businessLogo"].ToString();
                imgUser.ImageUrl = dr["customerImage"].ToString();
            }
        }
        dr.Close();
        con.Close();
    }
}