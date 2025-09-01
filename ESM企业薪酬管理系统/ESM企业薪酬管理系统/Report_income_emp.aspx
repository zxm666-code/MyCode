<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report_income_emp.aspx.cs" Inherits="ESM企业薪酬管理系统.Report_income_emp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>薪酬管理系统 - 员工信息查询</title>
    <link href="css/cfi_global.css" rel="stylesheet" type="text/css" />
   
</head>
<body>
    <form id="form1" runat="server">
        <!-- 页面顶端 开始 -->
        <table width="970" border="0" cellpadding="3" cellspacing="0" class="top_heading" align="center">
            <tr>
                <td valign="bottom">ZPark CRL - Payroll Management System</td>
                <td>
                    <div align="right"><img src="image/ibm_logo.jpg" alt="IBM Logo" width="101" height="30" /></div>
                </td>
            </tr>
        </table>
        <!-- 页面顶端 结束 -->

        <!-- 页面logo 及登陆注册链接 开始 -->
        <table width="970" height="50" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td valign="bottom">
                    <div align="left"><img src="image/cfi_logo.png" width="350" height="30" /></div>
                </td>
                <td valign="bottom" class="account">
                    欢迎<asp:Label ID="lblUsername" runat="server" Text="XXX"></asp:Label>, 你已经以<asp:Label ID="lblRole" runat="server" Text="XXX"></asp:Label>身份登陆．
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
            <tbody>
                <tr>
                    <td>
                        <div id="menu_block" align="left">
                            <div align="left">
                                <asp:HyperLink ID="lnkOrg" runat="server" NavigateUrl="Post_query1.aspx" CssClass="navigation_toplevel">组织结构</asp:HyperLink>
                                <asp:HyperLink ID="lnkEmployee" runat="server" NavigateUrl="Employee_query.aspx" CssClass="navigation_toplevel">员工信息</asp:HyperLink>
                                <asp:HyperLink ID="lnkSalary" runat="server" NavigateUrl="GeRenJieGouChaXun.aspx" CssClass="navigation_toplevel">薪酬结构管理</asp:HyperLink>
                                <asp:HyperLink ID="lnkCalc" runat="server" NavigateUrl="Self_View.aspx" CssClass="navigation_toplevel">薪酬计算</asp:HyperLink>
                                <asp:HyperLink ID="lnkReport" runat="server" NavigateUrl="Report_income_outline.aspx" CssClass="navigation_toplevel">报表</asp:HyperLink>
                                <asp:HyperLink ID="lnkUser" runat="server" NavigateUrl="User_list.aspx" CssClass="navigation_toplevel">用户管理</asp:HyperLink>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
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
                        </div>
                    </td>
                    <td width="1" bgcolor="#C2C2C2"></td>
                    <td valign="top">
                        <div id="sub_body">
                            <div id="this_page_title">
                                <fieldset class="pmsform">
                                    <h1 id="sub_title">员工信息查询>></h1>

                                    <div>
                                        <label class="pmsform">员工号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:TextBox ID="txtEmployeeId" runat="server" size="50"></asp:TextBox>
                                        </label>
                                        
                                        <label class="pmsform">姓名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:TextBox ID="txtEmployeeName" runat="server" size="50"></asp:TextBox>
                                        </label>
                                        
                                        <label class="pmsform">部门&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:TextBox ID="txtDepartment" runat="server" size="50"></asp:TextBox>
                                        </label>

                                        <label class="pmsform">邮件帐号&nbsp;&nbsp;
                                            <asp:TextBox ID="txtEmail" runat="server" size="50"></asp:TextBox>
                                        </label>
                                        
                                        <br clear="all" />
                                        
                                        <div id="form_buttons">
                                            <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="blue_btn" OnClick="btnSearch_Click" />
                                            <asp:Button ID="btnReset" runat="server" Text="重置" CssClass="blue_btn" OnClick="btnReset_Click" />
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                            
                            <div id="function_button">
                                <div id="item_noline" class="blue_btn">
                                   
                                    <h1>员工信息列表</h1>
                                   
                                    
                                </div>

                            </div>
                            
                            <div id="user_list">
                                <asp:GridView ID="gvEmployees" runat="server" AutoGenerateColumns="False"
                                    Width="100%" BorderWidth="0" CellPadding="0" CellSpacing="0" PageSize="10" AllowPaging="True" DataKeyNames="empId"
                                    >
                                            <PagerTemplate>
                                                     <%-- 留空，彻底移除分页栏 --%>
                                         </PagerTemplate>
                                    <Columns>
                                       
                                        
                                        <asp:TemplateField HeaderText="员工号" HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td">
                                            <ItemTemplate>
                                                <a href="<%# "Employee_moreinfo.aspx?empId=" + Eval("empId").ToString() %>" ><%# Eval("empId") %></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:BoundField DataField="empName" HeaderText="姓名" HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td" />
                                        <asp:BoundField DataField="deptName" HeaderText="部门" HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td" />
                                        <asp:BoundField DataField="Mail" HeaderText="邮件账号" HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td" />
                                        <asp:BoundField DataField="Tel1" HeaderText="电话" HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td" />
                                        
                                        <asp:TemplateField HeaderText="薪酬结构" HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td" ItemStyle-Width="60">
                                            <ItemTemplate>
                                                <a href="<%# "Report_income_detail.aspx?empId=" + Eval("empId").ToString() %>" ><img src="image/icon_view.png" border="0" alt="查看" /></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <AlternatingRowStyle CssClass="table_dashedline_td_bg_gray" />
                                </asp:GridView>
                                
                                <table width="100%" border="0" cellspacing="0" cellpadding="5">
                                    <tr>
                                        <td class="page_navigation_1_2_3">
                                            <div align="right">
                                                <asp:LinkButton ID="lnkFirst" runat="server" OnClick="lnkFirst_Click">始页</asp:LinkButton>
                                                &nbsp;|&nbsp;
                                                <asp:LinkButton ID="lnkPrev" runat="server" OnClick="lnkPrev_Click">前一页</asp:LinkButton>
                                                &nbsp;|&nbsp;
                                                <asp:LinkButton ID="lnkNext" runat="server" OnClick="lnkNext_Click">后一页</asp:LinkButton>
                                                &nbsp;|&nbsp;
                                                <asp:LinkButton ID="lnkLast" runat="server" OnClick="lnkLast_Click">尾页</asp:LinkButton>
                                            </div>
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
                <td>
                    <div id="legal">
                        Use of, registration on, this site constitutes acceptance of our 
                        <asp:HyperLink ID="lnkAgreement" runat="server" NavigateUrl="#">User Agreement</asp:HyperLink>. 
                        Please read our <asp:HyperLink ID="lnkPrivacy" runat="server" NavigateUrl="#">Privacy Policy</asp:HyperLink>
                    </div>
                </td>
            </tr>
        </table>
        <table width="970" border="0" cellspacing="0" cellpadding="5" align="center">
            <tr>
                <td>
                    <p align="left">&copy; Copyright ZPark Corporation 1994, <asp:Label ID="lblCurrentYear" runat="server"></asp:Label>. All rights reserved.</p>
                </td>
            </tr>
        </table>
        <!-- 页面版权结束 结束 -->
    </form>
</body>
</html>

