<%@ Page Language="C#" AutoEventWireup="true" 
CodeFile="CheckPay_shuoming.aspx.cs" 
Inherits="ESM企业薪酬管理系统.CheckPay_shuoming" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>工资管理系统 - 详细说明</title>
    <link href="css/cfi_global.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function closePage() {
            window.history.back();
            return false;
        }
    </script>
</head>

<body>
    <form id="form1" runat="server">
        <table width="500" height="8" border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" align="center">
            <tr>
                <td></td>
            </tr>
        </table>

        <table width="500" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="500" height="4" border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCBC" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="500" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="500" height="2" border="0" cellpadding="0" cellspacing="0" bgcolor="#E0E0E0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>

        <!-- 页面正文开始 -->
        <table width="500" border="0" cellpadding="0" cellspacing="5" id="main_table">
            <tr>
                <td valign="top" align="left">
                    <div id="sub_body">
                        <div id="this_page_title">
                            <div id="item_line">
                                <h1 id="sub_title">详细说明</h1>
                            </div>
                        </div>

                        <div id="edit">
                            <fieldset class="pmsform">
                                <legend class="pmsform">详细说明</legend>
                                <label class="pmsform" id="project_name_label">关于此项工资的详细说明....</label>
                            </fieldset>
                            <div>&nbsp;</div>
                            <div align="center">
                                <asp:Button ID="btnClose" runat="server" Text="关闭" CssClass="blue_btn" OnClientClick="closePage();return false;" />
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <!-- 页面正文结束 -->

        <table width="500" height="2" border="0" cellpadding="0" cellspacing="0" bgcolor="#E0E0E0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="500" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="500" height="4" border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCBC" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="500" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="500" height="6" border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
    </form>
</body>
</html>