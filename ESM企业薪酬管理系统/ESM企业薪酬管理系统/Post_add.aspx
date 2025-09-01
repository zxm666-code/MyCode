<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Post_add.aspx.cs" Inherits="ESM企业薪酬管理系统.Post_add" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payroll Management System</title>
    <link href="css/cfi_global.css" rel="stylesheet" type="text/css" />
     
</head>
<body>
    <form id="form1" runat="server">
        <table width="700" height="8" border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" align="center">
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
        <table width="700" height="2" border="0" cellpadding="0" cellspacing="0" bgcolor="#E0E0E0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>

        <!-- Page Content Start -->
        <table width="700" border="0" cellpadding="0" cellspacing="5" id="main_table">
            <tr>
                <td valign="top" align="left">
                    <div id="sub_body">
                        <div id="this_page_title">
                            <div id="item_line">
                                <h1 id="sub_title">新建岗位</h1>
                            </div>
                        </div>

                        <div id="edit">
                            <fieldset class="pmsform">
                                <legend class="pmsform">新建岗位</legend>

                                <label class="pmsform">岗位ID<font color="red">*</font></label>
                                <asp:TextBox ID="txtPostId" runat="server" size="30" placeholder="请输入岗位ID"></asp:TextBox>


                                <label class="pmsform">岗位名称<font color="red">*</font></label>
                                <asp:TextBox ID="job_name" runat="server" size="80"></asp:TextBox>
                                
                                <label class="pmsform">所在部门<font color="red">*</font></label>
                                <asp:TextBox ID="department" runat="server" size="30"></asp:TextBox>
                                
                                <label class="pmsform" id="project_name_label">岗位描述</label>
                                <asp:TextBox ID="description" runat="server" TextMode="MultiLine" Columns="60" Rows="8"></asp:TextBox>
                                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

                                <asp:HiddenField ID="hfPostId" runat="server" />

                                <br clear="all" /><br clear="all" />
                                <asp:Button ID="btnCreate" runat="server" Text="新建岗位" CssClass="blue_btn" OnClick="btnCreate_Click" />
                                <asp:Button ID="btnReset" runat="server" Text="重新填写" CssClass="blue_btn" CausesValidation="false" OnClick="btnReset_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="取消" CssClass="blue_btn" OnClick="btnCancel_Click" />
                            </fieldset>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <!-- Page Content End -->

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
