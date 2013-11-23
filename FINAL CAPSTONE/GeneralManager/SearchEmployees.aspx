<%@ Page Title="Search Employees" Language="C#" MasterPageFile="~/GeneralManager/GeneralManager.master" AutoEventWireup="true" CodeFile="SearchEmployees.aspx.cs" Inherits="GeneralManager_SearchEmployees" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content3" ContentPlaceHolderID="main" Runat="Server">
     <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Search Employees</h4></span>
        <br /><br />
        <asp:DropDownList ID="ddlColumns" runat="server" CssClass="dropdown">
            <asp:ListItem Value="employeeID">ID</asp:ListItem>
            <asp:ListItem Value="employeeLN">Last Name</asp:ListItem>
            <asp:ListItem Value="employeeFN">First Name</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="txtKeyword" runat="server" placeholder="Search..."></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary width150px marginB10px" onclick="btnSearch_Click" />
        <asp:Button ID="btnViewAll" runat="server" CausesValidation="False" CssClass="btn btn-primary width150px marginB10px" onclick="btnViewAll_Click" Text="View All" />

        <br /><br />

        <asp:GridView ID="grdEmployees" runat="server" AutoGenerateColumns="False" AllowPaging="True" 
            CssClass="table table-hover width100"
              onpageindexchanging="grdEmployees_PageIndexChanging" 
              onselectedindexchanged="grdEmployees_SelectedIndexChanged" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                <Columns>
                    <asp:BoundField DataField="employeeID" HeaderText="ID" >
                    <ControlStyle CssClass="hide" /><FooterStyle CssClass="hide" /><HeaderStyle CssClass="hide" /><ItemStyle CssClass="hide" />
                    </asp:BoundField>
                    <asp:BoundField DataField="employeeLN" HeaderText="Last Name" />
                    <asp:BoundField DataField="employeeFN" HeaderText="First Name" />                     
                    <asp:TemplateField>
                        <ItemTemplate>
                        <a href="http://localhost:12345/FINAL%20CAPSTONE/GeneralManager/ApproveEmployees.aspx?employeeID=<%# Eval("employeeID") %>" class="btn btn-primary text-center pull-right">View Details</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                
                <EmptyDataTemplate>
                <span class="boldFont text-center label label-warning">No new employee for approval!</span>
                </EmptyDataTemplate>    
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView><br />   
</asp:Content>

