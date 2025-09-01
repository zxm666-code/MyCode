<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XinChouTemplateList.aspx.cs" Inherits="ESM企业薪酬管理系统.XinChouTemplateList" %>
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
                <td>
                    <div align="right"><img src="image/ibm_logo.jpg" alt="IBM Logo" width="101" height="30" /></div>
                </td>
            </tr>
        </table>
        <!-- 页面顶端 结束 -->

        <!-- 页面logo 及登陆信息 开始 -->
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
        <!-- 页面logo 及登陆信息 结束 -->

        <!-- 主菜单导航 开始 -->
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
        <!-- 主菜单导航 结束 -->

        <!-- 页面正文 开始 -->
        <div id="main_body">
            <div id="page_location">
                <asp:SiteMapPath ID="SiteMapPath1" runat="server">
                    <PathSeparatorTemplate>&nbsp;&gt;&nbsp;</PathSeparatorTemplate>
                </asp:SiteMapPath>
            </div>

            <!-- 提示信息显示区域 -->
            <div id="messageDiv" style="display: none; text-align: center; padding: 10px;"></div>

            <table width="970" border="0" cellpadding="0" cellspacing="0" id="main_table">
                <tr>
                    <!-- 左侧子菜单 -->
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

                    <!-- 主内容区 -->
                    <td valign="top">
                        <div id="sub_body">
                            <div id="this_page_title">
                                <div id="item_line">
                                    <h1 id="sub_title">薪酬项目列表</h1>
                                </div>
                            </div>

                            <!-- 薪酬项目表格 -->
                            <div id="project_list">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" CellPadding="0" CellSpacing="0">
                                    <Columns>
                                        <asp:BoundField DataField="salaryItem" HeaderText="工资项目" HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td" />
                                        <asp:BoundField DataField="isAdd" HeaderText="累加/扣除" HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td" />
                                        <asp:BoundField DataField="isTax" HeaderText="是否记税" HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td" />
                                         <asp:TemplateField HeaderText="如何计算"  HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td">
                                             <ItemTemplate>
                                                   <asp:Label ID="lblCalculation" runat="server" Text='<%# Eval("calculationFormula") %>' />
                                                  <asp:HyperLink ID="hlViewFormula" runat="server" 
                                                      Visible='<%# !string.IsNullOrEmpty(Eval("formulaPageUrl")?.ToString()) %>'
                                                      NavigateUrl='<%# "JiSuanRule.aspx?item=" + Eval("salaryItem").ToString() %>'>
                                                      设置公式
                                                  </asp:HyperLink>
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                        <%--<asp:BoundField DataField="calculationFormula" HeaderText="如何计算" />--%>
                                        <asp:BoundField DataField="isRequired" HeaderText="是否必选" HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td" />
                                    </Columns>
                                    <AlternatingRowStyle CssClass="table_dashedline_td_bg_gray" />
                                </asp:GridView>
                            </div>

                             <!-- 查询表单 -->
                             <div id="queryForm">
                                 <h2>查询员工薪酬项目</h2>
                                 <table>
                                     <tr>
                                         <td>员工ID：</td>
                                         <td><asp:TextBox ID="txtQueryEmpId" runat="server"></asp:TextBox></td>
                                         <td><asp:Button ID="btnQuery" runat="server" Text="查询" OnClick="btnQuery_Click"></asp:Button></td>
                                     </tr>
                                 </table>
                             </div>

                            <!-- 添加工资项目表单 -->
                            <div id="addSalaryItemForm">
                                <h2>添加工资项目</h2>
                                <table>
                                    <tr>
                                        <td>员工ID：</td>
                                        <td><asp:TextBox ID="txtEmpId" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>工资项目：</td>
                                        <td><asp:TextBox ID="txtSalaryItem" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>累加/扣除：</td>
                                        <td>
                                            <asp:DropDownList ID="ddlType" runat="server">
                                                <asp:ListItem Value="1">累加</asp:ListItem>
                                                <asp:ListItem Value="0">扣除</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>是否记税：</td>
                                        <td>
                                            <asp:DropDownList ID="ddlIsTaxable" runat="server">
                                                <asp:ListItem Value="1">是</asp:ListItem>
                                                <asp:ListItem Value="0">否</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>如何计算：</td>
                                        <td><asp:TextBox ID="txtCalculationMethod" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>是否必选：</td>
                                        <td>
                                            <asp:DropDownList ID="ddlIsRequired" runat="server">
                                                <asp:ListItem Value="1">是</asp:ListItem>
                                                <asp:ListItem Value="0">否</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center"><asp:Button ID="btnAdd" runat="server" Text="添加" OnClick="btnAdd_Click" /></td>
                                    </tr>
                                </table>
                            </div>
                           
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <!-- 页面正文 结束 -->

        <!-- 页面版权信息 -->
        <table width="970" height="30" border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" align="center">
            <tr>
                <td>
                    <div id="legal">
                        &copy; Copyright ZPark Corporation 1994-<%= DateTime.Now.Year %>. 版权所有。
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>