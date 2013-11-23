<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="AdminDashboard.aspx.cs" Inherits="Admin_AdminDashboard" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="main" ContentPlaceHolderID="mainContent" Runat="Server">
    
    <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Employees</h4></span>
    <br /><br />

    <asp:GridView ID="grdEmployees" runat="server" AutoGenerateColumns="False"
                DataKeyNames="userID" CssClass="width100 table table-hover" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
        <Columns>
            <asp:BoundField DataField="userName" HeaderText="Username" SortExpression="userName" >
            </asp:BoundField>
            <asp:BoundField DataField="employeeLN" HeaderText="Lastname" SortExpression="employeeLN" >
            </asp:BoundField>
            <asp:BoundField DataField="employeeFN" HeaderText="Firstname" SortExpression="employeeFN" />                       
        </Columns>
        <EmptyDataTemplate>
            <span class="boldFont text-center label label-warning">No Records Found!</span>
        </EmptyDataTemplate>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" ForeColor="White" Font-Bold="True" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>

    <div style="height:405px;"></div>
        
</asp:Content>


