<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Post_duty.aspx.cs" Inherits="ESM企业薪酬管理系统.Post_duty" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>薪资管理系统 - 岗位描述</title>
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

        <!-- 页面正文 开始 -->
        <table width="700" border="0" cellpadding="0" cellspacing="5" id="main_table">
          <tr>
            <td valign="top" align="left">
                <div id="sub_body">
                    <div id="this_page_title">
                        <div id="item_line">
                            <h1 id="sub_title">查看岗位描述</h1>
                        </div>
                    </div>

                    <div id="edit" align="center">
                        <fieldset class="pmsform">
                            <legend class="pmsform">查看岗位描述</legend>

                            <div id="sub_body">
                                <div id="view" align="left">
                                    <div id="item_line">
                                        <div id="item_line_A">岗位名称</div>
                                        <div id="item_line_B">
                                            <asp:Label ID="lblPostName" runat="server" Text="程序员"></asp:Label>
                                        </div>
                                    </div>

                                    <div id="item_line">
                                        <div id="item_line_A">岗位描述</div>
                                        <div id="item_line_B">
                                            <asp:Label ID="lblPostDescription" runat="server" Text="对项目工程的代码进行编写，设计，对模块进行测试，对工程细节进行描述"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                        
                        <br clear="all" />
                        <asp:Button ID="btnClose" runat="server" Text="关闭" CssClass="blue_btn" OnClientClick="closePage();return false;" />
                        <br clear="all" /><br clear="all" />
                    </div>
                </div>
            </td>
          </tr>
        </table>
        <!-- 页面正文 结束 -->

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