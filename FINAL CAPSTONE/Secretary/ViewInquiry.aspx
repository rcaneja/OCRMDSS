<%@ Page Title="View Inquiries" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="ViewInquiry.aspx.cs" Inherits="Secretary_ViewInquiry" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="main" ContentPlaceHolderID="mainContent" Runat="Server">
    <p class="alert alert-success alert-block lineheight40 boldFont text-center" id="pSuccess" runat="server"><asp:Label ID="lblSuccess" runat="server" Visible="false"></asp:Label></p> 
    <p class="alert alert-danger alert-block lineheight40 boldFont text-center" id="pError" runat="server"><asp:Label ID="lblError" runat="server" CssClass="lineheight40 boldFont" Visible="false"></asp:Label></p>  
    <h3>View Inquiries</h3>
    <hr />
        <asp:DropDownList ID="ddlColumns" runat="server" CssClass="dropdown">
            <asp:ListItem Value="inquiryID">Inquiry ID</asp:ListItem>
            <asp:ListItem Value="inquiryFN">First Name</asp:ListItem>
            <asp:ListItem Value="inquiryLN">Last Name</asp:ListItem>
            <asp:ListItem Value="inquiryEmail">Email Address</asp:ListItem>
            <asp:ListItem Value="inquiryContactNo">Contact No.</asp:ListItem>
            <asp:ListItem Value="status">Status</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="txtKeyword" runat="server" placeholder="keyword"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvKeyword" runat="server" CssClass="label label-important" 
        ControlToValidate="txtKeyword" Display="Dynamic" 
        ErrorMessage="Insert keyword here." Font-Size="Small" ForeColor="White" 
        ClientIDMode="Static"></asp:RequiredFieldValidator>
        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary width150px marginB10px" onclick="btnSearch_Click" />
        <asp:Button ID="btnViewAll" runat="server" CausesValidation="False" CssClass="btn btn-primary width150px marginB10px" onclick="btnViewAll_Click" Text="View All" />
            <br /><br />
                <asp:GridView CssClass="table table-hover width100" ID="grdCustomers" 
                    runat="server" AllowPaging="True" AllowSorting="True" 
                    AutoGenerateColumns="False" CellPadding="4" onselectedindexchanged="grdCustomers_SelectedIndexChanged" 
                    ForeColor="Black" onpageindexchanging="grdCustomers_PageIndexChanging" 
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal" PageSize="5">
                    
                    <Columns>
                        <asp:BoundField DataField="inquiryID" HeaderText="Inquiry ID" />
                        <asp:BoundField DataField="inquiryFN" HeaderText="First Name" />
                        <asp:BoundField DataField="inquiryLN" HeaderText="Last Name" />
                        <asp:BoundField DataField="inquiryEmail" HeaderText="Email Address" />
                        <asp:BoundField DataField="inquiryContactNo" HeaderText="Contact No." />
                        <asp:BoundField DataField="inquiryMessage" HeaderText="Message" />
                        <asp:BoundField DataField="status" HeaderText="Status" />
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" SelectText="View" >
                        <ControlStyle CssClass="btn btn-primary width150px" />
                        </asp:CommandField>
                    </Columns>

                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                    <EmptyDataTemplate> No records found. </EmptyDataTemplate>
                </asp:GridView>
                <br />
        <h3>Detaied Information</h3>
        <hr />

        <span style="float: left; width: 200px;"><asp:Label ID="lblinquiryID" runat="server" Text="Inquiry ID" CssClass="labellarge" ></asp:Label></span>
        <asp:TextBox ID="txtinquiryID" runat="server" CssClass="input-xlarge" placeholder="Inquiry ID" Enabled="False"></asp:TextBox><br />
        <span style="float: left; width: 200px;"><asp:Label ID="lblinquiryFN" runat="server" Text="First Name" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtinquiryFN" runat="server" CssClass="input-xlarge" placeholder="First Name" Enabled="False"></asp:TextBox><br />
        <span style="float: left; width: 200px;"><asp:Label ID="lblinquiryLN" runat="server" Text="Last Name" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtinquiryLN" runat="server" CssClass="input-xlarge" placeholder="Last Name" Enabled="False"></asp:TextBox><br />
        <span style="float: left; width: 200px;"> <asp:Label ID="lblinquiryEmail" runat="server" Text="Email Address" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtinquiryEmail" runat="server" CssClass="input-xlarge" placeholder="Email Address" Enabled="False"></asp:TextBox><br />
        <span style="float: left; width: 200px;"> <asp:Label ID="lblinquiryContactNo" runat="server" Text="Contact No." CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtinquiryContactNo" runat="server" CssClass="input-xlarge" placeholder="Contact No." Enabled="False"></asp:TextBox><br />
        <span style="float: left; width: 200px;"> <asp:Label ID="lblinquiryMessage" runat="server" Text="Message" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtinquiryMessage" runat="server" CssClass="input-xlarge" placeholder="Message" Enabled="False" TextMode="MultiLine"></asp:TextBox><br />
        <span style="float: left; width: 200px;"> <asp:Label ID="lbldate" runat="server" Text="Inquiry Date" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtdate" runat="server" CssClass="input-xlarge" placeholder="Inquiry Date" Enabled="False"></asp:TextBox><br />
        <span style="float: left; width: 200px;"> <asp:Label ID="lblstatus" runat="server" Text="Status" CssClass="labellarge"></asp:Label></span>
        <asp:TextBox ID="txtstatus" runat="server" CssClass="input-xlarge" placeholder="Status" Enabled="False"></asp:TextBox><br />
        <br /><br />
        <asp:Button ID="btnOK" runat="server" CssClass="btn btn-primary btn-large" Text="OK" onclick="btnOK_Click" />
        <br /><br /><br />
 </asp:Content>


