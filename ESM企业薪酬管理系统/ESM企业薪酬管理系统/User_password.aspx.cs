using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace ESM企业薪酬管理系统
{
    public partial class User_password : System.Web.UI.Page
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
                string userRole = Session["UserRole"].ToString();
                string userName = Session["UserName"].ToString();

                lblUserName.Text = userName;
                lblRole.Text = GetRoleName(userRole);

                // 设置用户名文本框为只读并显示登录用户的账号
                txtUsername.Text = userName;
                txtUsername.ReadOnly = true;

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
            // 禁用页面上的所有验证控件
            foreach (Control control in Page.Controls)
            {
                BaseValidator validator = control as BaseValidator;
                if (validator != null)
                {
                    validator.Enabled = false;
                }
            }

            // 清除会话中的用户信息
            Session.Abandon();

            // 重定向到登录页面
            Response.Redirect("Login.aspx");
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            string userId = txtUsername.Text;
            string oldPassword = txtOldPassword.Text;
            string newPassword = txtNewPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

            // 检查新密码和确认密码是否一致
            if (newPassword != confirmPassword)
            {
                lblMessage.Text = "两次输入的密码不一致";
                lblMessage.Visible = true;
                return;
            }

            // 从数据库中获取用户的旧密码
            string query = "SELECT Password FROM [User] WHERE userId = @userId";
            SqlParameter[] parameters = new SqlParameter[]
            {
        new SqlParameter("@userId", SqlDbType.VarChar, 10) { Value = userId }
            };
            DataSet dataSet = sh.getDs(query, parameters);

            if (dataSet.Tables[0].Rows.Count > 0)
            {
                string storedPassword = dataSet.Tables[0].Rows[0]["Password"].ToString();

                // 验证旧密码
                if (oldPassword != storedPassword)
                {
                    lblMessage.Text = "旧密码不正确";
                    lblMessage.Visible = true;
                    return;
                }

                // 更新密码
                string updateQuery = "UPDATE [User] SET Password = @newPassword WHERE userId = @userId";
                SqlParameter[] updateParameters = new SqlParameter[]
                {
            new SqlParameter("@newPassword", SqlDbType.VarChar, 32) { Value = newPassword },
            new SqlParameter("@userId", SqlDbType.VarChar, 10) { Value = userId }
                };
                int rowsAffected = sh.execSql(updateQuery, updateParameters);

                if (rowsAffected > 0)
                {
                    lblMessage.Text = "密码修改成功";
                    lblMessage.Visible = true;
                    // 清空输入框
                    txtOldPassword.Text = "";
                    txtNewPassword.Text = "";
                    txtConfirmPassword.Text = "";
                }
                else
                {
                    lblMessage.Text = "密码修改失败，请稍后重试";
                    lblMessage.Visible = true;
                }
            }
            else
            {
                lblMessage.Text = "用户不存在";
                lblMessage.Visible = true;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            this.txtOldPassword.Text = "";
            this.txtNewPassword.Text = "";
            this.txtConfirmPassword.Text = "";
            this.lblMessage.Text = "";
        }
    }
}