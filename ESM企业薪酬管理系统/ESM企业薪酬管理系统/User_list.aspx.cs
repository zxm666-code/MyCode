using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ESM企业薪酬管理系统
{
    public partial class User_list : System.Web.UI.Page
    {
        Sqlhelp sh=new Sqlhelp();
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
        // 绑定员工数据到GridView
        private void BindEmployeeData()
        {
            try
            {
                // 修正后的查询（注意表名[User]和字段userId）
                string query = @"SELECT e.empId, e.empName, e.deptName, e.Mail, e.Tel1 
                       FROM Employee e
                       LEFT JOIN [User] u ON e.empId = u.userId
                       WHERE u.userId IS NULL";

                DataSet dataSet = sh.getDs(query, new SqlParameter[0]);

                // 调试输出
                System.Diagnostics.Debug.WriteLine($"查询到{dataSet.Tables[0].Rows.Count}条未创建账号的员工");

                gvEmployees.DataSource = dataSet.Tables[0];
                gvEmployees.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('加载数据失败: {Server.HtmlEncode(ex.Message)}');</script>");
            }
            // 根据当前页码禁用相应的按钮
            lnkFirst.Enabled = gvEmployees.PageIndex > 0;
            lnkPrev.Enabled = gvEmployees.PageIndex > 0;
            lnkNext.Enabled = gvEmployees.PageIndex < gvEmployees.PageCount - 1;
            lnkLast.Enabled = gvEmployees.PageIndex < gvEmployees.PageCount - 1;
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                // 获取查询条件
                string empId = txtJobName.Text.Trim();
                string empName = txtUsername.Text.Trim();
                string deptName = txtDepartment.Text.Trim();
                string mail = txtEmail.Text.Trim();

                // 修正后的基础SQL查询
                string query = @"SELECT e.empId, e.empName, e.deptName, e.Mail, e.Tel1 
                       FROM Employee e
                       LEFT JOIN [User] u ON e.empId = u.userId  -- 修正关联字段
                       WHERE u.userId IS NULL";  // 修正判断条件

                // 动态添加查询条件
                List<SqlParameter> parameters = new List<SqlParameter>();

                if (!string.IsNullOrEmpty(empId))
                {
                    query += " AND e.empId LIKE @empId";
                    parameters.Add(new SqlParameter("@empId", "%" + empId + "%"));
                }

                if (!string.IsNullOrEmpty(empName))
                {
                    query += " AND e.empName LIKE @empName";
                    parameters.Add(new SqlParameter("@empName", "%" + empName + "%"));
                }

                if (!string.IsNullOrEmpty(deptName))
                {
                    query += " AND e.deptName LIKE @deptName";
                    parameters.Add(new SqlParameter("@deptName", "%" + deptName + "%"));
                }

                if (!string.IsNullOrEmpty(mail))
                {
                    query += " AND e.Mail LIKE @mail";
                    parameters.Add(new SqlParameter("@mail", "%" + mail + "%"));
                }

                // 获取并绑定数据
                DataSet dataSet = sh.getDs(query, parameters.ToArray());
                gvEmployees.DataSource = dataSet.Tables[0];
                gvEmployees.DataBind();

                // 调试输出（可选）
                System.Diagnostics.Debug.WriteLine($"查询返回 {dataSet.Tables[0].Rows.Count} 条记录");
            }
            catch (Exception ex)
            {
                // 更友好的错误提示
                Response.Write($"<script>alert('查询失败: {Server.HtmlEncode(ex.Message)}');</script>");
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            // 清空所有文本框
            this.txtJobName.Text = "";
            this.txtUsername.Text = "";
            this.txtDepartment.Text = "";
            this.txtEmail.Text = "";
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
        protected void chkAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkAll = (CheckBox)gvEmployees.HeaderRow.FindControl("chkAll");
            foreach (GridViewRow row in gvEmployees.Rows)
            {
                CheckBox chkSelect = (CheckBox)row.FindControl("chkSelect");
                if (chkSelect != null)
                {
                    chkSelect.Checked = chkAll.Checked;
                }
            }
        }
        protected void btnCreateUser_Click(object sender, EventArgs e)
        {
            try
            {
                int createdCount = 0;
                StringBuilder createdUsers = new StringBuilder();

                foreach (GridViewRow row in gvEmployees.Rows)
                {
                    
                    CheckBox chkSelect = row.FindControl("chkSelect") as CheckBox;

                    if (chkSelect != null && chkSelect.Checked)
                    {
                        string empId = gvEmployees.DataKeys[row.RowIndex].Value.ToString();

                        string insertSql = @"INSERT INTO [User] (userId, Password, Role) 
                                   VALUES (@userId, @Password, @Role)";

                        SqlParameter[] insertParams = {
                    new SqlParameter("@userId", empId),
                    new SqlParameter("@Password", "123456"), 
                    new SqlParameter("@Role", 1) // 假设1是"普通用户"
                };

                        int result = sh.execSql(insertSql, insertParams);
                        if (result > 0)
                        {
                            createdCount++;
                            createdUsers.AppendLine($"{empId}");
                        }
                    }
                }

                if (createdCount > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('创建成功！');", true);
                    BindEmployeeData(); // 刷新列表
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "info",
                        "alert('请至少勾选一名员工！');", true);
                }
            }
            catch (SqlException sqlEx)
            {
                string msg = sqlEx.Number == 2627 ? "部分员工已有账号！" : sqlEx.Message;
                ClientScript.RegisterStartupScript(GetType(), "error",
                    $"alert('创建失败: {msg}');", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "error",
                    $"alert('系统错误: {ex.Message}');", true);
            }
        }
        
    }
}