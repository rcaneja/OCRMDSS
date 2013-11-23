<%@ Page Title="" Language="C#" MasterPageFile="~/WarehouseManager/MasterPage.master" AutoEventWireup="true" CodeFile="ViewScheduledDelivery.aspx.cs" Inherits="WarehouseManager_ViewScheduledDelivery" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" Runat="Server">
    <h2>View Scheduled Delivery</h2>
        <asp:Label ID="lblSearch" runat="server" Text="Looking for" ></asp:Label>
            <br />
            <br />
        <asp:DropDownList ID="ddlColumns" runat="server" CssClass="dropdown">             
            <asp:ListItem Value="C.businessName">Business Name</asp:ListItem>   
            <asp:ListItem Value="B.orderDate">Order Date</asp:ListItem>
            <asp:ListItem Value="B.deliveryDate">Delivery Date</asp:ListItem>
            <asp:ListItem Value="B.deliveryMode">Delivery Mode</asp:ListItem>    
            <asp:ListItem Value="B.amount">Amount</asp:ListItem> 
            <asp:ListItem Value="B.orderStatus">Order Status</asp:ListItem>  
            <asp:ListItem Value="B.deliveryStatus">Delivery Status</asp:ListItem> 
        </asp:DropDownList>

        <asp:TextBox ID="txtKeyword" runat="server" placeholder="Search..."></asp:TextBox>
        <asp:FilteredTextBoxExtender ID="txtKeyword_FilteredTextBoxExtender" 
            runat="server" ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars" 
            InvalidChars="~`!@#$%^&amp;*(){}[]-_=+\';:&quot;|?&gt;&lt;,./;&<>@ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðòóôõö÷øùúûüýþÿŒœŠšŸƒˆ˜–—‘’‚“”„‹›¡¢£¤¥€¦§¨©ª«¬®¯ °±²³´µ¶•¸¹º»¼½¾¿ΓΔΘΛΞΠΣΦΨΩαβγδεζηθικλμνξοπρςστυφχψωϑϒϖ†‡•…‰′″‾⁄℘ℑℜ™ℵ←↑→↓↔↵⇐⇑⇒⇓⇔∀∂∃∅∇∈∉∋∏∑−∗√∝∞∠∧∨∩∪∫∴∼≅≈≠≡≤≥⊂⊃⊄⊆⊇⊕⊗⊥⋅⌈⌉⌊⌋⟨⟩◊♠♣♥♦&ensp;&emsp;&thinsp;&zwnj;&zwj;&lrm;&rlm;"
            TargetControlID="txtKeyword">
        </asp:FilteredTextBoxExtender>
        <br />
        <asp:Button ID="btnSearch" runat="server" Text="Search" onclick="btnSearch_Click" CssClass="btn btn-primary width150px" />
        <asp:Button ID="btnViewAll" runat="server" CausesValidation="False" onclick="btnViewAll_Click" Text="View All" CssClass="btn btn-primary width150px"/>
        <br />
        <br />
        <asp:GridView ID="grdOrders" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" CssClass="table table-hover width100"
            onpageindexchanging="grdOrders_PageIndexChanging" onselectedindexchanged="grdOrders_SelectedIndexChanged" 
            BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" BorderStyle="None" GridLines="Horizontal">
            
                <Columns>
                        <asp:BoundField DataField="orderID" HeaderText="Order ID" 
                            SortExpression="orderID" />
                        <asp:BoundField DataField="businessName" HeaderText="Business Name" 
                            SortExpression="businessName" />
                        <asp:BoundField DataField="deliveryDate" HeaderText="Delivery Date" 
                            SortExpression="deliveryDate" />
                        <asp:BoundField DataField="deliveryMode" HeaderText="Shipping Mode" 
                            SortExpression="deliveryMode" />
                        <asp:BoundField DataField="amount" HeaderText="Amount" 
                            SortExpression="amount" />
                        <asp:BoundField DataField="orderStatus" HeaderText="Order Status" 
                            SortExpression="orderStatus" />
                        <asp:BoundField DataField="deliveryStatus" HeaderText="Delivery Status" 
                            SortExpression="deliveryStatus" />
                        <asp:TemplateField>
                        <ItemTemplate>
                            <a href="http://localhost:12345/FINAL%20CAPSTONE/WarehouseManager/ScheduledDeliveryDetails.aspx?orderID=<%# Eval("orderID") %>" class="btn btn-primary text-center pull-right">View Details</a>
                        </ItemTemplate>
                        </asp:TemplateField>        
                </Columns>

            <EmptyDataTemplate> No records found. </EmptyDataTemplate>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" ForeColor="White" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <br /><br />
        <asp:Button ID="btnViewDetails" runat="server" Text="View Orders" CssClass="btn btn-primary btn-large pull-right" OnClick="btnViewDetails_Click" />
        <br /><br /><br /><br />
        <asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>
</asp:Content>

