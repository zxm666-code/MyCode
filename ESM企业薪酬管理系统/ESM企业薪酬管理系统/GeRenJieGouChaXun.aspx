<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GeRenJieGouChaXun.aspx.cs" Inherits="ESM企业薪酬管理系统.GeRenJieGouChaXun" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>薪酬管理系统</title>
    <link href="css/cfi_global.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
        function showOpen() {
            window.showModelessDialog("JiSuanRule.html", "", "status:off;dialogWidth:550px;dialogHeight:370px;");
        }
    </script>
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

        <!-- 页面logo及登录注册链接 开始 -->
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
        <!-- 页面logo及登录注册链接 结束 -->

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
                            <h2>薪酬结构管理</h2>
                            <p>提供薪酬结构维护功能</p>
                            <ul class="sub_navigation_links">
                                <li><asp:HyperLink ID="hlPersonalSalary" runat="server" NavigateUrl="GeRenJieGouChaXun.aspx">本人薪酬结构浏览</asp:HyperLink></li>
                                <li id="liTemplate" runat="server"><asp:HyperLink ID="hlTemplate" runat="server" NavigateUrl="XinChouTemplateList.aspx">配置薪酬模版</asp:HyperLink></li>
                                <li id="liSalaryMaintain" runat="server"><asp:HyperLink ID="hlSalaryMaintain" runat="server" NavigateUrl="XinChouJieGou.aspx">员工薪酬结构维护</asp:HyperLink></li>
                            </ul>
                        </div>
                    </td>
                    <td width="1" bgcolor="#C2C2C2"></td>
                    <td valign="top">
                        <div id="sub_body">
                            <div id="this_page_title">
                                <div id="item_line">
                                    <h1 id="sub_title">
                                        <asp:Label ID="lblEmployeeName" runat="server" Text="XXX"></asp:Label>&nbsp;&nbsp;薪酬项目列表
                                    </h1>
                                </div>
                            </div>
                            
                            <div id="project_list">
                                <asp:GridView ID="gvSalaryItems" runat="server" AutoGenerateColumns="False" 
                                    Width="100%" BorderWidth="0" CellPadding="0" CellSpacing="0">
                                    <Columns>
                                        <asp:BoundField DataField="salaryItem" HeaderText="薪酬项目" 
                                        ItemStyle-CssClass="table_header_td" />
                                    <asp:BoundField DataField="OperationType" HeaderText="累加/扣除" 
                                        ItemStyle-CssClass="table_header_td" />
                                    <asp:BoundField DataField="IsTaxable" HeaderText="是否记税" 
                                        ItemStyle-CssClass="table_header_td" />
                                    <asp:TemplateField HeaderText="如何计算" ItemStyle-CssClass="table_header_td">
                                       <ItemTemplate>
                                            <asp:Label ID="lblCalculation" runat="server" Text='<%# Eval("calculationFormula") %>' />
                                            <asp:HyperLink ID="hlViewFormula" runat="server" 
                                                Visible='<%# !string.IsNullOrEmpty(Eval("formulaPageUrl")?.ToString()) %>'
                                                NavigateUrl='<%# "JiSuanRule.aspx?item=" + Eval("salaryItem").ToString() %>'>
                                                查看公式
                                            </asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    </Columns>
                                    <AlternatingRowStyle CssClass="table_dashedline_td_bg_gray" />
                                    <RowStyle CssClass="table_dashedline_td" />
                                    <HeaderStyle CssClass="table_header_td" />
                                </asp:GridView>
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
                        使用或注册本网站即表示接受我们的<asp:HyperLink ID="hlAgreement" runat="server" NavigateUrl="#">用户协议</asp:HyperLink>。
                        请阅读我们的<asp:HyperLink ID="hlPrivacy" runat="server" NavigateUrl="#">隐私政策</asp:HyperLink>
                    </div>
                </td>
            </tr>
        </table>
        <table width="970" border="0" cellspacing="0" cellpadding="5" align="center">
            <tr>
                <td><p align="left">&copy; 版权所有 ZPark Corporation 1994-2007。保留所有权利。</p></td>
            </tr>
        </table>
        <!-- 页面版权结束 结束 -->
    </form>
</body>
</html>
