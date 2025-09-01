<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XinChouJieGou.aspx.cs" Inherits="ESM企业薪酬管理系统.XinChouJieGou" %>

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
                                <fieldset class="pmsform">
                                    <h1 id="sub_title">员工信息查询>></h1>
                                    
                                    <div>
                                        <label class="pmsform">员工号 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:TextBox ID="txtEmployeeId" runat="server" size="50"></asp:TextBox>
                                        </label>
                                        
                                        <label class="pmsform">姓名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:TextBox ID="txtName" runat="server" size="50"></asp:TextBox>
                                        </label>
                                        
                                        <label class="pmsform">部门&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:TextBox ID="txtDepartment" runat="server" size="50"></asp:TextBox>
                                        </label>
                                        
                                        <label class="pmsform">邮件帐号&nbsp;&nbsp;
                                            <asp:TextBox ID="txtEmail" runat="server" size="50"></asp:TextBox>
                                        </label>
                                        
                                        <br clear="all" />
                                        <div id="form_buttons">
                                            <asp:Button ID="btnSearch" runat="server" Text="提交" CssClass="blue_btn" OnClick="btnSearch_Click" />
                                            <asp:Button ID="btnReset" runat="server" Text="重置" CssClass="blue_btn" OnClick="btnReset_Click" />
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                            
                            <div id="E_List">
                                <h1 id="sub_title">员工信息列表</h1>
                            </div>
                            
                            <!-- 员工列表表格 -->
                            <div id="user_list">
                                <asp:GridView ID="gvEmployees" runat="server" Width="100%" AutoGenerateColumns="False"
                                    CellPadding="0" CellSpacing="0" PageSize="10" AllowPaging="True" DataKeyNames="empId">
                                       <PagerTemplate>
                                                    <%-- 留空，彻底移除分页栏 --%>
                                        </PagerTemplate>
                                    <Columns>
                                        <asp:BoundField DataField="empId" HeaderText="员工号" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" />
                                        <asp:BoundField DataField="empName" HeaderText="姓名" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"/>
                                        <asp:BoundField DataField="deptName" HeaderText="部门" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"/>
                                        <asp:BoundField DataField="postName" HeaderText="岗位" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"/>
                                        <asp:BoundField DataField="level" HeaderText="级别" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"/>
                                        <asp:BoundField DataField="Mail" HeaderText="邮件" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"/>
                                        <asp:BoundField DataField="Tel1" HeaderText="电话" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"/>
                                        <asp:TemplateField HeaderText="薪酬结构" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                                            <ItemTemplate>
                                                <a href="<%# "XinChouJieGou_sub1.aspx?empId=" + Eval("empId").ToString() %>"><img src="image/icon_configure.png" border="0" /></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle CssClass="table_header_td" />
                                    <RowStyle CssClass="table_dashedline_td" />
                                    <AlternatingRowStyle CssClass="table_dashedline_td_bg_gray" />
                                </asp:GridView>
                            </div>
                            
                            <!-- 分页控件 -->
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
