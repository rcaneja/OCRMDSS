<%@ Page Title="" Language="C#" MasterPageFile="~/Secretary/MasterPage.master" AutoEventWireup="true" CodeFile="ViewPaymentStatus.aspx.cs" Inherits="Secretary1_ViewPaymentStatus" %>

<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" Runat="Server">
    <h2>View Payment Status</h2>
        <asp:Label ID="lblSearch" runat="server" Text="Looking for  " ></asp:Label>
        <asp:DropDownList ID="ddlColumns" runat="server" CssClass="dropdown"> 
            <asp:ListItem Value="C.businessName">Business Name</asp:ListItem>   
            <asp:ListItem Value="B.orderDate">Order Date</asp:ListItem>
            <asp:ListItem Value="B.deliveryDate">Delivery Date</asp:ListItem>
            <asp:ListItem Value="B.deliveryMode">Delivery Mode</asp:ListItem>    
            <asp:ListItem Value="B.amount">Amount</asp:ListItem> 
            <asp:ListItem Value="B.orderStatus">Order Status</asp:ListItem>  
            <asp:ListItem Value="B.deliveryStatus">Delivery Status</asp:ListItem>         
            <asp:ListItem Value="B.paymentStatus">Payment Status</asp:ListItem>               
        </asp:DropDownList>
        <asp:TextBox ID="txtKeyword" runat="server" placeholder="Search..."></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Search" onclick="btnSearch_Click" CssClass="btn btn-primary width150px marginB10px" />
        <asp:Button ID="btnViewAll" runat="server" CausesValidation="False" onclick="btnViewAll_Click" Text="View All" CssClass="btn btn-primary width150px marginB10px"/>
        <br />
        <br />
        <asp:GridView ID="grdOrders" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" CssClass="table table-hover width100"
            onpageindexchanging="grdOrders_PageIndexChanging" onselectedindexchanged="grdOrders_SelectedIndexChanged" 
            BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" BorderStyle="None" GridLines="Horizontal" AllowPaging="True">
            
                <Columns>
                        <asp:BoundField DataField="orderID" HeaderText="ID" SortExpression="orderID" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="businessName" HeaderText="Company" SortExpression="businessName" />
                        <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" />
                        <asp:BoundField DataField="orderStatus" HeaderText="Status" SortExpression="orderStatus" />
                        <asp:BoundField DataField="deliveryStatus" HeaderText="Delivery Status" SortExpression="deliveryStatus" />
                        <asp:BoundField DataField="paymentStatus" HeaderText="Payment Status" SortExpression="paymentStatus" />
                        <asp:TemplateField>
                            <ItemTemplate>
                            <a href="http://localhost:12345/FINAL%20CAPSTONE/Secretary/UpdatePaymentStatus.aspx?orderID=<%# Eval("orderID") %>" class="btn btn-primary text-center pull-right">View Details</a>
                            </ItemTemplate>
                        </asp:TemplateField>        
                </Columns>

            <EmptyDataTemplate><span class="boldFont text-center label label-warning">No Unpaid Balances Found!.</span></EmptyDataTemplate>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#CC3333" ForeColor="White" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <br /><br />
        
        <br /><br /><br /><br />

</asp:Content>

