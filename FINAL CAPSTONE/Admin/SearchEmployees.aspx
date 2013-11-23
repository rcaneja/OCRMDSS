<%@ Page Title="Search Employee" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="SearchEmployees.aspx.cs" Inherits="Admin_SearchEmployees" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" Runat="Server">
   <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Search Employees</h4></span>
    <br /><br />
        <asp:DropDownList ID="ddlColumns" runat="server" CssClass="dropdown">
            <asp:ListItem Value="employeeID">ID</asp:ListItem>
            <asp:ListItem Value="employeeLN">Last Name</asp:ListItem>
            <asp:ListItem Value="employeeFN">First Name</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="txtKeyword" runat="server" placeholder="Keyword"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvKeyword" runat="server" 
            ControlToValidate="txtKeyword" Display="Dynamic" 
            ErrorMessage="Insert keyword here." Font-Size="Small" ForeColor="White" CssClass="label label-important"> 
        </asp:RequiredFieldValidator>

        <asp:FilteredTextBoxExtender ID="txtKeyword_FilteredTextBoxExtender" 
            runat="server" ClientIDMode="Static" Enabled="True" FilterMode="InvalidChars" 
            InvalidChars="~`!@#$%^&amp;*(){}[]-_=+\';:&quot;|?&gt;&lt;,./;&<>@ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðòóôõö÷øùúûüýþÿŒœŠšŸƒˆ˜–—‘’‚“”„‹›¡¢£¤¥€¦§¨©ª«¬®¯ °±²³´µ¶•¸¹º»¼½¾¿ΓΔΘΛΞΠΣΦΨΩαβγδεζηθικλμνξοπρςστυφχψωϑϒϖ†‡•…‰′″‾⁄℘ℑℜ™ℵ←↑→↓↔↵⇐⇑⇒⇓⇔∀∂∃∅∇∈∉∋∏∑−∗√∝∞∠∧∨∩∪∫∴∼≅≈≠≡≤≥⊂⊃⊄⊆⊇⊕⊗⊥⋅⌈⌉⌊⌋⟨⟩◊♠♣♥♦&ensp;&emsp;&thinsp;&zwnj;&zwj;&lrm;&rlm;"
            TargetControlID="txtKeyword">
        </asp:FilteredTextBoxExtender>

        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary width150px marginB10px" onclick="btnSearch_Click" />

        <asp:Button ID="btnViewAll" runat="server" CausesValidation="False" CssClass="btn btn-primary width150px marginB10px" onclick="btnViewAll_Click" Text="View All" />

        <br />

        <asp:GridView ID="grdEmployees" runat="server" AutoGenerateColumns="False" AllowPaging="True" 
            CssClass="table table-hover width100"
              onpageindexchanging="grdEmployees_PageIndexChanging" 
              onselectedindexchanged="grdEmployees_SelectedIndexChanged" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                <Columns>
                    <asp:BoundField DataField="employeeID" HeaderText="ID" />
                    <asp:BoundField DataField="userName" HeaderText="Username" />
                    <asp:BoundField DataField="employeeLN" HeaderText="Last Name" />
                    <asp:BoundField DataField="employeeFN" HeaderText="First Name" />                     
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" SelectText="View Details" ControlStyle-CssClass="btn btn-primary" >
                    <ControlStyle CssClass="btn btn-primary"></ControlStyle>
                    </asp:CommandField>
                </Columns>

            <EmptyDataTemplate> No records found. </EmptyDataTemplate>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>

        <asp:Label ID="lblMessage" runat="server" style="color:Red; text-align:right; 
            font-size:small; font-weight: 700;" Visible="false" CssClass="alert alert-error"></asp:Label><br />
        <br />
        <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Detailed Employees Information</h4></span>
        
        <div class="pull-right">
            <br />
            <span style="margin-right:20px;"><asp:Image ID="imgEmployee" runat="server" CssClass="img-rounded imgBusiLogo" Width="180px" Height="180px"/></span>
            </div>
    <br /><br />
       
        <asp:Label ID="lblUserName" runat="server" Text="UserName" 
            CssClass="labellarge"></asp:Label><br />

        <asp:TextBox ID="txtUserName" runat="server" CssClass="input-xlarge" 
            placeholder="Username" Enabled="False"></asp:TextBox><br />

        <asp:Label ID="lblemployeeLN" runat="server" Text="Last Name" 
            CssClass="labellarge"></asp:Label><br />

        <asp:TextBox ID="txtemployeeLN" runat="server" CssClass="input-xlarge" 
                    placeholder="Last Name" Enabled="False"></asp:TextBox><br />

        <asp:Label ID="lblemployeeFN" runat="server" Text="First Name" 
            CssClass="labellarge"></asp:Label><br />

        <asp:TextBox ID="txtemployeeFN" runat="server" CssClass="input-xlarge" 
                    placeholder="First Name" Enabled="False"></asp:TextBox><br />

    <br /><br /><br /><br /><br /><asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>

</asp:Content>

