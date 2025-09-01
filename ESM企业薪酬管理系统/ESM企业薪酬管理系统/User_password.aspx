<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_password.aspx.cs" Inherits="ESM企业薪酬管理系统.User_password" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payroll Management System - 修改密码</title>
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
                        <div id="edit">
                            <fieldset class="pmsform">
                                <legend class="pmsform">修改密码</legend>
                                <asp:Panel ID="pnlChangePassword" runat="server">
                                    <div>
                                        <label class="pmsform" id="lblUsername">用户名：&nbsp;&nbsp;
                                            <asp:TextBox ID="txtUsername" runat="server" size="20"></asp:TextBox>
                                        </label>
                                        
                                        <label class="pmsform" id="lblOldPassword">旧密码：&nbsp;&nbsp;<font color="red">*</font></label>
                                        <asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password" size="30"></asp:TextBox>
                                        
                                        <label class="pmsform" id="lblNewPassword">新密码：&nbsp;&nbsp;<font color="red">*</font></label>
                                        <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" size="30"></asp:TextBox>

                                        <label class="pmsform" id="lblConfirmPassword">确认密码：&nbsp;&nbsp;<font color="red">*</font></label>
                                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" size="30"></asp:TextBox>
                                        
                                        <br clear="all" /><br clear="all" />
                                        <asp:Button ID="btnChangePassword" runat="server" Text="修改密码" 
                                            CssClass="blue_btn" OnClick="btnChangePassword_Click" />
                                        <asp:Button ID="btnReset" runat="server" Text="重新填写" 
                                            CssClass="blue_btn" CausesValidation="false" OnClick="btnReset_Click" />
                                        
                                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                                    </div>
                                </asp:Panel>
                            </fieldset>
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
                    <div id="legal">Use of, registration on, this site constitutes acceptance of our <a href="#">User Agreement</a>. Please read our <a href="#">Privacy Policy</a> </div>
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