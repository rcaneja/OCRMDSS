<%@ Page Title="Add Products" Language="C#" MasterPageFile="~/GeneralManager/GeneralManager.master" AutoEventWireup="true" CodeFile="AddProducts.aspx.cs" Inherits="GeneralManager_AddProducts" Debug="true"%>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
    <p class="alert alert-success alert-block lineheight40 boldFont text-center" id="pSuccess" runat="server"><asp:Label ID="lblSuccess" runat="server" Visible="false"></asp:Label></p>
    <p class="alert alert-danger alert-block lineheight40 boldFont text-center" id="pError" runat="server"><asp:Label ID="lblError" runat="server" CssClass="lineheight40 boldFont" Visible="false"></asp:Label></p>

    <span class="label label-success" style="width: 100%; background-color:#26972D"><h4>Add Product</h4></span>
    <br /><br />
                               
            <table style="width: 100%; ">
                <tr>
                    <td class="input-mini" style="width: 185px; text-align: right; height: 20px;"><label ID="lblProductSerialNo" runat="server" style="width: 153px; height: 25px; float: right; margin-right: 0px;">
                        Product Serial Number<span style="font-weight: normal">:</span></label></td>
                    <td style="width: 189px; height: 20px;"><asp:TextBox ID="txtProductSerialNo" runat="server" CssClass="text" placeholder="Enter Product Serial Number"
                    ClientIDMode="Static" MaxLength="20" Width="250px" ></asp:TextBox></td>
                    <td style="height: 20px; width: 148px;"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ClientIDMode="Static" ControlToValidate="txtProductSerialNo" CssClass="alert" 
                    ErrorMessage="Input Product Serial Number" ForeColor="#FF3300" Width="118px"></asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td class="input-mini" style="width: 185px; text-align: right; height: 22px;"><label ID="lblProductName" runat="server" style="width: 107px; height: 25px; float: right;">
                        Product Name<span style="font-weight: normal">:</span></label></td>
                    <td style="width: 189px; height: 22px;"><asp:TextBox ID="txtProductName" runat="server" CssClass="text" placeholder="Enter Product Name"
                    ClientIDMode="Static" MaxLength="20" Width="250px" ></asp:TextBox></td>
                    <td style="height: 22px; width: 148px;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ClientIDMode="Static" ControlToValidate="txtProductName" CssClass="alert" 
                    ErrorMessage="Input Product Name" ForeColor="#FF3300" Width="118px"></asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td class="input-mini" style="width: 185px; text-align: right; height: 20px;">
                        <label ID="lblProductClassID" runat="server" 
                            style="width: 118px; height: 18px; float: right;">
                        Product Class ID<span style="font-weight: normal">:</span></label></td>
                    <td style="width: 189px; height: 20px;">
                        <asp:DropDownList ID="ddlProductClassID" runat="server" CssClass="dropdown">
                            <asp:ListItem Value="None">Select Product Class ID</asp:ListItem>
                            <asp:ListItem Value="hd-02">hd-02</asp:ListItem>
                            <asp:ListItem Value="pe-01">pe-01</asp:ListItem>
                            <asp:ListItem Value="pp-03">pp-03</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="height: 20px; width: 148px;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ClientIDMode="Static" ControlToValidate="ddlProductClassID" CssClass="alert" 
                    ErrorMessage="Input Product Class ID" ForeColor="#FF3300" Width="118px"></asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td class="input-mini" style="width: 185px; text-align: right; height: 20px;">
                        <label ID="lblProductSubClassID" runat="server" 
                            style="width: 145px; height: 24px; float: right;">
                        Product Subclass ID<span style="font-weight: normal">:</span></label></td>
                    <td style="width: 189px; height: 20px;"><asp:TextBox ID="txtProductSubClassID" runat="server" CssClass="text" placeholder="Enter Product Subclass ID as T3A for Trans 3A"
                    ClientIDMode="Static" MaxLength="20" Width="250px" ></asp:TextBox></td>
                    <td style="height: 20px; width: 148px;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ClientIDMode="Static" ControlToValidate="txtProductSubClassID" CssClass="alert" 
                    ErrorMessage="Input Product Subclass ID" ForeColor="#FF3300" Width="118px"></asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td class="input-mini" style="width: 185px; text-align: right; height: 20px;"><label ID="lblProductImage" runat="server" style="width: 102px; height: 25px; float: right;">
                        Product Image<span style="font-weight: normal">:</span></label></td>
                    <td style="width: 189px; height: 20px;"><asp:FileUpload ID="fuProductImage" runat="server" CssClass="btn-block"/></td>
                    <td style="height: 20px; width: 148px;"></td>
                </tr>

                <tr>
                    <td class="input-mini" style="width: 185px; text-align: right; height: 20px;"><label ID="lblUnitPrice" runat="server" style="width: 66px; height: 25px; float: right;">
                        Unit Price<span style="font-weight: normal">:</span></label></td>
                    <td style="width: 189px; height: 20px;"><div class="input-append">
                        <asp:TextBox ID="txtUnitPrice" runat="server" CssClass="text" placeholder="Enter Unit Price"
                    ClientIDMode="Static" MaxLength="20" ></asp:TextBox><span class="add-on">.00</span></div></td>
                    <td style="height: 20px; width: 148px;"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ClientIDMode="Static" ControlToValidate="txtUnitPrice" CssClass="alert" 
                    ErrorMessage="Input Price" ForeColor="#FF3300" Width="118px"></asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td class="input-mini" style="width: 185px; text-align: right; height: 36px;"><label ID="lblProductDescription" runat="server" style="width: 80px; height: 25px; float: right;">
                        Description<span style="font-weight: normal">:</span></label></td>
                    <td style="width: 189px; height: 20px;"><asp:TextBox ID="txtProductDescription" runat="server" CssClass="text" placeholder="Enter Product Description"
                    ClientIDMode="Static" MaxLength="20" Width="250px" TextMode="MultiLine" ></asp:TextBox></td>
                    <td style="height: 36px; width: 148px;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ClientIDMode="Static" ControlToValidate="txtProductDescription" CssClass="alert" 
                    ErrorMessage="Input Product Description" ForeColor="#FF3300" Width="118px"></asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td class="input-mini" style="width: 185px; text-align: right; height: 20px;"><label ID="lblCriticalLevel" runat="server" style="width: 95px; height: 25px; float: right;">
                        Critical Level:</label></td>
                    <td style="width: 189px; height: 20px;"><asp:TextBox ID="txtCriticalLevel" runat="server" CssClass="text" placeholder="Enter Critical Level in kgs"
                    ClientIDMode="Static" MaxLength="20" Width="250px" ></asp:TextBox></td>
                    <td style="height: 20px; width: 148px;"><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ClientIDMode="Static" ControlToValidate="txtCriticalLevel" CssClass="alert" 
                    ErrorMessage="Input Critical Level" ForeColor="#FF3300" Width="118px"></asp:RequiredFieldValidator></td>
                </tr>
                    </table>
                    
            <br />
            <br />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-primary width150px marginBoth" 
            style="float: right; font-size: 16px; margin-left: 0;" Height="38px" Width="188px" onclick="btnCancel_Click"/>
            <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary width150px" 
            style="float: right; font-size: 16px; margin-left: 0; margin-right: 11px;" Height="38px" Width="188px" onclick="btnAdd_Click"/>
        <br /><br /><br />
</asp:Content>

