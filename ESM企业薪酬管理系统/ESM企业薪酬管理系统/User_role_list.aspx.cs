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
    public partial class User_role_list : System.Web.UI.Page
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
                BindGridView();

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
        private void BindGridView()
        {
            string sql = @"SELECT e.empId AS userId, e.empName, e.Tel1, e.Mail, 
                    CASE u.Role 
                        WHEN 1 THEN '普通用户'
                        WHEN 2 THEN '薪酬管理员'
                        WHEN 3 THEN '超级管理员'
                        ELSE '未知角色'
                    END AS Role
                  FROM Employee e
                  INNER JOIN [User] u ON e.empId = u.userId";
            DataSet ds = sh.getDs(sql, null);
            if (ds != null && ds.Tables.Count > 0)
            {
                gvUsers.DataSource = ds.Tables[0];
                gvUsers.DataBind();
            }
            // 根据当前页码禁用相应的按钮
            lnkFirst.Enabled = gvUsers.PageIndex > 0;
            lnkPrev.Enabled = gvUsers.PageIndex > 0;
            lnkNext.Enabled = gvUsers.PageIndex < gvUsers.PageCount - 1;
            lnkLast.Enabled = gvUsers.PageIndex < gvUsers.PageCount - 1;
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string role = ddlRole.SelectedValue;

            string sql = @"SELECT e.empId AS userId, e.empName, e.Tel1, e.Mail, 
                    CASE u.Role 
                        WHEN 1 THEN '普通用户'
                        WHEN 2 THEN '薪酬管理员'
                        WHEN 3 THEN '超级管理员'
                        ELSE '未知角色'
                    END AS Role
                  FROM Employee e
                  INNER JOIN [User] u ON e.empId = u.userId
                  WHERE 1=1";
            if (!string.IsNullOrEmpty(username))
            {
                sql += $" AND e.empId LIKE @username";
            }
            if (!string.IsNullOrEmpty(name))
            {
                sql += $" AND e.empName LIKE @name";
            }
            if (!string.IsNullOrEmpty(email))
            {
                sql += $" AND e.Mail LIKE @email";
            }
            if (!string.IsNullOrEmpty(role))
            {
                sql += $" AND u.Role = @role";
            }

            SqlParameter[] parameters = new SqlParameter[]
            {
        new SqlParameter("@username", $"%{username}%"),
        new SqlParameter("@name", $"%{name}%"),
        new SqlParameter("@email", $"%{email}%"),
        new SqlParameter("@role", role)
            };

            DataSet ds = sh.getDs(sql, parameters);
            if (ds != null && ds.Tables.Count > 0)
            {
                gvUsers.DataSource = ds.Tables[0];
                gvUsers.DataBind();
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            this.txtEmail.Text = "";
            this.txtName.Text = "";
            this.txtUsername.Text = "";
        }

        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvUsers.Rows)
            {
                CheckBox chkSelect = (CheckBox)row.FindControl("chkSelect");
                if (chkSelect != null && chkSelect.Checked)
                {
                    string userId = gvUsers.DataKeys[row.RowIndex].Value.ToString();
                    // 先删除User表中的记录
                    string deleteUserSql = $"DELETE FROM [User] WHERE userId = @userId";
                    SqlParameter[] userParams = { new SqlParameter("@userId", userId) };
                    sh.execSql(deleteUserSql, userParams);

                    // 再删除Employee表中的记录
                    string deleteEmployeeSql = $"DELETE FROM Employee WHERE empId = @userId";
                    SqlParameter[] employeeParams = { new SqlParameter("@userId", userId) };
                    sh.execSql(deleteEmployeeSql, employeeParams);
                }
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('删除成功！');", true);
            }
            // 删除操作完成后，重新绑定数据
            BindGridView();
        }

        protected void lnkModifyRole_Click(object sender, EventArgs e)
        {
            List<string> selectedUserIds = new List<string>();

            // 检查当前页的选中项
            foreach (GridViewRow row in gvUsers.Rows)
            {
                CheckBox chkSelect = (CheckBox)row.FindControl("chkSelect");
                if (chkSelect != null && chkSelect.Checked)
                {
                    string userId = gvUsers.DataKeys[row.RowIndex].Value.ToString();
                    selectedUserIds.Add(userId);
                }
            }

            if (selectedUserIds.Count > 0)
            {
                string userIdsString = string.Join(",", selectedUserIds);
                Response.Redirect($"User_role_selectrole.aspx?empIds={HttpUtility.UrlEncode(userIdsString)}");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('请至少选择一个用户');", true);
            }
        }

        protected void chkAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkAll = (CheckBox)gvUsers.HeaderRow.FindControl("chkAll");
            foreach (GridViewRow row in gvUsers.Rows)
            {
                CheckBox chkSelect = (CheckBox)row.FindControl("chkSelect");
                if (chkSelect != null)
                {
                    chkSelect.Checked = chkAll.Checked;
                }
            }
        }

        protected void lnkFirst_Click(object sender, EventArgs e)
        {
            gvUsers.PageIndex = 0;
            BindGridView();
        }

        protected void lnkPrev_Click(object sender, EventArgs e)
        {
            if (gvUsers.PageIndex > 0)
            {
                gvUsers.PageIndex--;
                BindGridView();
            }
        }

        protected void lnkNext_Click(object sender, EventArgs e)
        {
            if (gvUsers.PageIndex < gvUsers.PageCount - 1)
            {
                gvUsers.PageIndex++;
                BindGridView();
            }
        }

        protected void lnkLast_Click(object sender, EventArgs e)
        {
            gvUsers.PageIndex = gvUsers.PageCount - 1;
            BindGridView();
        }

        protected void gvUsers_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}