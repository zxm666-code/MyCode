<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Post_duty.aspx.cs" Inherits="ESM��ҵн�����ϵͳ.Post_duty" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>н�ʹ���ϵͳ - ��λ����</title>
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

        <!-- ҳ������ ��ʼ -->
        <table width="700" border="0" cellpadding="0" cellspacing="5" id="main_table">
          <tr>
            <td valign="top" align="left">
                <div id="sub_body">
                    <div id="this_page_title">
                        <div id="item_line">
                            <h1 id="sub_title">�鿴��λ����</h1>
                        </div>
                    </div>

                    <div id="edit" align="center">
                        <fieldset class="pmsform">
                            <legend class="pmsform">�鿴��λ����</legend>

                            <div id="sub_body">
                                <div id="view" align="left">
                                    <div id="item_line">
                                        <div id="item_line_A">��λ����</div>
                                        <div id="item_line_B">
                                            <asp:Label ID="lblPostName" runat="server" Text="����Ա"></asp:Label>
                                        </div>
                                    </div>

                                    <div id="item_line">
                                        <div id="item_line_A">��λ����</div>
                                        <div id="item_line_B">
                                            <asp:Label ID="lblPostDescription" runat="server" Text="����Ŀ���̵Ĵ�����б�д����ƣ���ģ����в��ԣ��Թ���ϸ�ڽ�������"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                        
                        <br clear="all" />
                        <asp:Button ID="btnClose" runat="server" Text="�ر�" CssClass="blue_btn" OnClientClick="closePage();return false;" />
                        <br clear="all" /><br clear="all" />
                    </div>
                </div>
            </td>
          </tr>
        </table>
        <!-- ҳ������ ���� -->

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