<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee_update.aspx.cs" Inherits="ESM��ҵн�����ϵͳ.Employee_update" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>н�ʹ���ϵͳ - ����Ա����Ϣ</title>
    <link href="css/cfi_global.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- ����װ���� -->
        <table width="700" height="8" border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" align="center">
            <tr><td></td></tr>
        </table>
        <table width="700" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr><td></td></tr>
        </table>
        <table width="700" height="4" border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCBC" align="center">
            <tr><td></td></tr>
        </table>
        <table width="700" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr><td></td></tr>
        </table>
        <table width="700" height="2" border="0" cellpadding="0" cellspacing="0" bgcolor="#E0E0E0" align="center">
            <tr><td></td></tr>
        </table>

        <!-- �������� -->
        <table width="700" border="0" cellpadding="0" cellspacing="5" id="main_table" align="center">
            <tr>
                <td valign="top" align="left">
                    <div id="sub_body">
                        <div id="this_page_title">
                            <div id="item_line">
                                <h1 id="sub_title">����Ա����Ϣ</h1>
                            </div>
                        </div>

                        <div id="edit">
                            <fieldset class="pmsform">
                                <legend class="pmsform">����Ա����Ϣ</legend>
                                
                                <label class="pmsform" id="empId_label">Ա����&nbsp;&nbsp;<font color="red">*</font></label>
                                <asp:TextBox ID="txtEmpId" runat="server" CssClass="input-field" Width="200px" Text="10000002" ReadOnly="true"></asp:TextBox>
                                
                                <label class="pmsform" id="name_label">����&nbsp;&nbsp;<font color="red">*</font></label>
                                <asp:TextBox ID="txtName" runat="server" CssClass="input-field" Width="200px" Text="��ǿ"></asp:TextBox>
                             
                                <label class="pmsform" id="birthday_label">��������&nbsp;&nbsp;<font color="red">*</font></label>
                                <asp:TextBox ID="txtBirthday" runat="server" CssClass="input-field" Width="200px" Text="1984-01-01"></asp:TextBox>

                                <label class="pmsform" id="idCard_label">���֤��&nbsp;&nbsp;<font color="red">*</font></label>
                                <asp:TextBox ID="txtIdCard" runat="server" CssClass="input-field" Width="200px" Text="110122198401010876"></asp:TextBox>
                                
                                <label class="pmsform" id="dept_label">����&nbsp;&nbsp;<font color="red">*</font></label>
                                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="input-field" Width="200px">
                                    <asp:ListItem Value="1">������</asp:ListItem>
                                    <asp:ListItem Value="2">������</asp:ListItem>
                                    <asp:ListItem Value="3">9527</asp:ListItem>
                                    <asp:ListItem Value="4">���ڲ�</asp:ListItem>
                                </asp:DropDownList>
                                
                                <label class="pmsform" id="position_label">��λ&nbsp;&nbsp;<font color="red">*</font></label>
                                <asp:DropDownList ID="ddlPosition" runat="server" CssClass="input-field" Width="200px">
                                    <asp:ListItem Value="1">��������</asp:ListItem>
                                    <asp:ListItem Value="2" Selected="True">���¾���</asp:ListItem>
                                    <asp:ListItem Value="3">9527</asp:ListItem>
                                    <asp:ListItem Value="4">����</asp:ListItem>
                                </asp:DropDownList>
                                
                                <label class="pmsform" id="level_label">����&nbsp;&nbsp;<font color="red">*</font></label>
                                <asp:DropDownList ID="ddlLevel" runat="server" CssClass="input-field" Width="200px">
                            
                                </asp:DropDownList>
                                
                                <label class="pmsform" id="email_label">�ʼ��˺�&nbsp;&nbsp;<font color="red">*</font></label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="input-field" Width="400px" Text="qiang.li@zpark.com"></asp:TextBox>    
                                
                                <label class="pmsform" id="phone1_label">��ϵ�绰1&nbsp;&nbsp;<font color="red">*</font></label>
                                <asp:TextBox ID="txtPhone1" runat="server" CssClass="input-field" Width="200px" Text="13456789011"></asp:TextBox>
                                
                                <label class="pmsform" id="phone2_label">��ϵ�绰2&nbsp;&nbsp;</label>
                                <asp:TextBox ID="txtPhone2" runat="server" CssClass="input-field" Width="200px" Text="010-12345678"></asp:TextBox>    
                                
                                <label class="pmsform" id="address_label">ͨ�ŵ�ַ&nbsp;&nbsp;</label>
                                <asp:TextBox ID="txtAddress" runat="server" CssClass="input-field" Width="400px" Text="�����к�����"></asp:TextBox>
                                
                                <br clear="all" /><br clear="all" />
                                
                                <asp:Button ID="btnUpdate" runat="server" Text="����Ա����Ϣ" CssClass="blue_btn" OnClick="btnUpdate_Click" />
                                <asp:Button ID="btnReset" runat="server" Text="������д" CssClass="blue_btn" CausesValidation="false" OnClick="btnReset_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="ȡ��" CssClass="blue_btn" CausesValidation="false" OnClick="btnCancel_Click" />
                            </fieldset>
                        </div>
                    </div>
                </td>
            </tr>
        </table>

        <!-- �ײ�װ���� -->
        <table width="700" height="2" border="0" cellpadding="0" cellspacing="0" bgcolor="#E0E0E0" align="center">
            <tr><td></td></tr>
        </table>
        <table width="700" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr><td></td></tr>
        </table>
        <table width="700" height="4" border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCBC" align="center">
            <tr><td></td></tr>
        </table>
        <table width="700" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr><td></td></tr>
        </table>
        <table width="700" height="6" border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" align="center">
            <tr><td></td></tr>
        </table>
    </form>
</body>
</html>
