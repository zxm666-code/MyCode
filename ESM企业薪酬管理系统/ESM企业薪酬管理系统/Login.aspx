<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ESM企业薪酬管理系统.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Payroll Management System</title>
    <link href="css/cfi_global.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="css/login.css" />
    <script type="text/javascript">
        var dateTimeString;
        function showDateTime() {
            dateTimeString = new Date().toLocaleString();
            document.getElementById("datetime").innerHTML = dateTimeString;
            setTimeout("showDateTime()", 1000)
        }
    </script>
</head>
<body onload="showDateTime()">
    <form id="form1" runat="server">
        <!-- 页面顶端 开始 -->
        <table width="970" border="0" cellpadding="3" cellspacing="0" align="center">
            <tr height="40">
                <td></td>
            </tr>
        </table>
        <!-- 页面顶端 结束 -->

        <!-- 页面logo 及登陆注册链接 开始 -->
        <table width="970" height="50" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td valign="bottom">
                    <div align="left"><img src="image/cfi_logo.png" width="350" height="30" /></div>
                </td>
                <td valign="bottom">
                    <div align="right"><img src="image/ibm_logo.jpg" alt="IBM Logo" width="101" height="30" /></div>
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
                                <a class="navigation_toplevel" href="#">欢迎使用薪酬管理系统</a>
                                <a class="navigation_toplevel" id="datetime" href="#">加载当前时间中...</a>
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
            <table width="970" border="0" cellpadding="0" cellspacing="0" id="main_table">
                <tr>
                    <td width="240" valign="top">
                        <!--子页面导航栏 开始 -->
                        <div id="related_info">
                            <strong>欢迎</strong>
                            <p>Payroll是一个薪酬管理平台，您可以在这里查看并管理自己的薪酬．</p>
                        </div>
                        <!--子页面导航栏 结束 -->
                    </td>
                    <td width="1" bgcolor="#C2C2C2"></td>
                    <td valign="top">
                        <!-- 子页面主体内容部分 开始 -->
                        <div id="sub_body">
                            <!-- 该页的标题 开始 -->
                            <div id="this_page_title">
                                <div id="item_line">
                                    <h1 id="sub_title">用户登录</h1>
                                </div>
                            </div>
                            <!-- 该页的标题 结束 -->

                            <div id="login_box">
                                <img src="image/login/login_icon.gif" alt="登录图标" />
                                
                                <div>
                                    
                                   <strong>用户名： </strong>
                                        <asp:TextBox ID="txtUsername" runat="server" CssClass="login_box_input"></asp:TextBox>
                                  
                                    <br /><br />
                                    
                                 <strong>&nbsp;&nbsp;&nbsp;密码： </strong>&nbsp;
                                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="login_box_input"></asp:TextBox>
                                  
                                    <br /><br />
                                    
                                   <strong>&nbsp;&nbsp;&nbsp;角色： </strong>&nbsp;
                                        <asp:DropDownList ID="ddlRole" runat="server">
                                            <asp:ListItem Value="1">普通用户</asp:ListItem>
                                            <asp:ListItem Value="2">薪酬管理员</asp:ListItem>
                                            <asp:ListItem Value="3">超级用户</asp:ListItem>
                                        </asp:DropDownList>
                                  
                                    <br /><br />
                                    
                                    <label for="btnLogin">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:ImageButton ID="btnLogin" runat="server" 
                                            ImageUrl="image/login/login_button.gif" 
                                            AlternateText="登录" 
                                            OnClick="btnLogin_Click" />
                                    </label>
                                    <br /><br />
                                    
                                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <!-- 子页面主体内容部分结束 -->
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