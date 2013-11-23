<%@ Page Title="View Feedback" Language="C#" MasterPageFile="~/Secretary/MasterPage.master" AutoEventWireup="true" CodeFile="ViewFeedback.aspx.cs" Inherits="Secretary_ViewFeedback" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" Runat="Server">
    <h3 style="margin-left:10px;">Feedback</h3>
    <hr />

        <asp:DropDownList ID="ddlColumns" runat="server" CssClass="dropdown">
            <asp:ListItem Value="feedbackID">Feedback ID</asp:ListItem>
            <asp:ListItem Value="feedback.userID">User ID</asp:ListItem>
            <asp:ListItem Value="businessName">Business Name</asp:ListItem>
            <asp:ListItem Value="businessAddress">Business Address</asp:ListItem>
            <asp:ListItem Value="businessTelNo">Business Telephone No.</asp:ListItem>              
            <asp:ListItem Value="date">Feedback Date</asp:ListItem>   
            <asp:ListItem Value="status">Status</asp:ListItem>                    
        </asp:DropDownList>

        <asp:TextBox ID="txtKeyword" runat="server" placeholder="keyword"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Search" onclick="btnSearch_Click" CssClass="btn btn-primary width150px marginB10px" />
        <asp:Button ID="btnViewAll" runat="server" CausesValidation="False" onclick="btnViewAll_Click" Text="View All" CssClass="btn btn-primary width150px marginB10px"/>
        <br />
        <br />
            <asp:GridView CssClass="table table-hover" ID="grdCustomers" runat="server" AllowPaging="True" AllowSorting="True" 
                AutoGenerateColumns="False" onselectedindexchanged="grdCustomers_SelectedIndexChanged" 
                onpageindexchanged="grdCustomers_PageIndexChanged" onpageindexchanging="grdCustomers_PageIndexChanging" 
                onselectedindexchanging="grdCustomers_SelectedIndexChanging" onrowcommand="grdCustomers_RowCommand" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                <Columns>
                        <asp:BoundField DataField="feedbackID" HeaderText="Feedback ID" />
                        <asp:BoundField DataField="customerID" HeaderText="Customer ID" />
                        <asp:BoundField DataField="businessName" HeaderText="Business Name" />
                        <asp:BoundField DataField="businessTelNo" HeaderText="Business Telephone No." />
                        <asp:BoundField DataField="feedbackCommSugg" HeaderText="Feedback Message" />  
                        <asp:BoundField DataField="customerEmail" HeaderText="Email Address" />
                        <asp:BoundField DataField="date" HeaderText="Feedback Date" />   
                        <asp:BoundField DataField="status" HeaderText="Status" />                    
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" SelectText="View Details" ControlStyle-CssClass="btn btn-primary width100px" >
<ControlStyle CssClass="btn btn-primary width100px"></ControlStyle>
                        </asp:CommandField>
                </Columns>
                <EmptyDataTemplate> No records found. </EmptyDataTemplate>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />

            </asp:GridView>
            
            <hr />

            <asp:Label ID="lblMessage" CssClass="alert alert-info" runat="server" Visible="false"></asp:Label>
            <br />
        
        <h3>Detailed Customer Feedback</h3>
        <asp:Image ID="imgBusiness" runat="server" Height="180px" Width="180px" CssClass="img-rounded imgBusiLogo pull-right"/>
        <br />
        <asp:Label ID="lblBusiName" runat="server" Text="Business Name:" CssClass="labellarge" ></asp:Label>
        <br />
        <asp:TextBox ID="txtbusinessName" runat="server" CssClass="input-xlarge" 
        placeholder="Business Name" Enabled="False"></asp:TextBox>
        <br />
        <asp:Label ID="lblBusiAdd" runat="server" Text="Business Address" CssClass="labellarge"></asp:Label>
        <br />
        <asp:TextBox ID="txtbusinessAddress" runat="server" TextMode="MultiLine" CssClass="input-xlarge" placeholder="Business Address" Enabled="False"></asp:TextBox>
        <br />
        <asp:Label ID="lblBusiTelNo" runat="server" Text="Business Contact No." CssClass="labellarge"></asp:Label>
        <br />
        <asp:TextBox ID="txtbusinessTelNo" runat="server" CssClass="input-xlarge" placeholder="Business Contact Number" Enabled="False"></asp:TextBox>
        <br />
        <asp:Label ID="lblfeedbackCommSugg" runat="server" Text="Feedback Message" CssClass="labellarge"></asp:Label>
        <br />
        <asp:TextBox ID="txtfeedbackCommSugg" runat="server" TextMode="MultiLine" CssClass="input-xlarge" placeholder="Feedback Message" Enabled="False"></asp:TextBox>
        <br />
        <asp:Label ID="lbldate" runat="server" Text="Feedback Date" CssClass="labellarge"></asp:Label>
        <br />
        <asp:TextBox ID="txtdate" runat="server" CssClass="input-xlarge" placeholder="Feedback Date" Enabled="False"></asp:TextBox>
        <br />
        <asp:Label ID="lblstatus" runat="server" Text="Status" CssClass="labellarge"></asp:Label>
        <br />
        <asp:TextBox ID="txtstatus" runat="server" CssClass="input-xlarge" placeholder="Status" Enabled="False"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnOK" runat="server" Text="OK" onclick="btnOK_Click" CssClass="btn btn-primary width150px" />
        <br />
        <br />
</asp:Content>

