<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report_income_detail.aspx.cs" Inherits="ESM企业薪酬管理系统.Report_income_detail" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payroll Management System</title>
    <link href="css/cfi_global.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- 页面顶端 开始 -->
        <table width="700" height="8" border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" align="center">
            <tr>
                <td></td>
            </tr>
        </table>

        <table width="700" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="700" height="4" border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCBC" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="700" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="700" height="2" border="0" cellpadding="0" cellspacing="0" bgcolor="#E0E0E0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="700" border="0" cellpadding="0" cellspacing="0" id="main_table">
            <tr>
                <td valign="top">
                    <div id="sub_body">
                        <div id="this_page_title">
                            <div id="item_line">
                                    <h1 id="sub_title" style="text-align:center"><asp:Label ID="lblSalaryTitle" runat="server" Text="XX年度收入细目"></asp:Label></h1>
                            </div>
                        </div>
                        <div id="sreach">
                            <fieldset class="pmsform">
                                <legend class="pmsform">选择查看年份</legend>
                                <br />
                                <label class="pmsform" id="project_name_label">
                                    年份：&nbsp;&nbsp;
                                    <asp:DropDownList ID="ddlYear" runat="server">
                                        <asp:ListItem Value="2007">2007年</asp:ListItem>
                                    </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btnView" runat="server" Text="查看该年年度收入细节" CssClass="blue_btn" 
                                         OnClick="btnView_Click"/>
                                </label><br />
                            </fieldset>
                        </div>
                                                <div>
                             &nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                      
                                                <div>
     &nbsp;&nbsp;&nbsp;&nbsp;
</div>
                                                <div>
     &nbsp;&nbsp;&nbsp;&nbsp;
                       <div id="show_my_income_summary" runat="server" style="display:none">
    <asp:GridView ID="gvIncomeDetails" runat="server" Width="100%" 
        AutoGenerateColumns="false" CellPadding="5" CellSpacing="1">
        <Columns>
            <asp:BoundField DataField="Time" HeaderText="时间" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="BaseSalary" HeaderText="基本工资" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" />
            <asp:BoundField DataField="HousingFund" HeaderText="住房公积金" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" />
            <asp:BoundField DataField="Pension" HeaderText="养老保险" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" />
            <asp:BoundField DataField="MedicalInsurance" HeaderText="医疗保险" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" />
            <asp:BoundField DataField="UnemploymentInsurance" HeaderText="失业保险" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" />
            <asp:BoundField DataField="OvertimePay" HeaderText="加班费" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" />
            <asp:BoundField DataField="Subsidy" HeaderText="补贴" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" />
            <asp:BoundField DataField="Reimbursement" HeaderText="报销" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" />
            <asp:BoundField DataField="PerformanceBonus" HeaderText="业绩奖" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" />
            <asp:BoundField DataField="LeaveDeduction" HeaderText="请假扣款" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" />
            <asp:BoundField DataField="MonthlyIncome" HeaderText="月收入" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" />
        </Columns>
        <HeaderStyle CssClass="table_header_td" />
        <RowStyle CssClass="table_dashedline_td" />
        <AlternatingRowStyle CssClass="table_dashedline_td_bg_gray" />
    </asp:GridView>
    <table width="100%" border="0" cellpadding="5" cellspacing="1">
        <tr>
            <td bgcolor="white" align="center">总计</td>
            <td bgcolor="white" colspan="11" align="right">
                <asp:Label ID="lblTotalIncome" runat="server" Text="人民币 0.00"></asp:Label>
            </td>
        </tr>
    </table>
</div>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="table_dashedline_td">
                    <asp:Button ID="btnCancel" runat="server" Text="取消" CssClass="blue_btn"  OnClick="btnCancel_Click"/>
                </td>
            </tr>
        </table>

        <!-- 页面正文 结束 -->

        <!-- 每组可以自定义的部分 结束 -->

        <!-- 页面版权申明 开始 -->
        <table width="700" height="2" border="0" cellpadding="0" cellspacing="0" bgcolor="#E0E0E0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="700" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="700" height="4" border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCBC" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="700" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="700" height="6" border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <!-- 页面版权结束 结束 -->
    </form>
</body>
</html>
