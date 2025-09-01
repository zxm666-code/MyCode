using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ESM企业薪酬管理系统
{
    public partial class Login : System.Web.UI.Page
    {
        Sqlhelp sh = new Sqlhelp();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, ImageClickEventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text;
            string role = ddlRole.SelectedValue;

            // 修改SQL查询 - 直接使用userId作为empId
            string strSql = @"SELECT u.userId, u.Role, e.* 
                     FROM [User] u
                     INNER JOIN Employee e ON u.userId = e.empId
                     WHERE u.userId = @username 
                     AND u.Password = @password 
                     AND u.Role = @role";

            SqlParameter[] parameters = new SqlParameter[]
            {
        new SqlParameter("@username", username),
        new SqlParameter("@password", password),
        new SqlParameter("@role", role)
            };

            try
            {
                DataSet ds = sh.getDs(strSql, parameters);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    DataRow row = ds.Tables[0].Rows[0];

                    // 存储会话信息
                    Session["UserRole"] = row["Role"].ToString();
                    Session["UserName"] = row["userId"].ToString(); // userId就是empId
                    Session["empId"] = row["userId"].ToString();  // 直接使用userId作为empId

                    // 可以存储更多员工信息
                    Session["EmployeeName"] = row["empName"]?.ToString(); // 假设Employee表有empName字段

                    Response.Redirect("Post_query1.aspx");
                }
                else
                {
                    lblMessage.Text = "用户名或密码错误，或角色不匹配";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "登录时发生错误: " + ex.Message;
                // 记录完整错误信息到日志
                System.Diagnostics.Trace.WriteLine(ex.ToString());
            }
        }
    }
}