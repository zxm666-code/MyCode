<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Employee_moreinfo.aspx.cs" Inherits="ESM企业薪酬管理系统.Employee_moreinfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>薪资管理系统 - 员工详细信息</title>
    <link href="css/cfi_global.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .container {
            width: 90%;
            max-width: 700px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .header-line {
            height: 8px;
            background-color: #525252;
            margin-bottom: 1px;
        }
        
        .content-box {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            margin: 20px 0;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        
        .employee-details {
            display: grid;
            grid-template-columns: 120px 1fr;
            gap: 10px;
            margin-bottom: 15px;
        }
        
        .detail-label {
            font-weight: bold;
            color: #555;
        }
        
        .detail-value {
            color: #333;
        }
        
        .btn-close {
            background-color: #4a6ea9;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
        }
        
        .btn-close:hover {
            background-color: #3a5a8f;
        }
    </style>
    <script type="text/javascript">
        function closePage() {
            window.history.back();
            return false;
        }
    </script>
</head>
<body>
<div class="header-line"></div>

<div class="container">
    <h1>员工详细信息</h1>
    
    <div class="content-box">
        <div class="employee-details">
            <div class="detail-label">员工号</div>
            <div class="detail-value"><%= EmpId %></div>
            
            <div class="detail-label">姓名</div>
            <div class="detail-value"><%= EmpName %></div>
            
            <div class="detail-label">部门</div>
            <div class="detail-value"><%= Dept %></div>
            
            <div class="detail-label">出生年月</div>
            <div class="detail-value"><%= BirthDate %></div>
            
            <div class="detail-label">身份证号码</div>
            <div class="detail-value"><%= IdCard %></div>
            
            <div class="detail-label">岗位</div>
            <div class="detail-value"><%= Position %></div>
            
            <div class="detail-label">级别</div>
            <div class="detail-value"><%= Level %></div>
            
            <div class="detail-label">邮件账号</div>
            <div class="detail-value"><%= Email %></div>
            
            <div class="detail-label">联系电话1</div>
            <div class="detail-value"><%= Phone1 %></div>
            
            <div class="detail-label">联系电话2</div>
            <div class="detail-value"><%= Phone2 %></div>
            
            <div class="detail-label">通信地址</div>
            <div class="detail-value"><%= Address %></div>
        </div>
        
        <button class="btn-close" onclick="closePage()">关闭</button>
    </div>
</div>

</body>
</html>