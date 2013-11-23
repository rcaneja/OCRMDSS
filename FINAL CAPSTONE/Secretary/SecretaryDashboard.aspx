<%@ Page Title="Secretary Dashboard" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="SecretaryDashboard.aspx.cs" Inherits="Secretary_SecretaryDashboard" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="main" ContentPlaceHolderID="mainContent" Runat="Server">
    <span class="label label-success text-left" style="width: 100%; background-color:#26972D"><h4 style="display:inline-block">Customers</h4><span class="badge badge-danger" style="margin: 10px 0 0 20px;"><asp:Label ID="lblCustomerCount" runat="server" CssClass="pull-right"></asp:Label></span></span>
    <asp:GridView ID="grdCustomers" runat="server" AutoGenerateColumns="False"
                DataKeyNames="customerID,userID" CssClass="width100 table table-hover" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AllowPaging="True" PageSize="5" DataSourceID="dsCustomers">
                <Columns>
                    <asp:BoundField DataField="customerID" HeaderText="customerID" InsertVisible="False" ReadOnly="True" SortExpression="customerID" >
                    <ControlStyle CssClass="hide" /><FooterStyle CssClass="hide" /><HeaderStyle CssClass="hide" /><ItemStyle CssClass="hide" />
                    </asp:BoundField>
                    <asp:BoundField DataField="businessName" HeaderText="Business Name" SortExpression="businessName" />
                    <asp:BoundField DataField="businessAddress" HeaderText="Business Address" SortExpression="businessAddress" />
                    <asp:BoundField DataField="businessTelNo" HeaderText="Business Contact Details" SortExpression="businessTelNo" />
                </Columns>
            <EmptyDataTemplate>
            <span class="boldFont text-center label label-warning">No New Customers!</span>
            </EmptyDataTemplate>  
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#CC3333" ForeColor="White" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
    <asp:SqlDataSource ID="dsCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnection %>" SelectCommand="SELECT A.customerID, A.userName, A.businessLogo, A.businessName, A.businessAddress, A.businessTelNo, A.businessLocalNo, A.businessCPNo, A.businessFaxNo, A.customerImage, A.customerLN, A.customerFN, A.customerEmail, B.userID, B.userName AS Expr1, B.userPW, B.userType, B.validation, B.approval FROM CustomersInfo AS A INNER JOIN Users AS B ON A.userName = B.userName WHERE (B.userType = @userType) AND (B.validation = @validation)">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="userType" Type="Int32" />
            <asp:Parameter DefaultValue="Pending" Name="validation" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br /><br /><span class="label label-success text-left" style="width: 100%; background-color:#26972D"><h4 style="display:inline-block">Orders</h4><span class="badge badge-danger" style="margin: 10px 0 0 20px;"><asp:Label ID="lblOrdersCount" runat="server" CssClass="pull-right"></asp:Label></span></span>
                <asp:GridView CssClass="width100 table table-hover" ID="grdOrders" runat="server" 
                    AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
                    CellPadding="4" Width="814px" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" ForeColor="Black" PageSize="5" DataSourceID="dsOrders" GridLines="Horizontal" DataKeyNames="userID,orderID,customerID1">  
                    
                    <Columns>
                        <asp:BoundField DataField="orderID" HeaderText="orderID" InsertVisible="False" ReadOnly="True" SortExpression="orderID" >
                        <ControlStyle CssClass="hide" /><FooterStyle CssClass="hide" /><HeaderStyle CssClass="hide" /><ItemStyle CssClass="hide" />
                        </asp:BoundField>
                        <asp:BoundField DataField="businessName" HeaderText="Business Name" SortExpression="businessName" />
                        <asp:BoundField DataField="businessTelNo" HeaderText="Business Tel. No." SortExpression="businessTelNo" />
                        <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" DataFormatString="{0:#,##0.00}"/>
                        <asp:BoundField DataField="orderStatus" HeaderText="Order Status" SortExpression="orderStatus" />
                        <asp:BoundField DataField="deliveryStatus" HeaderText="Delivery Status" SortExpression="deliveryStatus" />
                    </Columns>

                <EmptyDataTemplate>
            <span class="boldFont text-center label label-warning">No New Orders!</span>
            </EmptyDataTemplate>  
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#CC3333" ForeColor="White" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>

                <asp:SqlDataSource ID="dsOrders" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnection %>" SelectCommand="SELECT * FROM Users AS A INNER JOIN Orders AS B  ON A.userID = B.userID INNER JOIN CustomersInfo AS C ON A.userName = C.userName WHERE B.validation=@validation">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Pending" Name="validation" Type="String" />
                    </SelectParameters>
    </asp:SqlDataSource>

                <br /><br />
    <br /><br /><span class="label label-success text-left" style="width: 100%; background-color:#26972D"><h4 style="display:inline-block">Account Recievables</h4><span class="badge badge-danger" style="margin: 10px 0 0 20px;"><asp:Label ID="lblPaymentCount" runat="server" CssClass="pull-right"></asp:Label></span></span>
        <asp:GridView ID="grdPayment" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" ForeColor="Black" CssClass="width100 table table-hover"
                    BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" BorderStyle="None" 
                    AllowPaging="True" DataSourceID="dsPayment" PageSize="5" GridLines="Horizontal">
            
                <Columns>
                        <asp:BoundField DataField="businessName" HeaderText="Company" SortExpression="businessName" />
                        <asp:BoundField DataField="businessAddress" HeaderText="Address" SortExpression="businessAddress" />
                        <asp:BoundField DataField="deliveryMode" HeaderText="Delivery Mode" SortExpression="deliveryMode" />
                        <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" DataFormatString="{0:#,##0.00}"/>
                        <asp:BoundField DataField="orderStatus" HeaderText="Status" SortExpression="orderStatus" />
                        <asp:BoundField DataField="validation1" HeaderText="isValidated?" SortExpression="validation1" />
                        <asp:BoundField DataField="readyForDelivery" HeaderText="isReadyToDeliver?" SortExpression="readyForDelivery" />
                        <asp:BoundField DataField="deliveryStatus" HeaderText="Delivery Status" SortExpression="deliveryStatus" />
                        <asp:BoundField DataField="paymentStatus" HeaderText="Payment Status" SortExpression="paymentStatus" />
                        </Columns>

            <EmptyDataTemplate>
            <span class="boldFont text-center label label-warning">No Unpaid Orders Found!</span>
            </EmptyDataTemplate>  
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#CC3333" ForeColor="White" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
                <asp:SqlDataSource ID="dsPayment" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnection %>" SelectCommand="SELECT * FROM [Orders] WHERE (([paymentStatus] = @paymentStatus) AND ([deliveryStatus] = @deliveryStatus)) ORDER BY [deliveryDate] DESC">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Unpaid" Name="paymentStatus" Type="String" />
                        <asp:Parameter DefaultValue="Approved" Name="deliveryStatus" Type="String" />
                    </SelectParameters>
    </asp:SqlDataSource>
                <br /><br />
    <span class="label label-success text-left" style="width: 100%; background-color:#26972D"><h4 style="display:inline-block">Delivery Status</h4><span class="badge badge-danger" style="margin: 10px 0 0 20px;"><asp:Label ID="lblDeliveryCount" runat="server" CssClass="pull-right"></asp:Label></span></span>
        <asp:GridView ID="grdDeliveryStatus" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" ForeColor="Black" CssClass="width100 table table-hover"
            BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" BorderStyle="None" AllowPaging="True" DataSourceID="dsDeliverySchedule" PageSize="5" GridLines="Horizontal">
            
                <Columns>
                        <asp:BoundField DataField="businessName" HeaderText="Business Name" SortExpression="businessName" />
                        <asp:BoundField DataField="deliveryDate" HeaderText="Delivery Date" SortExpression="deliveryDate" DataFormatString="{0:MMMM d, yyyy}"/>
                        <asp:BoundField DataField="deliveryMode" HeaderText="Shipping Mode" SortExpression="deliveryMode" />
                        <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" DataFormatString="{0:#,##0.00}"/>
                        <asp:BoundField DataField="orderStatus" HeaderText="Order Status" SortExpression="orderStatus" />
                        <asp:BoundField DataField="deliveryStatus" HeaderText="Delivery Status" SortExpression="deliveryStatus" />
                    </Columns>

            <EmptyDataTemplate>
            <span class="boldFont text-center label label-warning">No New Approved Deliveries!</span>
            </EmptyDataTemplate>  
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#CC3333" ForeColor="White" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
            <asp:SqlDataSource ID="dsDeliverySchedule" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnection %>" SelectCommand="SELECT * FROM Users AS A INNER JOIN Orders AS B  ON A.userID = B.userID INNER JOIN CustomersInfo AS C ON A.userName = C.userName WHERE B.orderStatus='Approved' AND B.deliveryStatus='Pending' ORDER BY CONVERT(DateTime, orderDate,101)  DESC">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Approved" Name="orderStatus" Type="String" />
                </SelectParameters>
    </asp:SqlDataSource>
            <br /><br />
        <span class="label label-success text-left" style="width: 100%; background-color:#26972D"><h4 style="display:inline-block">Inquiries</h4><span class="badge badge-danger" style="margin: 10px 0 0 20px;"><asp:Label ID="lblInquiriesCount" runat="server" CssClass="pull-right"></asp:Label></span></span>
    <asp:GridView CssClass="width100 table table-hover" ID="grdCustomersInqury" 
                    runat="server" AllowPaging="True" AllowSorting="True" 
                    AutoGenerateColumns="False" CellPadding="4" 
                    ForeColor="Black" BackColor="White" BorderColor="#CCCCCC" 
                    BorderStyle="None" BorderWidth="1px" GridLines="Horizontal" DataSourceID="dsInquiries" PageSize="5">
                    
                    <Columns>
                        <asp:BoundField DataField="inquiryFN" HeaderText="First Name" />
                        <asp:BoundField DataField="inquiryLN" HeaderText="Last Name" />
                        <asp:BoundField DataField="inquiryEmail" HeaderText="Email Address" />
                        <asp:BoundField DataField="inquiryContactNo" HeaderText="Contact No." />
                        <asp:BoundField DataField="inquiryMessage" HeaderText="Message" />
                        <asp:BoundField DataField="status" HeaderText="Status" />
                    </Columns>
                    
                <EmptyDataTemplate>
                <span class="boldFont text-center label label-warning">No New Inquiries Found!</span>
                </EmptyDataTemplate>  
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#CC3333" ForeColor="White" Font-Bold="True" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
    <asp:SqlDataSource ID="dsInquiries" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnection %>" SelectCommand="SELECT * FROM [Inquiry] WHERE ([status] = @status)">
        <SelectParameters>
            <asp:Parameter DefaultValue="Unread" Name="status" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br /><br />
    <span class="label label-success text-left" style="width: 100%; background-color:#26972D"><h4 style="display:inline-block">Feedback</h4><span class="badge badge-danger" style="margin: 10px 0 0 20px;"><asp:Label ID="lblFeedbackCount" runat="server" CssClass="pull-right"></asp:Label></span></span>
    <asp:GridView CssClass="width100 table table-hover" ID="grdCustomersFeedback" 
        runat="server" AllowPaging="True" AllowSorting="True" 
                AutoGenerateColumns="False" BackColor="White" 
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                CellPadding="4" ForeColor="Black" GridLines="Horizontal" 
        DataSourceID="dsFeedback" PageSize="5">
                <Columns>
                        <asp:BoundField DataField="feedbackID" HeaderText="feedbackID" 
                            InsertVisible="False" ReadOnly="True" SortExpression="feedbackID" >
                            <ControlStyle CssClass="hide" /><FooterStyle CssClass="hide" /><HeaderStyle CssClass="hide" /><ItemStyle CssClass="hide" />
                            </asp:BoundField>
                        <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" DataFormatString="{0:MMMM d, yyyy}"/>                          
                        <asp:BoundField DataField="businessName" HeaderText="Business Name" 
                            SortExpression="businessName" />
                        <asp:BoundField DataField="businessTelNo" HeaderText="Business Tel. No." SortExpression="businessTelNo" />
                        <asp:BoundField DataField="feedbackCommSugg" HeaderText="Feedback, Comments or Suggestions" 
                            SortExpression="feedbackCommSugg" />    
                </Columns>
                
            <EmptyDataTemplate>
            <span class="boldFont text-center label label-warning">No New Feedback Found!</span>
            </EmptyDataTemplate>  
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#CC3333" ForeColor="White" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
    <asp:SqlDataSource ID="dsFeedback" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyConnection %>" 
        SelectCommand="SELECT Feedback.feedbackID, CustomersInfo.customerID, CustomersInfo.businessName, CustomersInfo.businessTelNo, CustomersInfo.customerEmail, Feedback.feedbackCommSugg, Feedback.date, Feedback.status FROM Feedback INNER JOIN Users ON Feedback.userID = Users.userID INNER JOIN CustomersInfo ON Users.userName = CustomersInfo.userName AND Feedback.status = 'Unread' WHERE (Feedback.status = @status)">
        <SelectParameters>
            <asp:Parameter DefaultValue="Unread" Name="status" />
        </SelectParameters>
    </asp:SqlDataSource>    
    
               <br /><br /><span class="label label-success text-left" style="width: 100%; background-color:#26972D"><h4 style="display:inline-block">Inventories</h4></span>
        <asp:GridView ID="grdInventory" runat="server" AutoGenerateColumns="False" 
        AllowPaging="True" CssClass="width100 table table-hover" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
        BorderWidth="1px" CellPadding="4" ForeColor="Black" DataSourceID="dsInventory" PageSize="5" GridLines="Horizontal" HorizontalAlign="Center">
                <Columns>
                        <asp:BoundField DataField="inventoryID" HeaderText="Inventory ID" SortExpression="inventoryID" InsertVisible="False" ReadOnly="True" >
                        <ControlStyle CssClass="hide" /><FooterStyle CssClass="hide" /><HeaderStyle CssClass="hide" /><ItemStyle CssClass="hide" />
                        </asp:BoundField>
                        <asp:BoundField DataField="productName" HeaderText="Product Name" SortExpression="productName" />
                        <asp:BoundField DataField="productSerialNo" HeaderText="Serial No" SortExpression="productSerialNo" />
                        <asp:BoundField DataField="productStatus" HeaderText="Status" SortExpression="productStatus" />
                        <asp:BoundField DataField="productCriticalLevel" HeaderText="Critical Level" SortExpression="productCriticalLevel" />
                        <asp:BoundField DataField="existingStock" HeaderText="Current Stock" SortExpression="existingStock" DataFormatString="{0:0,0}"/>
                </Columns>

            <EmptyDataTemplate>
            <span class="boldFont text-center label label-warning">No New Inventory!</span>
            </EmptyDataTemplate>  
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#CC3333" ForeColor="White" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
                <asp:SqlDataSource ID="dsInventory" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnection %>" SelectCommand="SELECT * FROM [Inventory] INNER JOIN dbo.Products ON Inventory.productSerialNo = Products.productSerialNo ORDER BY [inventoryID] DESC"></asp:SqlDataSource>
</asp:Content>