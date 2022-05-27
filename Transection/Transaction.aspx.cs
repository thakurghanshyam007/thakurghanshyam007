using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;

namespace Transection
{
    public partial class Transaction : System.Web.UI.Page
    {
        Database db = DatabaseFactory.CreateDatabase("txnConString");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                DbCommand cmd = db.GetStoredProcCommand("GetBalance");
                DataSet ds = new DataSet();
                ds = db.ExecuteDataSet(cmd);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    hfBalance.Value = ds.Tables[0].Rows[0][0].ToString();
                }
                else
                {
                    hfBalance.Value = "0";
                }
            }

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                Int32 balance = Convert.ToInt32(hfBalance.Value);
                bool s = true;
                if (ddlType.SelectedValue == "Cr")
                {
                    balance += Convert.ToInt32(txtAmount.Text.Trim());
                }
                else
                {
                    if (balance >= Convert.ToInt32(txtAmount.Text.Trim()))
                    {
                        balance -= Convert.ToInt32(txtAmount.Text.Trim());
                    }
                    else
                    {
                        s = false;
                    }
                }
                if (s)
                {
                    DbCommand cmd = db.GetStoredProcCommand("SetTransaction");
                    db.AddInParameter(cmd, "@txn_type", DbType.String, ddlType.SelectedValue);
                    db.AddInParameter(cmd, "@txn_amount", DbType.String, txtAmount.Text.Trim());
                    db.AddInParameter(cmd, "@txn_balance", DbType.String, balance);
                    db.AddInParameter(cmd, "@txn_desc", DbType.String, txtDesc.Text.Trim());
                    int t = db.ExecuteNonQuery(cmd);
                    if (t > 0)
                    {
                        ddlType.SelectedIndex = 0;
                        txtAmount.Text = "";
                        txtDesc.Text = "";
                        string str = "<script language='JavaScript'>alert('Transaction has been Saved Successfully.');</script>";
                        ClientScript.RegisterStartupScript(this.GetType(), "Alert", str);
                    }
                }
                else
                {
                    txtAmount.Text = "";
                    string str = "<script language='JavaScript'>alert('Do not have sufficiant balance to debit amount.');</script>";
                    ClientScript.RegisterStartupScript(this.GetType(), "Alert", str);
                }
            }
            catch (Exception ex)
            {
                throw;
            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ddlType.SelectedIndex = 0;
            txtAmount.Text = "";
            txtDesc.Text = "";
        }


    }
}