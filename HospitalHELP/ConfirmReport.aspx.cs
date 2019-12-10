using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Caching;

namespace HospitalHELP
{
    public partial class ConfirmationReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
            lblMessage.Text = "Printing and emailing currently not supported, feature coming soon!";
            btnEmail.Enabled = false;
            btnPrint.Enabled = false;
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            
        }

        protected void grdReportQuery_PreRender(object sender, EventArgs e)
        {
            grdReportQuery.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
           
        }
    }
}