<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_list.aspx.cs" Inherits="ESM企业薪酬管理系统.User_list" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payroll Management System</title>
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
                    <div align="left"><img src="image/cfi_logo.png" width="350" height="30" alt="1"/></div>
                </td>
                <td valign="bottom" class="account">
                    欢迎<asp:Label ID="lblUserName" runat="server" Text="XXX"></asp:Label>, 你已经以<asp:Label ID="lblRole" runat="server" Text="XXX"></asp:Label>身份登陆．
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

        <!-- 搜索和快捷功能栏 开始 -->
        <table width="970" height="1" border="0" cellspacing="0" cellpadding="0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <!-- 搜索和快捷功能栏 结束 -->

        <!-- 每组可以自定义的部分 开始 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 从这里开始一直到版权信息以上的内容 根据每组的需要进行修改 -->

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
                            <h2>用户管理</h2>
                            <p>管理员对用户的添加,删除,修改功能</p>
                            <ul class="sub_navigation_links">
                                <li><asp:HyperLink NavigateUrl="User_list.aspx" runat="server">新建员工用户</asp:HyperLink></li>
                                <li><asp:HyperLink NavigateUrl="User_password.aspx" runat="server">修改密码</asp:HyperLink></li>
                                <li><asp:HyperLink NavigateUrl="User_role_list.aspx" runat="server">用户角色维护</asp:HyperLink></li>
                            </ul>
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
                                            <asp:TextBox ID="txtJobName" runat="server" size="50"></asp:TextBox>
                                        </label>
                                        
                                        <label class="pmsform">姓名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:TextBox ID="txtUsername" runat="server" size="50"></asp:TextBox>
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
                            <div id="true_emp">
                                <div id="item_noline" class="blue_btn">
                                    <h1 id="H1">未创建系统用户的员工列表&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnCreateUser" runat="server" Text="创建用户" CssClass="blue_btn"  OnClick="btnCreateUser_Click" />
                                    </h1>
                                </div>
                            </div>
                            <div id="user_list">
                                <asp:GridView ID="gvEmployees" runat="server" Width="100%" AutoGenerateColumns="False"
                                    CellPadding="0" CellSpacing="0" PageSize="10" AllowPaging="True" DataKeyNames="empId">
                                        <PagerTemplate>
                                         <%-- 留空，彻底移除分页栏 --%>
                                      </PagerTemplate>
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="true" OnCheckedChanged="chkAll_CheckedChanged"/>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelect" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="员工号">
                                            <ItemTemplate>
                                                <a href="<%# "Employee_moreinfo.aspx?empId=" + Eval("empId").ToString() %>"><%# Eval("empId") %></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="empName" HeaderText="姓名" />
                                        <asp:BoundField DataField="deptName" HeaderText="部门" />
                                        <asp:BoundField DataField="Mail" HeaderText="电子邮件" />
                                        <asp:BoundField DataField="Tel1" HeaderText="电话" />
                                        <asp:TemplateField HeaderText="更多信息">
                                            <ItemTemplate>
                                                <a href="<%# "Employee_moreinfo.aspx?empId=" + Eval("empId").ToString() %>"><img src="image/icon_view.png" border="0" alt="1"/></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle CssClass="table_header_td" />
                                    <RowStyle CssClass="table_dashedline_td" />
                                    <AlternatingRowStyle CssClass="table_dashedline_td_bg_gray" />
                                </asp:GridView>
                            </div>
                            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                                <tr>
                                    <td class="page_navigation_1_2_3">
                                        <div align="right">
                                          <asp:LinkButton ID="lnkFirst" runat="server" OnClick="lnkFirst_Click">首页</asp:LinkButton>
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
                    </td>
                </tr>
            </table>
        </div>
        <!-- 页面正文 结束 -->

        <!-- 每组可以自定义的部分 结束 -->

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
                    <div id="legal">Use of, registration on, this site constitutes   acceptance of our <a href="#">User   Agreement</a>. Please read our <a href="#">Privacy Policy</a> </div>
                </td>
            </tr>
        </table>
        <table width="970" border="0" cellspacing="0" cellpadding="5" align="center">
            <tr>
                <td>
                    <p align="left">&copy; Copyright ZPark Corporation 1994, 2007. All rights reserved.</p>
                </td>
            </tr>
        </table>
        <!-- 页面版权结束 结束 -->
    </form>
</body>
</html>
