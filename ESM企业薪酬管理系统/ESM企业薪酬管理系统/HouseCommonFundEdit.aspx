<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HouseCommonFundEdit.aspx.cs" Inherits="ESM��ҵн�����ϵͳ.HouseCommonFundEdit" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>ס�����������</title>
    <link href="css/cfi_global.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <form id="form1" runat="server">
        <!-- ҳ��߿� ��ʼ -->
        <table width="500" height="8" border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <!-- ҳ��߿� ���� -->

        <!-- �������� ��ʼ -->
        <table width="500" border="0" cellpadding="0" cellspacing="5" id="main_table" align="center">
            <tr>
                <td valign="top" align="left">
                    <div id="sub_body">
                        <div id="this_page_title">
                            <div id="item_line">
                                <h1 id="sub_title">ס�����������</h1>
                            </div>
                        </div>

                        <div id="edit">
                            <fieldset class="pmsform">
                                <legend class="pmsform">ס�����������</legend>
                                
                                <div class="form-group">
                                    <asp:Label ID="lblFormula1" runat="server" CssClass="pmsform" Text="��� �������� <= ����һ����ɻ�������"></asp:Label>
                                </div>
                                
                                <div class="form-group">
                                    <asp:Label ID="lblFormula2" runat="server" CssClass="pmsform" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ס�������� = �������� * ϵ��"></asp:Label>
                                </div>
                                
                                <div class="form-group">
                                    <asp:Label ID="lblFormula3" runat="server" CssClass="pmsform" Text="����"></asp:Label>
                                </div>
                                
                                <div class="form-group">
                                    <asp:Label ID="lblFormula4" runat="server" CssClass="pmsform" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ס�������� = ����һ����ɻ������� * ϵ��"></asp:Label>
                                </div>
                                
                                <div>&nbsp;</div>
                                
                                <div align="center">
                                    <asp:Label ID="lblRate" runat="server" CssClass="pmsform" Text="ס��������ϵ����"></asp:Label>
                                    <asp:TextBox ID="txtRate" runat="server" Width="120px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvRate" runat="server" 
                                        ControlToValidate="txtRate"
                                        ErrorMessage="������ϵ��"
                                        Display="Dynamic"
                                        ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                 
                                </div>
                                
                                <div>&nbsp;</div>
                                
                                <div align="center">
                                    <asp:Button ID="btnSave" runat="server" Text="����" CssClass="blue_btn" OnClick="btnSave_Click" />
                                </div>
                            </fieldset>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <!-- �������� ���� -->

        <!-- ҳ��߿� ��ʼ -->
        <table width="500" height="6" border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <!-- ҳ��߿� ���� -->
    </form>
</body>
</html>
