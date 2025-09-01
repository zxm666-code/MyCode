<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Post_update.aspx.cs" Inherits="ESM企业薪酬管理系统.Post_update" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>薪酬管理系统-更新岗位信息</title>
    <link href="css/cfi_global.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- 顶部边框 -->
        <table width="700" height="8" border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" align="center">
            <tr>
                <td></td>
            </tr>
        </table>

        <!-- 中间分隔线 -->
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

        <!-- 页面正文内容 -->
        <table width="700" border="0" cellpadding="0" cellspacing="5" id="main_table">
            <tr>
                <td valign="top" align="left">
                    <div id="sub_body">
                        <div id="this_page_title">
                            <div id="item_line">
                                <h1 id="sub_title">更新岗位信息</h1>
                            </div>
                        </div>

                        <div id="edit">
                            <fieldset class="pmsform">
                                <legend class="pmsform">更新岗位信息</legend>
                                
                                <label class="pmsform">岗位名称<font color="red">*</font></label>
                                <asp:TextBox ID="txtJobName" runat="server" size="80" Text="行政主管"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvJobName" runat="server" 
                                    ControlToValidate="txtJobName" ErrorMessage="岗位名称不能为空"
                                    Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                
                                <label class="pmsform">所在部门</label>
                                <asp:TextBox ID="txtDepartment" runat="server" size="30"></asp:TextBox>
                                
                                <label class="pmsform" id="lblDescription">岗位描述</label>
                                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" 
                                    Columns="60" Rows="8" Text="制定公司行政制度......"></asp:TextBox>
                                
                                <br clear="all" /><br clear="all" />
                                <asp:Button ID="btnUpdate" runat="server" Text="更新岗位信息" 
                                    CssClass="blue_btn" OnClick="btnUpdate_Click" />
                                <asp:Button ID="btnReset" runat="server" Text="重新填写" 
                                    CssClass="blue_btn" CausesValidation="false" OnClick="btnReset_Click"  />
                                <asp:Button ID="btnCancel" runat="server" Text="取消" 
                                    CssClass="blue_btn" CausesValidation="false" OnClick="btnCancel_Click" />
                                
                                <asp:Label ID="lblMessage" runat="server" Visible="false" CssClass="message"></asp:Label>
                            </fieldset>
                        </div>
                    </div>
                </td>
            </tr>
        </table>

        <!-- 底部边框 -->
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
