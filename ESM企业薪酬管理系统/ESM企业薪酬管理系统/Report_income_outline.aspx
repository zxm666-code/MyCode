<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report_income_outline.aspx.cs" Inherits="ESM企业薪酬管理系统.Report_income_outline" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Payroll Management System</title>
    <link href="css/cfi_global.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- 页面顶端 开始 -->
        <table width="970" border="0" cellpadding="3" cellspacing="0" class="top_heading" align="center">
          <tr>
            <td valign="bottom">ZPark CRL - 薪酬管理系统</td>
            <td><div align="right"><img src="image/ibm_logo.jpg" alt="IBM Logo" width="101" height="30" /></div></td>
          </tr>
        </table>
        <!-- 页面顶端 结束 -->

        <!-- 页面logo 及登陆注册链接 开始 -->
        <table width="970" height="50" border="0" cellpadding="0" cellspacing="0" align="center">
          <tr>
            <td valign="bottom"><div align="left"><img src="image/cfi_logo.png" width="350" height="30" /></div></td>
            <td valign="bottom" class="account">
            欢迎<asp:Label ID="lblUserName" runat="server" Text="XXX"></asp:Label>, 您已经以<asp:Label ID="lblRole" runat="server" Text="XXX"></asp:Label>身份登录．
<asp:LinkButton ID="lnkLogout" runat="server" CssClass="navigation_links" OnClick="lnkLogout_Click">安全注销</asp:LinkButton>
            </td>
            <td valign="bottom">&nbsp;</td>
          </tr>
        </table>
        <!-- 页面logo 及登陆注册链接 结束 -->

        <!-- 间隔 -->
        <table width="970" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table>
        <!-- 间隔 -->

        <!-- 菜单导航 开始 -->
        <table width="970" height="32" background="image/navigation_bg.gif" id="navigation" align="center">
            <tr>
                <td>
                    <div id="menu_block" align="left">
                        <div align="left">
                            <asp:HyperLink ID="hlOrgStructure" runat="server" CssClass="navigation_toplevel" NavigateUrl="Post_query1.aspx">组织结构</asp:HyperLink>
                             <asp:HyperLink ID="hlEmployeeInfo" runat="server" CssClass="navigation_toplevel" NavigateUrl="Employee_query.aspx">员工信息</asp:HyperLink>
                             <asp:HyperLink ID="hlSalaryStructure" runat="server" CssClass="navigation_toplevel" NavigateUrl="GeRenJieGouChaXun.aspx">薪酬结构管理</asp:HyperLink>
                             <asp:HyperLink ID="hlSalaryCalc" runat="server" CssClass="navigation_toplevel" NavigateUrl="Self_View.aspx">薪酬计算</asp:HyperLink>
                             <asp:HyperLink ID="hlReports" runat="server" CssClass="navigation_toplevel" NavigateUrl="Report_income_outline.aspx">报表</asp:HyperLink>
                             <asp:HyperLink ID="hlUserManagement" runat="server" CssClass="navigation_toplevel" NavigateUrl="User_list.aspx">用户管理</asp:HyperLink>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <table width="970" height="4" border="0" cellpadding="0" cellspacing="0" bgcolor="#CDCDCD" align="center">
          <tr>
            <td></td>
          </tr>
        </table>
        <table width="970" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
          <tr>
            <td></td>
          </tr>
        </table>
        <!-- 菜单导航 结束 -->

        <!-- 搜索和快捷功能栏 开始 -->
        <table width="970" height="1" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
            <td></td>
          </tr>
        </table>
        <!-- 搜索和快捷功能栏 结束 -->

        <!-- 页面正文 开始 -->
        <div id="main_body">
            <div id="page_location">
                <asp:SiteMapPath ID="SiteMapPath1" runat="server">
                    <PathSeparatorTemplate>&nbsp;&gt;&nbsp;</PathSeparatorTemplate>
                </asp:SiteMapPath>
            </div>
            <table width="970" border="0" cellpadding="0" cellspacing="0" id="main_table">
              <tr>
                <td width="240" valign="top">
                    <div id="sub_navigation">
                        <h2>报表</h2>
                        <p>提供查询薪酬报表</p>
                        <ul class="sub_navigation_links">
                            <li><asp:HyperLink ID="hlIncomeOutline" runat="server" NavigateUrl="report_income_outline.aspx">个人年度收入细目</asp:HyperLink></li>
                            <li id="liIncomeEmp" runat="server"><asp:HyperLink ID="hlIncomeEmp" runat="server" NavigateUrl="report_income_emp.aspx">员工年度收入细目</asp:HyperLink></li>
                        </ul>
                    </div>
                </td>
                <td width="1" bgcolor="#C2C2C2"></td>
                <td valign="top">
                    <div id="sub_body">
                        <div id="this_page_title">
                            <div id="item_line">
                                <h1 id="sub_title">个人年度收入细目</h1>
                            </div>
                        </div>
                        <div id="search">
                            <fieldset class="pmsform">
                                <legend class="pmsform">选择查看年份</legend>
                                <br />
                                <label class="pmsform" id="project_name_label">
                                    年份：&nbsp;&nbsp;
                                    <asp:DropDownList ID="ddlYear" runat="server">
                                        <asp:ListItem Value="2007">2007年</asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btnView" runat="server" Text="查看该年年度收入细节" 
                                        CssClass="blue_btn" OnClick="btnView_Click" />
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
 </div>
                                                <div>
     &nbsp;&nbsp;&nbsp;&nbsp;
</div>
                                                <div>
     &nbsp;&nbsp;&nbsp;&nbsp;
</div>
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
            </table>
        </div>
        <!-- 页面正文 结束 -->

        <!-- 页面版权申明 开始 -->
        <table width="970" height="4" border="0" cellpadding="0" cellspacing="0" bgcolor="#E0E0E0" align="center">
          <tr>
            <td></td>
          </tr>
        </table>
        <table width="970" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
          <tr>
            <td></td>
          </tr>
        </table>
        <table width="970" height="6" border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCBC" align="center">
          <tr>
            <td></td>
          </tr>
        </table>
        <table width="970" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
          <tr>
            <td></td>
          </tr>
        </table>
        <table width="970" height="30" border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" align="center">
          <tr>
            <td><div id="legal">Use of, registration on, this site constitutes acceptance of our <asp:HyperLink ID="hlUserAgreement" runat="server" NavigateUrl="#">User Agreement</asp:HyperLink>. Please read our <asp:HyperLink ID="hlPrivacyPolicy" runat="server" NavigateUrl="#">Privacy Policy</asp:HyperLink></div></td>
          </tr>
        </table>
        <table width="970" border="0" cellspacing="0" cellpadding="5" align="center">
          <tr>
            <td><p align="left">&copy; Copyright ZPark Corporation 1994-<%= DateTime.Now.Year %>. All rights reserved.</p></td>
          </tr>
        </table>
        <!-- 页面版权结束 结束 -->
    </form>
</body>
</html>
