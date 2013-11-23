<%@ Page Title="Inventories Master List" Language="C#" MasterPageFile="~/WarehouseManager/MasterPage.master" AutoEventWireup="true" CodeFile="frmInventoriesMasterList.aspx.cs" Inherits="WarehouseManager_Reports_frmInventoriesMasterList" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
    <br />
    <CR:CrystalReportViewer
        ID="CrystalReportViewer1"
        runat="server"
        AutoDataBind="True"
        Height="1200px" ReportSourceID="CrystalReportSource1"
        Width="1000px" HasRefreshButton="True" PageZoomFactor="75" />


    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="Reports\rptInventoriesMasterList.rpt">           
        </Report>
    </CR:CrystalReportSource>

</asp:Content>

