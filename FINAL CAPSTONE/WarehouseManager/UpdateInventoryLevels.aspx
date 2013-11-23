<%@ Page Title="" Language="C#" MasterPageFile="~/WarehouseManager/MasterPage.master" AutoEventWireup="true" CodeFile="UpdateInventoryLevels.aspx.cs" Inherits="WarehouseManager_UpdateInventoryLevels" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" Runat="Server">
    <p class="alert alert-success alert-block lineheight40 boldFont text-center" id="pSuccess" runat="server"><asp:Label ID="lblSuccess" runat="server" Visible="false"></asp:Label></p>
    <p class="alert alert-danger alert-block lineheight40 boldFont text-center" id="pError" runat="server"><asp:Label ID="lblError" runat="server" CssClass="lineheight40 boldFont" Visible="false"></asp:Label></p>
    <h2>Detailed Inventory Data</h2>
    <div class="pull-right"><br /><asp:Image ID="imgProduct" runat="server" CssClass="img-rounded imgBusiLogo" Height="200px" Width="190px"/></div>
    <h3>Product Details</h3><hr />
    
    <asp:Label ID="lblProdID" runat="server" Text="Product Identification Number:" CssClass="labellarge"></asp:Label><br />
    <asp:Textbox ID="txtProdID" runat="server" CssClass="input-xlarge" placeholder="Product Status" Enabled="False"></asp:TextBox><br />
    
    <asp:Label ID="lblProdName" runat="server" Text="Product Name:" CssClass="labellarge"></asp:Label><br />
    <asp:TextBox ID="txtProdName" runat="server"  CssClass="input-xlarge" placeholder="Product Status" Enabled="False"></asp:TextBox><br />
    
    <asp:Label ID="lblproductSerialNo" runat="server" Text="Product Serial No:" CssClass="labellarge"></asp:Label><br />
    <asp:TextBox ID="txtProdSerialNo" runat="server"  CssClass="input-xlarge" placeholder="Product Status" Enabled="False"></asp:TextBox><br />
    
    <asp:Label ID="lblProdClassName" runat="server" Text="Product Class:" CssClass="labellarge"></asp:Label><br /> 
    <asp:TextBox ID="txtProdClassName" runat="server"  CssClass="input-xlarge" placeholder="Product Status" Enabled="False"></asp:TextBox><br />

    <asp:Label ID="lblProdSubClass" runat="server" Text="Product Type:" CssClass="labellarge"></asp:Label><br />
    <asp:TextBox ID="txtProdSubClass" runat="server"  CssClass="input-xlarge" placeholder="Product Status" Enabled="False"></asp:TextBox><br />
    
    <asp:Label ID="lblProdDescription" runat="server" Text="Product Description:" CssClass="labellarge"></asp:Label><br /> 
    <asp:TextBox ID="txtProdDescription" runat="server"  CssClass="input-xlarge" placeholder="Product Status" Enabled="False"></asp:TextBox><br />

    <asp:Label ID="lblProdUnitPrice" runat="server" Text="Product Unit Price:" CssClass="labellarge"></asp:Label><br />
    <asp:TextBox ID="txtProdUnitPrice" runat="server"  CssClass="input-xlarge" placeholder="Product Status" Enabled="False"></asp:TextBox><br />

    <asp:Label ID="lblProdStatus" runat="server" Text="Product Status:" CssClass="labellarge"></asp:Label><br />
    <asp:TextBox ID="txtproductStatus" runat="server"  CssClass="input-xlarge" placeholder="Product Status" Enabled="False"></asp:TextBox><br />

    
    <br /><br />

    <h3>Inventory Details</h3><hr />
    <asp:Label ID="lblinventoryID" runat="server" Text="Inventory ID" CssClass="labellarge"></asp:Label><br />
    <asp:TextBox ID="txtinventoryID" runat="server" CssClass="input-xlarge" placeholder="Inventory ID" Enabled="False"></asp:TextBox><br />
    
    <asp:Label ID="lblCriticalLevel" runat="server" Text="Product Critical Level" CssClass="labellarge"></asp:Label><br />
    <asp:TextBox ID="txtCriticalLevel" runat="server" CssClass="input-xlarge" placeholder="Warehouse Stock" Enabled="False"></asp:TextBox><br />
    
    <asp:Label ID="lblwarehouseStock" runat="server" Text="Warehouse Stock" CssClass="labellarge"></asp:Label><br />
    <asp:TextBox ID="txtwarehouseStock" runat="server" TextMode="MultiLine" CssClass="input-xlarge" placeholder="Warehouse Stock" Enabled="False"></asp:TextBox><br />
    
    <asp:Label ID="lblExistingStock" runat="server" Text="Existing Stock" CssClass="labellarge"></asp:Label><br />
    <asp:TextBox ID="txtExistingStock" runat="server" TextMode="MultiLine" CssClass="input-xlarge" placeholder="Warehouse Stock" Enabled="False"></asp:TextBox><br />
    
    <asp:Label ID="lblbatchNo" runat="server" Text="Produced Batch No." CssClass="labellarge"></asp:Label>
    <br />
    <asp:TextBox ID="txtbatchNo" runat="server" CssClass="input-xlarge" placeholder="Produced Batch No."></asp:TextBox>
    <asp:FilteredTextBoxExtender ID="txtbatchNo_FilteredTextBoxExtender" runat="server" ClientIDMode="Static" Enabled="True" 
        FilterType="Numbers" TargetControlID="txtbatchNo">
    </asp:FilteredTextBoxExtender>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtbatchNo" Display="Dynamic" 
        ErrorMessage="Insert Produced Batch No. here." Font-Size="Small" ForeColor="White" ClientIDMode="Static" CssClass="label label-important"></asp:RequiredFieldValidator>
    <br />    
    <asp:Label ID="lblproducedStock" runat="server" Text="Produced Stock" CssClass="labellarge"></asp:Label><br />
    <asp:TextBox ID="txtproducedStock" runat="server" CssClass="input-xlarge" placeholder="Produced Stock"></asp:TextBox>
    <asp:FilteredTextBoxExtender ID="txtproducedStock_FilteredTextBoxExtender" 
    runat="server" ClientIDMode="Static" Enabled="True" FilterType="Numbers" 
    TargetControlID="txtproducedStock">
    </asp:FilteredTextBoxExtender>
    
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
    ControlToValidate="txtproducedStock" Display="Dynamic" 
    ErrorMessage="Insert Produced Stock here." Font-Size="Small" ForeColor="White" 
    ClientIDMode="Static" CssClass="label label-important"></asp:RequiredFieldValidator>
    <br />
            
    
    <br />
    <br />
    
    <asp:Button ID="btnUpdate" runat="server" onclick="btnUpdate_Click" Text="Update Inventory Level" CssClass="btn btn-primary width250 btn-large marginBoth"/>
    <a href="http://localhost:12345/FINAL%20CAPSTONE/WarehouseManager/AddInventory.aspx" class="btn btn-primary width250 btn-large marginBoth" id="btn" runat="server"><asp:label id="lblBTN" runat="server" Text="Cancel" onclick="btnCancel_Click"></asp:label></a>
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <br />
</asp:Content>

