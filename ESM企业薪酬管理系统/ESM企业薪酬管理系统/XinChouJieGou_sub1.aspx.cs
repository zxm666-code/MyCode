using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ESM企业薪酬管理系统
{
    public partial class XinChouJieGou_sub1 : System.Web.UI.Page
    {
        Sqlhelp sh = new Sqlhelp();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["empid"] == null)
                {
                    Response.Redirect("XinChouJieGou.aspx");
                    return;
                }
                LoadSalaryItems();
            }
            else
            {
                // 在回发时也重新绑定数据，确保动态控件存在
                LoadSalaryItems();
            }
        }


        private void LoadSalaryItems()
        {
            string empid = Request.QueryString["empid"];
            string sql = @"
                SELECT 
                    salaryItem, 
                    CASE WHEN isAdd = 1 THEN '累加' ELSE '扣除' END as isAdd,
                    CASE WHEN isTax = 1 THEN '是' ELSE '否' END as isTax,
                    calculationFormula
                FROM SalaryTemplate 
                WHERE empId = @empid";

            SqlParameter[] parameters = {
                new SqlParameter("@empid", empid)
            };

            DataSet ds = sh.getDs(sql, parameters);

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                gvSalaryItems.DataSource = ds.Tables[0];
                gvSalaryItems.DataBind();
            }
        }

        protected void gvSalaryItems_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView row = (DataRowView)e.Row.DataItem;
                string salaryItem = row["salaryItem"].ToString();
                PlaceHolder ph = e.Row.FindControl("phCalculation") as PlaceHolder;

                if (ph == null) return;

                ph.Controls.Clear();

                if (salaryItem == "基本工资" || salaryItem == "补贴")
                {
                    TextBox txt = new TextBox();
                    txt.ID = "txtValue";
                    txt.CssClass = "text-input";
                    txt.Text = row["calculationFormula"] != DBNull.Value ? row["calculationFormula"].ToString() : "";
                    txt.Attributes["type"] = "number";  // HTML5 数字输入类型
                    txt.Attributes["step"] = "any";     // 允许小数
                    txt.Attributes["min"] = "0";        // 不允许负数

                    ph.Controls.Add(txt);
                }
                else if (new[] { "住房公积金", "养老保险", "医疗保险", "失业保险" }.Contains(salaryItem))
                {
                    HyperLink link = new HyperLink();
                    link.Text = "查看公式";
                    link.NavigateUrl = $"JiSuanRule.aspx?item={Server.UrlEncode(salaryItem)}";
                    ph.Controls.Add(link);
                }
                else
                {
                    Label lbl = new Label();
                    lbl.Text = row["calculationFormula"] != DBNull.Value ? row["calculationFormula"].ToString() : "";
                    ph.Controls.Add(lbl);
                }
            }
        }
        // 修改btnSubmit_Click方法，移除重新绑定数据的调用
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string empid = Request.QueryString["empid"];
                if (string.IsNullOrEmpty(empid))
                {
                    Response.Redirect("XinChouJieGou.aspx");
                    return;
                }

                bool hasChanges = false;

                // 确保 GridView 已绑定数据
                if (gvSalaryItems.Rows.Count == 0)
                {
                    LoadSalaryItems();
                }

                foreach (GridViewRow row in gvSalaryItems.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        Label lblItemName = row.FindControl("lblItemName") as Label;
                        if (lblItemName == null) continue;

                        string salaryItem = lblItemName.Text;

                        if (salaryItem == "基本工资" || salaryItem == "补贴")
                        {
                            TextBox txtValue = row.FindControl("txtValue") as TextBox;
                            if (txtValue == null)
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('无法找到输入控件！');", true);
                                return;
                            }

                            string newValue = txtValue.Text.Trim();

                            // 更宽松的数字验证
                            string numericValue = Regex.Replace(newValue, @"[^\d.]", "");
                            if (string.IsNullOrEmpty(numericValue) ||
                                !decimal.TryParse(numericValue,
                                    System.Globalization.NumberStyles.Any,
                                    System.Globalization.CultureInfo.InvariantCulture,
                                    out decimal result))
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                                    "alert('请输入有效的数字（如：3000 或 1000.50）！');", true);
                                return;
                            }

                            // 更新数据库
                            string sql = "UPDATE SalaryTemplate SET calculationFormula = @formula WHERE empId = @empid AND salaryItem = @item";
                            SqlParameter[] parameters = {
                        new SqlParameter("@formula", numericValue),
                        new SqlParameter("@empid", empid),
                        new SqlParameter("@item", salaryItem)
                    };

                            int affectedRows = sh.execSql(sql, parameters);
                            if (affectedRows > 0)
                            {
                                hasChanges = true;
                            }
                        }
                    }
                }

                if (hasChanges)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('修改成功！');", true);
                    LoadSalaryItems(); // 刷新显示
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error: {ex.ToString()}");
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    $"alert('保存失败: {ex.Message}');", true);
            }
        }



        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("XinChouJieGou.aspx");
        }
    }
}