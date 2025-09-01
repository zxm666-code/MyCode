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
    public partial class Post_update : System.Web.UI.Page
    {
        Sqlhelp sh = new Sqlhelp();
        protected void Page_Load(object sender, EventArgs e)
        {
            // 禁用非侵入式验证
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                string postID = Request.QueryString["postID"];
                if (!string.IsNullOrEmpty(postID))
                {
                    // 根据 postID 从数据库中查询岗位信息
                    DataTable dt = GetPostInfoByID(postID);
                    if (dt.Rows.Count > 0)
                    {
                        txtJobName.Text = dt.Rows[0]["postName"].ToString();
                        txtDepartment.Text = dt.Rows[0]["deptName"].ToString();
                        txtDescription.Text = dt.Rows[0]["postDes"].ToString();
                    }
                }
            }
        }
        private DataTable GetPostInfoByID(string postID)
        {
            string strSql = "SELECT postName, deptName, postDes FROM Position WHERE postID = @postID";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@postID", postID)
            };

            try
            {
                DataSet ds = sh.getDs(strSql, parameters);
                if (ds.Tables.Count > 0)
                {
                    return ds.Tables[0];
                }
                return null;
            }
            catch (Exception ex)
            {
                lblMessage.Visible = true;
                lblMessage.Text = $"查询岗位信息时出错: {ex.Message}";
                return null;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Post_weihu.aspx");
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            this.txtJobName.Text = "";
            this.txtDepartment.Text = "";
            this.txtDescription.Text = "";
            this.lblMessage.Text = "";
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            // 获取用户输入
            string postName = txtJobName.Text.Trim();
            string deptName = txtDepartment.Text.Trim();
            string postDes = txtDescription.Text.Trim();

            // 验证岗位名称是否为空
            if (string.IsNullOrEmpty(postName))
            {
                lblMessage.Visible = true;
                lblMessage.Text = "岗位名称不能为空";
                return;
            }

            // 检查是否存在重名的岗位名称和所在部门，排除当前正在编辑的岗位
            string postID = Request.QueryString["postID"];
            if (IsPostExists(postName, deptName, postID))
            {
                lblMessage.Visible = true;
                lblMessage.Text = "此岗位已经存在";
                return;
            }

            // 更新岗位信息
            if (UpdatePost(postName, deptName, postDes))
            {
                lblMessage.Visible = true;
                lblMessage.Text = "岗位信息更新成功";
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "岗位信息更新失败，请稍后重试";
            }
        }

        private bool IsPostExists(string postName, string deptName, string postID)
        {
            string strSql = "SELECT COUNT(*) FROM Position WHERE postName = @postName AND deptName = @deptName AND postID != @postID";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@postName", postName),
                new SqlParameter("@deptName", deptName),
                new SqlParameter("@postID", postID)
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
                lblMessage.Visible = true;
                lblMessage.Text = $"检查岗位是否存在时出错: {ex.Message}";
                return false;
            }
        }

        private bool UpdatePost(string postName, string deptName, string postDes)
        {
            string strSql = "UPDATE Position SET postName = @postName, deptName = @deptName, postDes = @postDes WHERE postID = @postID";
            string postID = Request.QueryString["postID"];
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@postName", postName),
                new SqlParameter("@deptName", deptName),
                new SqlParameter("@postDes", postDes),
                new SqlParameter("@postID", postID)
            };

            try
            {
                int rowsAffected = sh.execSql(strSql, parameters);
                return rowsAffected > 0;
            }
            catch (Exception ex)
            {
                lblMessage.Visible = true;
                lblMessage.Text = $"更新岗位信息时出错: {ex.Message}";
                return false;
            }
        }
    }
}