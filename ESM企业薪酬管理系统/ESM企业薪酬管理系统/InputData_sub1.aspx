<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InputData_sub1.aspx.cs" Inherits="ESM��ҵн�����ϵͳ.InputData_sub1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>н�����ϵͳ</title>
    <link href="css/cfi_global.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <table width="700" height="8" border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" align="center">
            <tr>
                <td></td>
            </tr>
        </table>

        <!-- ҳ������ ��ʼ -->
        <table width="700" border="0" cellpadding="0" cellspacing="5" id="main_table" style="text-align:center">
            <tr>
                <td valign="top" align="left">
                    <div id="sub_body">
                        <div id="this_page_title">
                            <div id="item_line">
                                <h1 id="sub_title"><asp:Label ID="lblEmployeeName" runat="server" Text="XXX" ></asp:Label> н����Ŀ�б�</h1>
                            </div>
                        </div>
                        
                        <div id="project_list">
                            <asp:GridView ID="gvSalaryItems" runat="server" Width="100%" AutoGenerateColumns="False" 
                                    DataKeyNames="templateId">
                                    <Columns>
                                        <asp:TemplateField HeaderText="н����Ŀ">
                                            <ItemTemplate>
                                                <asp:Label ID="lblItemName" runat="server" Text='<%# Eval("salaryItem") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="����">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAddOrDeduct" runat="server" 
                                                    Text='<%# Convert.ToInt32(Eval("isAdd")) == 1 ? "�ۼ�" : "�۳�" %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="�Ƿ��˰">
                                            <ItemTemplate>
                                                <asp:Label ID="lblIsTaxable" runat="server" 
                                                    Text='<%# Convert.ToInt32(Eval("isTax")) == 1 ? "��" : "��" %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                       <asp:TemplateField HeaderText="ֵ">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFixedValue" runat="server" 
                                                    Text='<%# Eval("calculationFormula") %>' 
                                                    Visible='<%# !IsEditableItem(Eval("salaryItem").ToString()) %>'></asp:Label>
             
                                                <asp:TextBox ID="txtInputValue" runat="server" 
                                                    Text='<%# Eval("calculationFormula") %>' 
                                                    Width="80px" 
                                                    Visible='<%# IsEditableItem(Eval("salaryItem").ToString()) %>'></asp:TextBox>

                                                <asp:HyperLink ID="lnkFormula" runat="server" 
                                                    Text="�鿴��ʽ" 
                                                    NavigateUrl='<%# GetFormulaUrl(Eval("formulaPageUrl").ToString()) %>' 
                                                    Visible='<%# IsFormulaItem(Eval("salaryItem").ToString()) %>'></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="����">
                                            <ItemTemplate>
                                                <asp:Button ID="btnInputDesc" runat="server" 
                                                    Text="��ϸ˵��" 
                                                    CssClass="blue_btn" 
                                                    Visible='<%# IsDetailItem(Eval("salaryItem").ToString()) %>'
                                                    OnClick="btnInputDesc_Click"
                                                    CommandArgument='<%# Eval("templateId") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            
                            <div style="text-align: center; margin-top: 20px;">
                                <asp:Button ID="btnSubmit" runat="server" Text="�ύ" CssClass="blue_btn" OnClick="btnSubmit_Click"/>
                                <asp:Button ID="btnSave" runat="server" Text="����" CssClass="blue_btn" OnClick="btnSave_Click"/>
                                <asp:Button ID="btnCancel" runat="server" Text="ȡ��" CssClass="blue_btn" OnClick="btnCancel_Click"/>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <!-- ҳ������ ���� -->

        <!-- �ײ���Ȩ��Ϣ -->
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
