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
    public partial class User_role_selectrole : System.Web.UI.Page
    {
        Sqlhelp sh = new Sqlhelp();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 检查是否有 empId（单用户）或 empIds（多用户）
                string empId = Request.QueryString["empId"];
                string empIds = Request.QueryString["empIds"];

                if (!string.IsNullOrEmpty(empId))
                {
                    // 单用户模式
                    BindUserInfo(empId);
                    SetCurrentRole(empId);
                   // lblSelectedCount.Text = "当前修改用户: " + empId;
                }
                else if (!string.IsNullOrEmpty(empIds))
                {
                    // 多用户模式
                    string[] userIds = empIds.Split(',');
                    BindUsersInfo(userIds);
                   // lblSelectedCount.Text = $"共选中 {userIds.Length} 位用户";
                }
                else
                {
                    // 无参数，返回列表页
                    Response.Redirect("User_role_list.aspx");
                }
            }
        }
        // 绑定单个用户信息（原有方法）
        private void BindUserInfo(string empId)
        {
            string sql = @"SELECT e.empId, e.empName, e.deptName, e.Mail, e.Tel1, u.Role
                   FROM Employee e
                   INNER JOIN [User] u ON e.empId = u.userId
                   WHERE e.empId = @empId";
            SqlParameter[] parameters = { new SqlParameter("@empId", empId) };
            DataSet ds = sh.getDs(sql, parameters);
            if (ds != null && ds.Tables.Count > 0)
            {
                gvUsers.DataSource = ds.Tables[0];
                gvUsers.DataBind();
            }
        }

        // 绑定多个用户信息（新增方法）
        private void BindUsersInfo(string[] empIds)
        {
            string sql = @"SELECT e.empId, e.empName, e.deptName, e.Mail, e.Tel1, u.Role
                   FROM Employee e
                   INNER JOIN [User] u ON e.empId = u.userId
                   WHERE e.empId IN ({0})";

            // 动态生成参数化查询
            var parameters = new List<SqlParameter>();
            var paramNames = new List<string>();

            for (int i = 0; i < empIds.Length; i++)
            {
                string paramName = "@empId" + i;
                paramNames.Add(paramName);
                parameters.Add(new SqlParameter(paramName, empIds[i]));
            }

            string inClause = string.Join(",", paramNames);
            DataSet ds = sh.getDs(string.Format(sql, inClause), parameters.ToArray());

            if (ds != null && ds.Tables.Count > 0)
            {
                gvUsers.DataSource = ds.Tables[0];
                gvUsers.DataBind();
            }
        }

        // 更新角色（通用方法）
        private void UpdateRole(string userId)
        {
            string selectedRole = rblRoles.SelectedValue;
            string sql = @"UPDATE [User] SET Role = @Role WHERE userId = @userId";
            SqlParameter[] parameters = {
        new SqlParameter("@Role", selectedRole),
        new SqlParameter("@userId", userId)
    };
            int rowsAffected = sh.execSql(sql, parameters);

            if (rowsAffected > 0)
            {
                lblMessage.Text = "角色修改成功！";
            }
            else
            {
                lblMessage.Text = "角色修改失败，请稍后重试。";
            }
        }
        private void SetCurrentRole(string empId)
        {
            string sql = @"SELECT Role FROM [User] WHERE userId = @empId";
            SqlParameter[] parameters = { new SqlParameter("@empId", empId) };
            object result = sh.ExecuteScalar(sql, parameters);
            if (result != null)
            {
                int currentRole = Convert.ToInt32(result);
                rblRoles.SelectedValue = currentRole.ToString();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("User_role_list.aspx");
        }

        protected void btnModifyRole_Click(object sender, EventArgs e)
        {
            string empId = Request.QueryString["empId"];
            string empIds = Request.QueryString["empIds"];

            if (!string.IsNullOrEmpty(empId))
            {
                // 单用户修改
                UpdateRole(empId);
            }
            else if (!string.IsNullOrEmpty(empIds))
            {
                // 多用户批量修改
                string[] userIds = empIds.Split(',');
                foreach (string userId in userIds)
                {
                    UpdateRole(userId);
                }
            }
            else
            {
                lblMessage.Text = "未选择任何用户！";
            }
        
        }
        }
    }
