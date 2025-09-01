using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ESM企业薪酬管理系统
{
    public partial class XinChouJieGou : System.Web.UI.Page
    {
        Sqlhelp sh = new Sqlhelp();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {

                // 绑定员工数据
                BindEmployeeData();
                string userRole = Session["UserRole"].ToString();
                string userName = Session["UserName"].ToString();

                lblUserName.Text = userName;
                lblRole.Text = GetRoleName(userRole);

                ControlElementVisibility(userRole);
            }
        }
        private void ControlElementVisibility(string role)
        {
            hlUserManagement.Visible = (role == "3");
            hlTemplate.Visible = (role == "2" || role == "3");
            hlSalaryMaintain.Visible = (role == "2" || role == "3");
            liTemplate.Visible = (role == "2" || role == "3");
            liSalaryMaintain.Visible = (role == "2" || role == "3");
        }

        private string GetRoleName(string role)
        {
            switch (role)
            {
                case "1": return "普通用户";
                case "2": return "薪酬管理员";
                case "3": return "超级用户";
                default: return "未知角色";
            }
        }
        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            // 清除会话中的用户信息
            Session.Abandon();
            // 重定向到登录页面
            Response.Redirect("Login.aspx");
        }
        private void BindEmployeeData()
        {
            try
            {
                // 获取查询条件
                string empId = txtEmployeeId.Text.Trim();
                string empName = txtName.Text.Trim();
                string deptName = txtDepartment.Text.Trim();
                string Mail = txtEmail.Text.Trim();

                // 编写 SQL 查询语句
                string query = "SELECT empId,empName,deptName,postName,level,Mail,Tel1 FROM Employee WHERE 1=1";

                // 添加员工号条件
                if (!string.IsNullOrEmpty(empId))
                {
                    query += " AND empId LIKE '%" + empId + "%'";
                }

                // 添加姓名条件
                if (!string.IsNullOrEmpty(empName))
                {
                    query += " AND empName LIKE '%" + empName + "%'";
                }

                // 添加部门条件
                if (!string.IsNullOrEmpty(deptName))
                {
                    query += " AND deptName LIKE '%" + deptName + "%'";
                }

                // 添加邮件账号条件
                if (!string.IsNullOrEmpty(Mail))
                {
                    query += " AND Mail LIKE '%" + Mail + "%'";
                }

                // 这里如果没有参数，传入空数组
                SqlParameter[] parameters = new SqlParameter[0];

                // 使用 Sqlhelp 类的 getDs 方法获取数据集
                DataSet dataSet = sh.getDs(query, parameters);

                // 绑定数据到 GridView
                gvEmployees.DataSource = dataSet.Tables[0];
                gvEmployees.DataBind();

                // 根据当前页码禁用相应的按钮
                lnkFirst.Enabled = gvEmployees.PageIndex > 0;
                lnkPrev.Enabled = gvEmployees.PageIndex > 0;
                lnkNext.Enabled = gvEmployees.PageIndex < gvEmployees.PageCount - 1;
                lnkLast.Enabled = gvEmployees.PageIndex < gvEmployees.PageCount - 1;
            }
            catch (Exception ex)
            {
                // 处理异常
                Response.Write("Error: " + ex.Message);
            }
        }
        protected void lnkFirst_Click(object sender, EventArgs e)
        {
            gvEmployees.PageIndex = 0;
            BindEmployeeData();
        }

        protected void lnkPrev_Click(object sender, EventArgs e)
        {
            if (gvEmployees.PageIndex > 0)
            {
                gvEmployees.PageIndex--;
                BindEmployeeData();
            }
        }

        protected void lnkNext_Click(object sender, EventArgs e)
        {
            if (gvEmployees.PageIndex < gvEmployees.PageCount - 1)
            {
                gvEmployees.PageIndex++;
                BindEmployeeData();
            }
        }

        protected void lnkLast_Click(object sender, EventArgs e)
        {
            gvEmployees.PageIndex = gvEmployees.PageCount - 1;
            BindEmployeeData();
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindEmployeeData();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {

            this.txtEmployeeId.Text = "";
            this.txtName.Text = "";
            this.txtDepartment.Text = "";
            this.txtEmail.Text = "";
        }
    }
}