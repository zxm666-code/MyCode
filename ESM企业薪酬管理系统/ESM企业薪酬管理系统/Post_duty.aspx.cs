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
    public partial class Post_duty : System.Web.UI.Page
    {
        Sqlhelp sh = new Sqlhelp();
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 从查询字符串获取岗位名称
                string postName = Request.QueryString["name"];

                if (!string.IsNullOrEmpty(postName))
                {
                    // 对岗位名称进行 URL 解码
                    postName = HttpUtility.UrlDecode(postName);

                    // 从数据库获取岗位信息
                    DataTable postInfo = GetPostInfoFromDatabase(postName);

                    if (postInfo != null && postInfo.Rows.Count > 0)
                    {
                        DataRow row = postInfo.Rows[0];
                        lblPostName.Text = row["postName"].ToString();
                        lblPostDescription.Text = row["postDes"].ToString();
                    }
                    else
                    {
                        lblPostName.Text = "未知岗位";
                        lblPostDescription.Text = "没有找到对应的岗位描述信息";
                    }
                }
            }
        }
        private DataTable GetPostInfoFromDatabase(string  postName)
        {
            // 使用参数化查询防止 SQL 注入
            string sql = "SELECT postName, postDes FROM Position WHERE postName = @postName";

            SqlParameter[] parameters = {
                new SqlParameter("@postName", postName)
            };

            DataSet ds = sh.getDs(sql, parameters);
            return ds.Tables[0];
        }
    }
}