using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace Transection
{

    public partial class _Default : Page
    {
        Database db = DatabaseFactory.CreateDatabase("txnConString");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (!IsPostBack)
                {
                    bindTransaction();
                }

            }
        }
        private void bindTransaction()
        {
            DbCommand cmd = db.GetStoredProcCommand("GetTransaction");
            gvTransaction.DataSource = db.ExecuteDataSet(cmd);
            gvTransaction.DataBind();
        }
        
    }
}