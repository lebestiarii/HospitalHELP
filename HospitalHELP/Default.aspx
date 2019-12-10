<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HospitalHELP.Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Headers --%>
    <h1>Certification Records Request</h1>
    <h3>Request Criteria</h3>

    <%-- Alerts --%>
    <div class="alert alert-info alert-dismissible col-sm-offset-2 col-sm-8 text-center" role="alert">
        <asp:Label runat="server">Use the following controls to select your report criteria for a report of employee credential expiration dates. 
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button></asp:Label>
    </div>

    <%-- Report Dropdown List --%>
    <div class="form-group">
        <label class="col-sm-3 control-label">Report Type:</label>
        <div class="col-sm-4">
            <asp:DropDownList ID="ddlReportType" runat="server" CssClass="form-control"
                ToolTip="Selects the report type based on time frame required." AutoPostBack="True">
                <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                <asp:ListItem>Monthly</asp:ListItem>
                <asp:ListItem>Quarterly</asp:ListItem>
                <asp:ListItem>Annual</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-sm-4">

            <!-- ddlReportType selection validation -->
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger"
                runat="server" ControlToValidate="ddlReportType" Display="Dynamic"
                ErrorMessage="Please select a Report Type. "></asp:RequiredFieldValidator>
        </div>
    </div>

    <%--Expiration Date --%>
    <div class="form-group">
        <label class="col-sm-3 control-label">Expiration Date:</label>
        <div class="col-sm-4">
            <asp:TextBox ID="txtExpDate" runat="server" TextMode="DateTime"
                CssClass="form-control"
                ToolTip="Date is selected based on the Report Type control." ReadOnly="True"></asp:TextBox>
        </div>

        <!-- Regular Expression Validation for the Date -->
        <div class="col-sm-4">
            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtExpDate"
                ValidationExpression="^(((0?[1-9]|1[012])/(0?[1-9]|1\d|2[0-8])|(0?[13456789]|1[012])/(29|30)|(0?[13578]|1[02])/31)/(19|[2-9]\d)\d{2}|0?2/29/((19|[2-9]\d)(0[48]|[2468][048]|[13579][26])|(([2468][048]|[3579][26])00)))$$"
                ErrorMessage="Invalid date format. Please select a Report Type." CssClass="text-danger"></asp:RegularExpressionValidator>
        </div>

    </div>

    <%-- Department Dropdown List --%>
    <div class="form-group">
        <label class="col-sm-3 control-label">Department</label>
        <div class="col-sm-4">
            <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control"
                ToolTip="Selects the name of the Department to query against." DataSourceID="SqlDataSource1" DataTextField="Department" DataValueField="DepartmentID">
                <asp:ListItem Text="Department" Value="DepartmentID" Selected="True"></asp:ListItem>
            </asp:DropDownList>

            <%-- EntityDataSource --%>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HospitalHELPAzureString %>"
                SelectCommand="SELECT [DepartmentID], [Department] FROM [Department] ORDER BY [Department]"></asp:SqlDataSource>
        </div>

        <!-- ddlDepartment selection validation -->
        <div class="col-sm-4">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger"
                runat="server" ControlToValidate="ddlDepartment" Display="Dynamic"
                ErrorMessage="Please select a department"></asp:RequiredFieldValidator>
        </div>
    </div>

    <%-- Buttons --%>
    <div class="form-group">
        <div class="col-sm-offset-3 col-sm-9">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary"
                OnClick="btnSubmit_Click"
                ToolTip="Submits the selected options provides a report meeting the selected criteria." />
            <asp:Button ID="btnClear" runat="server" Text="Clear Form" CssClass="btn btn-default"
                CausesValidation="False" OnClick="btnClear_Click"
                ToolTip="Resets the controls to original state." />
        </div>
    </div>

    <%-- Message Label --%>
    <div class="form-group">
        <div class="text-center">
            <asp:Label ID="lblMessage" runat="server" CssClass="text-info"></asp:Label>
        </div>
    </div>

</asp:Content>
