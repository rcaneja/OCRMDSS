using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Customers_MyProfile : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 1)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
                if (!IsPostBack)
                    GetProfile();
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
                Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Home.aspx");
            }
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

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:12345/FINAL%20CAPSTONE/Customers/EditMyProfile.aspx");
    }

    protected void btnChangePW_Click(object sender, EventArgs e)
    {
        if (txtCurrentPW.Text != "" || txtNewPW.Text != "" || txtConfirmPW.Text != "")
        {
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT * FROM dbo.CustomersInfo AS A INNER JOIN dbo.Users AS B ON A.userName = B.userName WHERE A.userName='" + Session["userName"] + "'";

            SqlDataReader dr = com.ExecuteReader();

            while (dr.Read())
            {
                Session["dpw"] = dr["userPW"].ToString();
            }
            dr.Close();


            if (txtCurrentPW.Text == Helper.Decrypt(Session["dpw"].ToString(), true))
                {
                    if (txtNewPW.Text == "")
                    {
                        //do nothing
                    }

                    else
                    {
                        if (txtNewPW.Text == txtConfirmPW.Text)
                        {
                            com.CommandText = "UPDATE Users SET userPW=@userPW WHERE userName='" + Session["userName"] + "'";
                        }

                        else
                        {
                            pError.Visible = true;
                            lblError.Text = "Password did not match!";
                            lblError.Visible = true;
                            return;
                        }
                        com.Parameters.Add("@userPW", SqlDbType.NVarChar).Value = Helper.Encrypt(txtConfirmPW.Text, true);
                    }

                    com.ExecuteNonQuery();
                    pSuccess.Visible = true;
                    lblSuccess.Text = "Password has been changed!";
                    lblSuccess.Visible = true;
                }

                else
                {
                    pError.Visible = true;
                    lblError.Text = "Current Password is Invalid.";
                    lblError.Visible = true;
                }

            con.Close();
            GetProfile();
        }
        else
        {
            pError.Visible = true;
            lblError.Visible = true;
            lblError.Text = "You don't supply necessary information to change your credentials.";
        }
    }
}