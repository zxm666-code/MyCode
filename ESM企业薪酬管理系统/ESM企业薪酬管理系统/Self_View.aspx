<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Self_View.aspx.cs" Inherits="ESM企业薪酬管理系统.Self_View" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>薪酬管理系统</title>
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

        <!-- 页面logo及登录注册链接 开始 -->
        <table width="970" height="50" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td valign="bottom"><div align="left"><img src="image/cfi_logo.png" width="350" height="30" /></div></td>
                <td valign="bottom" class="account">
                    欢迎<asp:Label ID="lblUserName" runat="server" Text="XXX"></asp:Label>, 您已经以<asp:Label ID="lblRole" runat="server" Text="XXX"></asp:Label>身份登录．
<asp:LinkButton ID="lnkLogout" runat="server" CssClass="navigation_links" OnClick="lnkLogout_Click">安全注销</asp:LinkButton>
                </td>
                <td valign="bottom">　</td>
            </tr>
        </table>
        <!-- 页面logo及登录注册链接 结束 -->

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
            <tr><td></td></tr>
        </table>
        <table width="970" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr><td></td></tr>
        </table>
        <!-- 菜单导航 结束 -->

        <!-- 页面正文 开始 -->
        <div id="main_body">
            <div id="page_location"> 
                <asp:SiteMapPath ID="SiteMapPath1" runat="server">
        <PathSeparatorTemplate>&nbsp;&gt;&nbsp;</PathSeparatorTemplate>
        </asp:SiteMapPath></div>
            <table width="970" border="0" cellpadding="0" cellspacing="0" id="main_table">
                <tr>
                    <td width="240" valign="top">
                        <div id="sub_navigation">
                            <h2>薪酬计算</h2>
                            <p>提供薪酬计算功能</p>
                            <ul class="sub_navigation_links">
                                <li><asp:HyperLink NavigateUrl="Self_View.aspx" runat="server">本人工资单浏览</asp:HyperLink></li>
                                <li id="liinputdata" runat="server"><asp:HyperLink NavigateUrl="InputPay.aspx" runat="server" ID="h1inputdata">输入薪酬数据</asp:HyperLink></li>   
                            </ul>
                        </div>
                    </td>
                    <td width="1" bgcolor="#C2C2C2"></td>
                    <td valign="top">
                        <div id="sub_body">
                            <div id="this_page_title">
                                <div id="item_line">
                                    <h1 id="sub_title" style="text-align:center"><asp:Label ID="lblSalaryTitle" runat="server" Text="XXX薪酬项目列表"></asp:Label></h1>
                                </div>
                            </div>
                            <div id="project_list">
                                <asp:GridView ID="gvSalaryItems" runat="server" AutoGenerateColumns="false" 
                                    Width="100%" CellPadding="4" CellSpacing="0">
                                    <Columns>
                                        <asp:TemplateField HeaderText="薪酬项目" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblItemName" runat="server" Text='<%# Eval("salaryItem") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField HeaderText="累加/扣除" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblType" runat="server" Text='<%# Eval("isAdd") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField HeaderText="是否记税" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTaxable" runat="server" Text='<%# Eval("isTax") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField HeaderText="值" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblValue" runat="server" 
                                                Text='<%# FormatSalaryValue(Eval("salaryItem").ToString(), Eval("calculationFormula"), Eval("calculationCoefficient"), Eval("upperLimit")) %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                        
                                        <asp:TemplateField HeaderText="说明" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="lnkDetail" runat="server" Text="详细说明"  Visible='<%# !string.IsNullOrEmpty(Eval("explainPageUrl ")?.ToString()) %>'
 NavigateUrl='<%# "CheckPay_shuoming.aspx?item=" + Eval("salaryItem").ToString() %>'></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle CssClass="table_header_td" />
                                    <RowStyle CssClass="table_dashedline_td" />
                                    <AlternatingRowStyle CssClass="table_dashedline_td_bg_gray" />
                                </asp:GridView>
                            </div>
                        </div>
                    </td>
                     
    
                </tr>

            </table>
        </div>
        <div style="text-align: center; padding: 10px; font-weight: bold;">
                实发工资：<asp:Label ID="lblTotalSalary" runat="server" Text="0.00"></asp:Label> RMB
            </div>
        <!-- 页面正文 结束 -->

        <!-- 页面版权申明 开始 -->
        <table width="970" height="4" border="0" cellpadding="0" cellspacing="0" bgcolor="#E0E0E0" align="center">
            <tr><td></td></tr>
        </table>
        <table width="970" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr><td></td></tr>
        </table>
        <table width="970" height="6" border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCBC" align="center">
            <tr><td></td></tr>
        </table>
        <table width="970" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr><td></td></tr>
        </table>
        <table width="970" height="30" border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" align="center">
            <tr>
                <td>
                    <div id="legal">使用本网站即表示您接受我们的<asp:HyperLink NavigateUrl="#" runat="server">用户协议</asp:HyperLink>。
                    请阅读我们的<asp:HyperLink NavigateUrl="#" runat="server">隐私政策</asp:HyperLink></div>
                </td>
            </tr>
        </table>
        <table width="970" border="0" cellspacing="0" cellpadding="5" align="center">
            <tr>
                <td><p align="left">&copy; Copyright ZPark Corporation 1994-<%= DateTime.Now.Year %>. 版权所有。</p></td>
            </tr>
        </table>
        <!-- 页面版权结束 结束 -->
    </form>
</body>
</html>
