<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="HospitalHELP.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Headers --%>
    <h1>About Us</h1>
    <h3>Uh Oh, Bad News!</h3>
    <div class="alert alert-danger alert-dismissable col-sm-offset-1 col-sm-10 text-center" role="alert">
        <asp:Label runat="server">This Hospital is definitely not a real hospital. 
                Do not actually try to seek care at this virtual hospital.
                Please seek care at an actual hospital!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button></asp:Label>
    </div>

    <%-- Content Table --%>
    <div class="form-group">
        <ul class="list-group col-sm-offset-1 col-sm-10">
            <li class="list-group-item">We are <strong>NOT</strong> part of any health insurance network!</li>
            <li class="list-group-item">We only accept American Express and Discover credit cards.</li>
            <li class="list-group-item">There is no physical location for this hospital!</li>
            <li class="list-group-item">This database shows you how many of our employees are <strong>NOT</strong> licensed!</li>
            <li class="list-group-item">Our employees are <strong>NOT REAL</strong>!</li>
        </ul>
    </div>

    <%-- Buttons --%>
    <div class="form-group">
        <div class="col-sm-offset-1 col-sm-10">
            <asp:Button ID="btnGetMeOut" runat="server" Text="Get me out of here!" CssClass="btn btn-danger pull-right"
                PostBackUrl="~/Default.aspx" ToolTip="Takes you far away from this page!" />
        </div>
    </div>

    <%-- Message Label --%>
    <div class="form-group">
        <div class="text-center">
            <asp:Label ID="lblMessage" runat="server" CssClass="text-info"></asp:Label>
        </div>
    </div>

</asp:Content>
