using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ESM企业薪酬管理系统
{
    public partial class Employee_add : System.Web.UI.Page
    {
        Sqlhelp sh=new Sqlhelp();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                for (int i = 1; i <= 10; i++)
                {
                    ListItem item = new ListItem(i.ToString(), i.ToString());
                    ddlLevel.Items.Add(item);
                }
            }
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            string empId = txtEmployeeId.Text.Trim();
            string empName = txtName.Text.Trim();
            string birthday = txtBirthday.Text.Trim();
            string idCard = txtIdCard.Text.Trim();
            string deptName=txtDepartment.Text.Trim();
            string postName=txtPosition.Text.Trim();
            string levelStr = ddlLevel.SelectedValue; // 先将下拉框的值存为字符串
            string email = txtEmail.Text.Trim();
            string phone1 = txtPhone1.Text.Trim();
            string phone2 = txtPhone2.Text.Trim();
            string address = txtAddress.Text.Trim();

            // 检查必填项
            if (string.IsNullOrEmpty(empId) || string.IsNullOrEmpty(empName) || string.IsNullOrEmpty(birthday) ||
                string.IsNullOrEmpty(idCard) || string.IsNullOrEmpty(deptName) || string.IsNullOrEmpty(postName) ||
                string.IsNullOrEmpty(levelStr) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(phone1))
            {
                Response.Write("<script>alert('员工号、姓名、出生年月、身份证号、部门、岗位、级别、邮件账号、联系电话1为必选项，请填写完整！');</script>");
                return;
            }

            // 修改检查员工是否存在的部分
            string checkQuery = "SELECT COUNT(*) FROM Employee WHERE empId = @EmpId";
            SqlParameter[] checkParams = { new SqlParameter("@EmpId", empId) };

            // 使用新的ExecuteScalar方法
            int count = Convert.ToInt32(sh.ExecuteScalar(checkQuery, checkParams));

            if (count > 0)
            {
                Response.Write("<script>alert('此员工已经存在！');</script>");
                return;
            }
            // 1. 检查岗位是否存在
            string checkPositionSql = "SELECT COUNT(*) FROM Position WHERE postName=@PostName AND deptName=@DeptName";
            SqlParameter[] positionParams = {
        new SqlParameter("@PostName", postName),
        new SqlParameter("@DeptName", deptName)
    };

            if (Convert.ToInt32(sh.ExecuteScalar(checkPositionSql, positionParams)) == 0)
            {
                Response.Write("<script>alert('错误：该部门/岗位组合不存在！');</script>");
                return;
            }

            // 2. 检查员工号和身份证是否重复
            if (Convert.ToInt32(sh.ExecuteScalar(
                "SELECT COUNT(*) FROM Employee WHERE empId=@EmpId OR IDCard=@IDCard",
                new SqlParameter[] {
            new SqlParameter("@EmpId", empId),
            new SqlParameter("@IDCard", idCard)
                })) > 0)
            {
                Response.Write("<script>alert('员工号或身份证已存在！');</script>");
                return;
            }

            int level;
            try
            {
                level = int.Parse(levelStr); // 尝试将字符串转换为整数
            }
            catch (FormatException)
            {
                Response.Write("<script>alert('级别输入不是有效的整数，请重新输入！');</script>");
                return;
            }

            string insertQuery = @"INSERT INTO Employee (empId, empName, deptName, postName, birthday, IDCard, [level], Mail, Tel1, Tel2, address) 
                           VALUES (@EmpId, @EmpName, @DeptName, @PostName, @Birthday, @IDCard, @Level, @Mail, @Tel1, @Tel2, @Address)";

            SqlParameter[] parameters = new SqlParameter[]
            {
        new SqlParameter("@EmpId", empId),
        new SqlParameter("@EmpName", empName),
        new SqlParameter("@DeptName", deptName),
        new SqlParameter("@PostName", postName),
        new SqlParameter("@Birthday", birthday),
        new SqlParameter("@IDCard", idCard),
        new SqlParameter("@Level", level),
        new SqlParameter("@Mail", email),
        new SqlParameter("@Tel1", phone1),
        new SqlParameter("@Tel2", phone2),
        new SqlParameter("@Address", address)
            };

            try
            {
                int rowsAffected = sh.execSql(insertQuery, parameters);
                if (rowsAffected > 0)
                {
                    Response.Write("<script>alert('员工创建成功！');window.location.href='Employee_query.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('员工创建失败，请重试！');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('发生错误：{ex.Message}');</script>");
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            this.txtEmployeeId.Text = "";
            this.txtName.Text = "";
            this.txtBirthday.Text = "";
            this.txtIdCard.Text = "";
            this.txtDepartment.Text = "";
            this.txtPosition.Text = "";
            this.txtEmail.Text = "";
            this.txtPhone1.Text = "";
            this.txtPhone2.Text = "";
            this.txtAddress.Text = "";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Employee_query.aspx");
        }
    }
}