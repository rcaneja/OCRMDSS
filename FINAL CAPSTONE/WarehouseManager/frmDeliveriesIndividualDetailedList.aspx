<%@ Page Title="Deliveries Individual Detailed List" Language="C#" MasterPageFile="~/WarehouseManager/MasterPage.master" AutoEventWireup="true" CodeFile="frmDeliveriesIndividualDetailedList.aspx.cs" Inherits="WarehouseManager_Reports_frmDeliveriesIndividualDetailedList" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
    <br />
    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" 
        AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="1202px" 
        ReportSourceID="CrystalReportSource1" ToolbarImagesFolderUrl="" 
        ToolPanelWidth="200px" Width="1104px" PageZoomFactor="75" />

    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="Reports\rptDeliveriesIndividualDetailedList.rpt">
        </Report>
    </CR:CrystalReportSource>
</asp:Content>

