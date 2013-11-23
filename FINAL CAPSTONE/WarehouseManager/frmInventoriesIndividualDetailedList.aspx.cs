using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class WarehouseManager_Reports_frmInventoriesIndividualDetailedList : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    //====================================
    //====================================

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["userType"]) == 3)
        {
            if (Session["isApproved"].ToString() == "Approved")
            {
            }
            else
            {
                Response.Redirect("http://localhost:12345/FINAL CAPSTONE/WaitforConfirmation.aspx");
            }
        }
        else
        {
            Response.Redirect("http://localhost:12345/FINAL CAPSTONE/Login.aspx");
        }
    }
}