<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_role_selectrole.aspx.cs" Inherits="ESM企业薪酬管理系统.User_role_selectrole" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Payroll Management System - 用户角色修改</title>
    <link href="css/cfi_global.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <table width="700" height="8" border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" align="center">
            <tr>
                <td></td>
            </tr>
        </table>

        <!-- 页面正文 开始 -->
        <table width="700" border="0" cellpadding="0" cellspacing="5" id="main_table">
            <tr>
                <td valign="top" align="left">
                    <div id="sub_body">
                        <div id="this_page_title">
                            <div id="item_line">
                                <h1 id="sub_title">准备修改的用户列表</h1>
                            </div>
                        </div>
                        <div id="user_list">
                            <asp:GridView ID="gvUsers" runat="server" Width="100%" AutoGenerateColumns="False"
                                CellPadding="0" CellSpacing="0">
                                <Columns>
                                    <asp:BoundField DataField="empId" HeaderText="员工号" HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td" />
                                    <asp:BoundField DataField="empName" HeaderText="姓名" HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td" />
                                    <asp:BoundField DataField="deptName" HeaderText="部门" HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td" />
                                    <asp:BoundField DataField="Mail" HeaderText="电子邮件" HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td" />
                                    <asp:BoundField DataField="Tel1" HeaderText="电话" HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td" />
                                    <asp:BoundField DataField="Role" HeaderText="角色" HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td" />
                                </Columns>
                                <AlternatingRowStyle CssClass="table_dashedline_td_bg_gray" />
                            </asp:GridView>

                            <div id="edit">
                                <fieldset class="pmsform">
                                    <legend class="pmsform">选择角色</legend>
                                    <div>
                                        <asp:Label ID="lblSelectedUser" runat="server" CssClass="pmsform" Visible="false"></asp:Label>
                                        <br />
                                        
                                        <asp:RadioButtonList ID="rblRoles" runat="server" CssClass="pmsform">
                                            <asp:ListItem Value="1">&nbsp;普通用户</asp:ListItem>
                                            <asp:ListItem Value="2">&nbsp;薪酬管理专员</asp:ListItem>
                                            <asp:ListItem Value="3">&nbsp;超级用户</asp:ListItem>
                                        </asp:RadioButtonList>
                                        
                                        <br clear="all" /><br clear="all" />
                                        <asp:Button ID="btnModifyRole" runat="server" Text="修改用户角色" 
                                            CssClass="blue_btn" OnClick="btnModifyRole_Click" />
                                        <asp:Button ID="btnCancel" runat="server" Text="取消"
                                            CssClass="blue_btn" OnClick="btnCancel_Click" />
                                        
                                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <!-- 页面正文 结束 -->

        <!-- 底部版权信息 -->
        <table width="700" height="2" border="0" cellpadding="0" cellspacing="0" bgcolor="#E0E0E0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="700" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="700" height="4" border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCBC" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="700" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="700" height="6" border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
    </form>
</body>
</html>
