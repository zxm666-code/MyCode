<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Post_query1.aspx.cs" Inherits="ESM企业薪酬管理系统.Post_query1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>薪资管理系统</title>
    <link href="css/cfi_global.css" rel="stylesheet" type="text/css" />
 
</head>
<body>
    <form id="form1" runat="server">
        <!-- 页面顶端 开始 -->
        <table width="970" border="0" cellpadding="3" cellspacing="0" class="top_heading" align="center">
            <tr>
                <td valign="bottom">ZPark CRL - 薪资管理系统</td>
                <td>
                    <div align="right"><img src="image/ibm_logo.jpg" alt="IBM Logo" width="101" height="30" /></div>
                </td>
            </tr>
        </table>
        <!-- 页面顶端 结束 -->

        <!-- 页面logo及登录注册链接 开始 -->
        <table width="970" height="50" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td valign="bottom">
                    <div align="left"><img src="image/cfi_logo.png" width="350" height="30"  alt="1"/></div>
                </td>
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
                            <h2>组织结构</h2>
                            <p>提供岗位相关信息的查询和修改功能</p>
                           <ul class="sub_navigation_links">
                                <li id="liPostQuery" runat="server">
                                    <asp:HyperLink ID="hlPostQuery" runat="server" NavigateUrl="Post_query1.aspx">岗位信息查询</asp:HyperLink>
                                </li>
                                <li id="liPostMaintenance" runat="server">
                                    <asp:HyperLink ID="hlPostMaintenance" runat="server" NavigateUrl="Post_weihu.aspx">岗位列表维护</asp:HyperLink>
                                </li>
                            </ul>
                        </div>
                    </td>
                    <td width="1" bgcolor="#C2C2C2"></td>
                    <td valign="top">
                        <div id="sub_body">
                            <div id="this_page_title">
                                <fieldset class="pmsform">
                                    <h1 id="sub_title">岗位信息查询 &gt;&gt;</h1>
                                    
                                    <div>
                                        <label class="pmsform">岗位名称&nbsp;&nbsp;
                                            <asp:TextBox ID="txtJobName" runat="server" Width="300px"></asp:TextBox>
                                        </label>
                                        
                                        <br />
                                        
                                        <label class="pmsform">所在部门&nbsp;&nbsp;
                                            <asp:TextBox ID="txtDepartment" runat="server" Width="300px"></asp:TextBox>
                                        </label>
                                        
                                        <br clear="all" />
                                        
                                        <div id="form_buttons">
                                            <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="blue_btn" OnClick="BtnSearch_Click" />
                                            <asp:Button ID="btnReset" runat="server" Text="重置" CssClass="blue_btn" OnClick="BtnReset_Click" />
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                            
                            <div id="post_list">
                                <asp:GridView ID="gvPosts" runat="server" Width="100%" AutoGenerateColumns="False"
                                    CellPadding="0" CellSpacing="0" GridLines="None" PageSize="10" AllowPaging="True">
                                      <PagerTemplate>
                                           <%-- 留空，彻底移除分页栏 --%>
                                        </PagerTemplate>
                                    <Columns>
                                        <asp:TemplateField ItemStyle-CssClass="table_dashedline_td" ItemStyle-Width="50" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <img src="image/redarrow.gif"  alt="1"/>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:BoundField DataField="postName" HeaderText="岗位名称" 
                                            ItemStyle-CssClass="table_dashedline_td"  />     
                                            
                                        <asp:BoundField DataField="deptName" HeaderText="所在部门" 
                                            ItemStyle-CssClass="table_dashedline_td"  />
                                            
                                        <asp:TemplateField HeaderText="岗位描述" 
                                            ItemStyle-CssClass="table_dashedline_td" ItemStyle-Width="300" >
                                            <ItemTemplate>
                                                <a href="<%# "Post_duty.aspx?name=" + HttpUtility.UrlEncode(Eval("postName").ToString()) %>"><%# Eval("postDes") %></a>
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
                                            <asp:LinkButton ID="lnkFirst" runat="server" OnClick="LnkFirst_Click">首页</asp:LinkButton>
                                            &nbsp;|&nbsp;
                                            <asp:LinkButton ID="lnkPrev" runat="server" OnClick="LnkPrev_Click">前一页</asp:LinkButton>
                                            &nbsp;|&nbsp;
                                            <asp:LinkButton ID="lnkNext" runat="server" OnClick="LnkNext_Click">后一页</asp:LinkButton>
                                            &nbsp;|&nbsp;
                                            <asp:LinkButton ID="lnkLast" runat="server" OnClick="LnkLast_Click">尾页</asp:LinkButton>
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
                    <div id="legal">使用本网站即表示您接受我们的<asp:HyperLink ID="hlUserAgreement" runat="server" NavigateUrl="#">用户协议</asp:HyperLink>。请阅读我们的<asp:HyperLink ID="hlPrivacyPolicy" runat="server" NavigateUrl="#">隐私政策</asp:HyperLink></div>
                </td>
            </tr>
        </table>
        <table width="970" border="0" cellspacing="0" cellpadding="5" align="center">
            <tr>
                <td>
                    <p align="left">&copy; Copyright ZPark Corporation 1994-<%= DateTime.Now.Year %>. 保留所有权利。</p>
                </td>
            </tr>
        </table>
        <!-- 页面版权结束 结束 -->
    </form>
</body>
</html>    