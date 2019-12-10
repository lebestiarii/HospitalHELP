<%@ Page Title="Confirmation Report" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConfirmReport.aspx.cs" Inherits="HospitalHELP.ConfirmationReport" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Headers --%>
    <h1>Certification Records Request</h1>
    <h3>Employee Certification Report</h3>

    <%-- Alerts --%>
    <div id="alrtSuccess" runat="server"
        class="alert alert-success alert-dismissible col-sm-offset-1 col-sm-10 text-center" role="alert">
        <asp:Label runat="server" ID="lblSuccess">
                Query Successful! Please select how you would like to retrieve your report!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button></asp:Label>
    </div>

    <%-- GridView --%>
    <div class="form-group">
        <div class="col-xs-12 col-sm-offset-1 col-sm-10 table-responsive">
            <asp:GridView ID="grdReportQuery" runat="server" AutoGenerateColumns="False"
                OnPreRender="grdReportQuery_PreRender"
                CssClass="table table-bordered table-condensed" BackColor="White" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="CertShortName" HeaderText="Certification" SortExpression="CertShortName" />
                    <asp:BoundField DataField="CompletionDate" HeaderText="Completion Date" SortExpression="CompletionDate" />
                </Columns>
                <HeaderStyle CssClass="bg-hospitalgrey" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HospitalHELPAzureString %>"
                SelectCommand="SELECT e.LastName, e.FirstName, c.CertShortName, ec.CompletionDate FROM Employee AS e INNER JOIN EmployeeCertification AS ec ON e.EmployeeID = ec.EmployeeID INNER JOIN Certification AS c ON ec.CertificationID = c.CertificationID INNER JOIN Department AS d ON e.DepartmentID = d.DepartmentID WHERE (ec.CompletionDate <= @CompletionDate) AND (d.DepartmentID = @department) ORDER BY ec.CompletionDate, e.LastName">
                <SelectParameters>
                    <asp:CookieParameter CookieName="ExpDate" Name="CompletionDate" Type="DateTime" />
                    <asp:CookieParameter CookieName="Department" Name="department" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>

    <%-- Buttons --%>
    <div class="form-group">
        <div class="col-sm-offset-1 col-sm-9">
            <asp:Button ID="btnPrint" runat="server" CssClass="btn btn-primary"
                Text="Print" OnClick="btnPrint_Click"
                ToolTip="Print the displayed report."/>
            <asp:Button ID="btnEmail" runat="server" CssClass="btn btn-default"
                Text="Email"
                ToolTip="Send report in an email." />
            <asp:Button ID="btnReturn" runat="server" CssClass="btn btn-success"
                PostBackUrl="~/Default.aspx" Text="Return" CausesValidation="False"
                ToolTip="Return to the Request Form webpage." OnClick="btnReturn_Click" />
        </div>
    </div>

    <%-- Message Label --%>
    <div class="form-group">
        <div class="text-center">
            <asp:Label ID="lblMessage" runat="server" CssClass="text-info"></asp:Label>
        </div>
    </div>

</asp:Content>
