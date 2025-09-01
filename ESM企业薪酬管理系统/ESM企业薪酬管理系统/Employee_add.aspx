<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee_add.aspx.cs" Inherits="ESM企业薪酬管理系统.Employee_add" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html"; charset="utf-8" />
    <title>薪资管理系统 - 新建员工</title>
    <link href="css/cfi_global.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .decorative-line {
            width: 700px;
            height: 8px;
            
            margin: 0 auto;
        }
        .decorative-line-light {
            width: 700px;
            height: 4px;
            background-color: #BCBCBC;
            margin: 0 auto;
        }
        .decorative-line-very-light {
            width: 700px;
            height: 2px;
            background-color: #E0E0E0;
            margin: 0 auto;
        }
        .required-field:after {
            content: " *";
            color: red;
        }
        .clear-both {
            clear: both;
        }
        .main-container {
            width: 700px;
            margin: 0 auto;
            padding: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- 顶部装饰线条 - 使用CSS替代表格和过时属性 -->
        <div class="decorative-line"></div>
        <div class="decorative-line-very-light"></div>
        <div class="decorative-line-light"></div>
        <div class="decorative-line-very-light"></div>

        <!-- 主内容区域 -->
        <div class="main-container">
            <div id="sub_body">
                <div id="this_page_title">
                    <div id="item_line">
                        <h1 id="sub_title">新建员工</h1>
                    </div>
                </div>

                <div id="edit">
                    <fieldset class="pmsform">
                        <legend class="pmsform">新建员工</legend>
                        
                        <label class="pmsform required-field" id="employee_id_label">员工号</label>
                        <asp:TextBox ID="txtEmployeeId" runat="server" CssClass="input-field" Width="200px"></asp:TextBox>
                        
                        <label class="pmsform required-field" id="name_label">姓名</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="input-field" Width="200px"></asp:TextBox>
                        
                        <label class="pmsform required-field" id="birthday_label">出生年月</label>
                        <asp:TextBox ID="txtBirthday" runat="server" CssClass="input-field" Width="200px"></asp:TextBox>
                        
                        <label class="pmsform required-field" id="id_card_label">身份证号</label>
                        <asp:TextBox ID="txtIdCard" runat="server" CssClass="input-field" Width="200px"></asp:TextBox>
                        
                        <label class="pmsform required-field" id="department_label">部门</label>
                        <asp:TextBox ID="txtDepartment" runat="server" CssClass="input-field" Width="200px"></asp:TextBox>

                        <label class="pmsform required-field" id="position_label">岗位</label>
                        <asp:TextBox ID="txtPosition" runat="server" CssClass="input-field" Width="200px"></asp:TextBox>
                        
                      <label class="pmsform required-field" id="level_label">级别</label>
                        <asp:DropDownList ID="ddlLevel" runat="server" CssClass="input-field" Width="200px"></asp:DropDownList>
                        
                        <label class="pmsform required-field" id="email_label">邮件账号</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="input-field" Width="400px"></asp:TextBox>
                        
                        <label class="pmsform required-field" id="phone1_label">联系电话1</label>
                        <asp:TextBox ID="txtPhone1" runat="server" CssClass="input-field" Width="200px"></asp:TextBox>
                        
                        <label class="pmsform" id="phone2_label">联系电话2</label>
                        <asp:TextBox ID="txtPhone2" runat="server" CssClass="input-field" Width="200px"></asp:TextBox>
                        
                        <label class="pmsform" id="address_label">通信地址</label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="input-field" Width="400px"></asp:TextBox>
                        
                        <div class="clear-both"></div>
                        <div class="clear-both"></div>
                        
                        <asp:Button ID="btnCreate" runat="server" Text="创建员工" CssClass="blue_btn" OnClick="btnCreate_Click" />
                        <asp:Button ID="btnReset" runat="server" Text="重新填写" CssClass="blue_btn" CausesValidation="false" OnClick="btnReset_Click" />
                        <asp:Button ID="btnCancel" runat="server" Text="取消" CssClass="blue_btn" CausesValidation="false"  OnClick="btnCancel_Click" />
                    </fieldset>
                </div>
            </div>
        </div>

        <!-- 底部装饰线条 - 使用CSS替代表格和过时属性 -->
        <div class="decorative-line-very-light"></div>
        <div class="decorative-line-light"></div>
        <div class="decorative-line-very-light"></div>
        <div class="decorative-line"></div>
    </form>
</body>
</html>
