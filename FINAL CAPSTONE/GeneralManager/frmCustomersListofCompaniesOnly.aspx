<%@ Page Title="Customers List of Companies Only" Language="C#" MasterPageFile="~/GeneralManager/GeneralManager.master" AutoEventWireup="true" CodeFile="frmCustomersListofCompaniesOnly.aspx.cs" Inherits="GeneralManager_Reports_frmCustomersListofCompaniesOnly" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">
    <br />
    <CR:CrystalReportViewer
        ID="CrystalReportViewer1"
        runat="server"
        AutoDataBind="True"
        Height="1200px" ReportSourceID="CrystalReportSource1"
        Width="1000px" HasRefreshButton="True" PageZoomFactor="75" />


    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="Reports\rptCustomersListofCompaniesOnly.rpt">           
        </Report>
    </CR:CrystalReportSource>

</asp:Content>

