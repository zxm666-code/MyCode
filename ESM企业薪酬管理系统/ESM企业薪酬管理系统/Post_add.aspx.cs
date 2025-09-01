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
    public partial class Post_add : System.Web.UI.Page
    {
        Sqlhelp sh=new Sqlhelp();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnCreate_Click(object sender, EventArgs e)
        {
            // 获取用户输入
            string postId = this.txtPostId.Text.Trim();
            string postName = this.job_name.Text.Trim();
            string deptName = this.department.Text.Trim();
            string postDes = this.description.Text.Trim();

            // 验证必填项
            if (string.IsNullOrEmpty(postId) || string.IsNullOrEmpty(postName) || string.IsNullOrEmpty(deptName))
            {
                lblMessage.Text = "岗位ID、岗位名称和所在部门为必填项，请输入！";
                return;
            }

            // 检查岗位是否已存在
            if (IsPostExists(postId, postName, deptName))
            {
                lblMessage.Text = "此岗位已经存在";
                return;
            }

            // 插入新岗位记录
            if (InsertNewPost(postId, postName, deptName, postDes))
            {
                lblMessage.Text = "岗位新建成功！";
                // 清空输入框
                this.txtPostId.Text = "";
                this.job_name.Text = "";
                this.department.Text = "";
                this.description.Text = "";
            }
            else
            {
                lblMessage.Text = "岗位新建失败，请稍后重试！";
            }
        }
        private bool IsPostExists(string postId, string postName, string deptName)
        {
            string strSql = "SELECT COUNT(*) FROM Position WHERE postId = @postId OR (postName = @postName AND deptName = @deptName)";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@postId", postId),
                new SqlParameter("@postName", postName),
                new SqlParameter("@deptName", deptName)
            };

            try
            {
                DataSet ds = sh.getDs(strSql, parameters);
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    int count = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                    return count > 0;
                }
                return false;
            }
            catch (Exception ex)
            {
                lblMessage.Text = $"检查岗位是否存在时出错: {ex.Message}";
                return false;
            }
        }
        private bool InsertNewPost(string postId, string postName, string deptName, string postDes)
        {
            string strSql = "INSERT INTO Position (postId, postName, deptName, postDes) VALUES (@postId, @postName, @deptName, @postDes)";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@postId", postId),
                new SqlParameter("@postName", postName),
                new SqlParameter("@deptName", deptName),
                new SqlParameter("@postDes", postDes)
            };

            try
            {
                int rowsAffected = sh.execSql(strSql, parameters);
                return rowsAffected > 0;
            }
            catch (Exception ex)
            {
                lblMessage.Text = $"插入新岗位记录时出错: {ex.Message}";
                return false;
            }
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            this.txtPostId.Text = "";
            this.job_name.Text = "";
            this.department.Text = "";
            this.description.Text = "";
            this.lblMessage.Text = "";
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Post_weihu.aspx");
        }
    }
}