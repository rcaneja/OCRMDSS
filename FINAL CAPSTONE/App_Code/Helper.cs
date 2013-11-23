using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Text;
using System.Security.Cryptography;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Net;

public class Helper
{
    //Establishing connection string
    public static string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
    }

	public Helper()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static string Encrypt(string toEncrypt, bool useHashing)
    {
        byte[] keyArray;
        byte[] toEncryptArray = UTF8Encoding.UTF8.GetBytes(toEncrypt);

        System.Configuration.AppSettingsReader settingsReader =
                                            new AppSettingsReader();
        // Get the key from config file

        string key = "password";
        //System.Windows.Forms.MessageBox.Show(key);
        //If hashing use get hashcode regards to your key
        if (useHashing)
        {
            MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
            keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
            //Always release the resources and flush data
            // of the Cryptographic service provide. Best Practice

            hashmd5.Clear();
        }
        else
            keyArray = UTF8Encoding.UTF8.GetBytes(key);

        TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
        //set the secret key for the tripleDES algorithm
        tdes.Key = keyArray;
        //mode of operation. there are other 4 modes.
        //We choose ECB(Electronic code Book)
        tdes.Mode = CipherMode.ECB;
        //padding mode(if any extra byte added)

        tdes.Padding = PaddingMode.PKCS7;

        ICryptoTransform cTransform = tdes.CreateEncryptor();
        //transform the specified region of bytes array to resultArray
        byte[] resultArray =
          cTransform.TransformFinalBlock(toEncryptArray, 0,
          toEncryptArray.Length);
        //Release resources held by TripleDes Encryptor
        tdes.Clear();
        //Return the encrypted data into unreadable string format
        return Convert.ToBase64String(resultArray, 0, resultArray.Length);
    }

    public static string Decrypt(string cipherString, bool useHashing)
    {
        byte[] keyArray;
        //get the byte code of the string

        byte[] toEncryptArray = Convert.FromBase64String(cipherString);

        System.Configuration.AppSettingsReader settingsReader =
                                            new AppSettingsReader();
        //Get your key from config file to open the lock!
        string key = "password";

        if (useHashing)
        {
            //if hashing was used get the hash code with regards to your key
            MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
            keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
            //release any resource held by the MD5CryptoServiceProvider

            hashmd5.Clear();
        }
        else
        {
            //if hashing was not implemented get the byte code of the key
            keyArray = UTF8Encoding.UTF8.GetBytes(key);
        }

        TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
        //set the secret key for the tripleDES algorithm
        tdes.Key = keyArray;
        //mode of operation. there are other 4 modes. 
        //We choose ECB(Electronic code Book)

        tdes.Mode = CipherMode.ECB;
        //padding mode(if any extra byte added)
        tdes.Padding = PaddingMode.PKCS7;

        ICryptoTransform cTransform = tdes.CreateDecryptor();
        byte[] resultArray = cTransform.TransformFinalBlock(
                             toEncryptArray, 0, toEncryptArray.Length);
        //Release resources held by TripleDes Encryptor                
        tdes.Clear();
        //return the Clear decrypted TEXT
        return UTF8Encoding.UTF8.GetString(resultArray);       

    }

    //for clearing textboxes
    public static void ClearTextboxes(ControlCollection cc)
    {
        foreach (Control ctrl in cc)
        {
            TextBox tb = ctrl as TextBox;
            if (tb != null)
            {
                tb.Text = "";
            }
            else
            {
                ClearTextboxes(ctrl.Controls);
            }
        }
    }

    //for rptPrepared By:
    public static string GetUserFullName(string userID)
    {
        string name = "";
        SqlConnection con = new SqlConnection(GetConnectionString());
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT employeeFN + ' ' + employeeLN AS FullName WHERE employeeID=@employeeID";
        com.Parameters.Add("@employeeID", SqlDbType.Int).Value = userID;
        con.Close();
        return name;
    }


    //email genereation
    public static void SendEmail(string email, string subject, string message)
    {
        MailMessage msg = new MailMessage();
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.EnableSsl = true;
        NetworkCredential NetworkCred = new NetworkCredential();
        NetworkCred.UserName = "overseaplastic@gmail.com";
        NetworkCred.Password = "plastic921";
        smtp.UseDefaultCredentials = true;
        smtp.Credentials = NetworkCred;
        smtp.Port = 587;
        msg.To.Add(email);
        msg.From = new MailAddress("overseaplastic@gmail.com");
        msg.Subject = subject;
        msg.IsBodyHtml = true;
        msg.Body = message;
        smtp.Send(msg);
    }

}