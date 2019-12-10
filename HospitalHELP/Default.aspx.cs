using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Caching;

namespace HospitalHELP
{
    public partial class Default : Page
    {
        private string currentDate = DateTime.Today.ToShortDateString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
            GetExpirationDate();
        }

        // Creates a cookie and the expiry time for the cookie
        private void SetCookie(string name, string value, DateTime expiry)
        {
            HttpCookie cookie = new HttpCookie(name, value);
            cookie.Expires = expiry;
            Response.Cookies.Add(cookie);
        }


        // Submits the data to the Confirm Report webpage
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Creates cookies for ExpDate and Department values
                DateTime expiry = DateTime.Now.AddMinutes(5);
                SetCookie("ExpDate", txtExpDate.Text, expiry);
                SetCookie("Department", ddlDepartment.SelectedValue, expiry);

                // Redirects to the ConfirmReport page to display data based on the control selections
                Response.Redirect("~/ConfirmReport.aspx");
            }
        }

        // Resets the form
        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtExpDate.Text = "Date selected by Report Type";
            ddlReportType.SelectedIndex = -1;
            ddlDepartment.SelectedIndex = -1;
            lblMessage.Text = "Form Successfully Cleared.";

        }

        private void GetExpirationDate()
        {
            if (ddlReportType.SelectedValue == "Monthly")
            {
                txtExpDate.Text = DateTime.Today.AddMonths(1).ToShortDateString();
            }
            if (ddlReportType.SelectedValue == "Quarterly")
            {
                txtExpDate.Text = DateTime.Today.AddMonths(3).ToShortDateString();
            }
            if (ddlReportType.SelectedValue == "Annual")
            {
                txtExpDate.Text = DateTime.Today.AddYears(1).ToShortDateString();
            }
        }
    }
}