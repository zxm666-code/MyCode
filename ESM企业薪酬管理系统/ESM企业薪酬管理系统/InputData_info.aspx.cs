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
    public partial class InputData_info : System.Web.UI.Page
    {
        Sqlhelp sh = new Sqlhelp();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string userRole = Session["UserRole"].ToString();
                string userName = Session["UserName"].ToString();

                // 优先从查询字符串获取empId
                string empId = Request.QueryString["empId"] ?? Session["EmpId"]?.ToString();

                if (!string.IsNullOrEmpty(empId))
                {
                    // 获取实际员工姓名显示在标题中
                    string actualUserName = GetEmployeeName(empId);
                    lblSalaryTitle.Text = $"{actualUserName}的薪酬项目列表";

                    LoadSalaryData(empId);
                }
                else
                {
                    // 处理没有empId的情况
                    lblSalaryTitle.Text = "薪酬项目列表";
                }
            }
        }

        // 新增方法：根据empId获取员工姓名
        private string GetEmployeeName(string empId)
        {
            string sql = "SELECT empName FROM Employee WHERE empId = @empId";
            SqlParameter[] parameters = { new SqlParameter("@empId", empId) };

            object result = sh.ExecuteScalar(sql, parameters);
            return result?.ToString() ?? "未知员工";
        }

        private void LoadSalaryData(string empId)
        {
            string sql = @"
                SELECT 
                    salaryItem, 
                    CASE WHEN isAdd = 1 THEN '累加' ELSE '扣除' END as isAdd,
                    CASE WHEN isTax = 1 THEN '是' ELSE '否' END as isTax,
                    calculationFormula,
                    calculationCoefficient,
                    upperLimit,
                    explainPageUrl AS explainPageUrl
                FROM SalaryTemplate 
                WHERE empId = @empId
                ORDER BY isAdd DESC, salaryItem";

            SqlParameter[] parameters = {
                new SqlParameter("@empId", empId)
            };

            DataSet ds = sh.getDs(sql, parameters);

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                // 保存数据集到ViewState供后续计算使用
                ViewState["SalaryData"] = ds.Tables[0];

                gvSalaryItems.DataSource = ds.Tables[0];
                gvSalaryItems.DataBind();

                // 计算实发工资
                decimal totalSalary = CalculateTotalSalary(ds.Tables[0]);
                lblTotalSalary.Text = totalSalary.ToString("N2");
            }
        }

        private decimal CalculateTotalSalary(DataTable dt)
        {
            decimal total = 0;

            // 提取基本工资
            DataRow baseSalaryRow = dt.AsEnumerable()
                .FirstOrDefault(r => r["salaryItem"].ToString() == "基本工资");

            decimal baseSalary = 0;
            if (baseSalaryRow != null && TryParseDecimal(baseSalaryRow["calculationFormula"], out baseSalary))
            {
                System.Diagnostics.Debug.WriteLine($"找到基本工资: {baseSalary}");
            }
            else
            {
                System.Diagnostics.Debug.WriteLine("警告: 未找到基本工资或格式错误");
                baseSalary = 0;
            }

            foreach (DataRow row in dt.Rows)
            {
                string salaryItem = row["salaryItem"].ToString();
                string formulaStr = row["calculationFormula"].ToString();
                decimal coefficient = 0;
                decimal upperLimit = 0;
                decimal value = 0;

                // 安全地解析系数和上限
                TryParseDecimal(row["calculationCoefficient"], out coefficient);
                TryParseDecimal(row["upperLimit"], out upperLimit);

                // 处理三险一金项目
                if (new[] { "住房公积金", "医疗保险", "失业保险", "养老保险" }.Contains(salaryItem))
                {
                    // 确保基本工资有效
                    if (baseSalary <= 0)
                    {
                        System.Diagnostics.Debug.WriteLine($"警告: 计算{salaryItem}时基本工资为0");
                        continue;
                    }

                    // 计算三险一金
                    if (baseSalary <= upperLimit)
                    {
                        value = baseSalary * coefficient;
                    }
                    else
                    {
                        value = upperLimit * coefficient;
                    }

                    System.Diagnostics.Debug.WriteLine($"{salaryItem}: 基数={baseSalary}, 系数={coefficient}, 上限={upperLimit}, 计算结果={value}");
                }
                else
                {
                    // 处理其他项目
                    if (IsFormulaDescription(formulaStr))
                    {
                        // 如果是公式描述，跳过计算（或使用默认值）
                        System.Diagnostics.Debug.WriteLine($"跳过{salaryItem}的计算公式: {formulaStr}");
                        value = 0; // 或设置默认值
                    }
                    else if (TryParseDecimal(formulaStr, out decimal formulaValue))
                    {
                        value = formulaValue;
                    }
                    else
                    {
                        System.Diagnostics.Debug.WriteLine($"警告: {salaryItem}的calculationFormula格式错误: {formulaStr}");
                        value = 0;
                    }
                }

                bool isAdd = row["isAdd"].ToString() == "累加";
                total += isAdd ? value : -value;
            }

            return total;
        }

        // 判断是否为公式描述（根据前缀）
        private bool IsFormulaDescription(string formulaStr)
        {
            return !string.IsNullOrEmpty(formulaStr) &&
                   (formulaStr.StartsWith("公式:") || formulaStr.Contains("计算"));
        }

        // 安全的十进制转换方法
        private bool TryParseDecimal(object value, out decimal result)
        {
            result = 0;

            if (value == null || value == DBNull.Value)
                return false;

            string strValue = value.ToString();

            // 处理可能的千位分隔符或其他格式问题
            strValue = strValue.Replace(",", "").Trim();

            // 如果包含非数字字符，转换失败
            if (System.Text.RegularExpressions.Regex.IsMatch(strValue, @"[^\d.-]"))
                return false;

            return decimal.TryParse(strValue, out result);
        }

        // 格式化工资显示值
        protected string FormatSalaryValue(string salaryItem, object formulaObj, object coefficientObj, object upperLimitObj)
        {
            try
            {
                DataTable dt = ViewState["SalaryData"] as DataTable;
                if (dt == null) return "数据错误";

                // 提取基本工资
                DataRow baseSalaryRow = dt.AsEnumerable()
                    .FirstOrDefault(r => r["salaryItem"].ToString() == "基本工资");

                decimal baseSalary = 0;
                if (baseSalaryRow != null && TryParseDecimal(baseSalaryRow["calculationFormula"], out baseSalary))
                {
                    System.Diagnostics.Debug.WriteLine($"FormatSalaryValue - 找到基本工资: {baseSalary}");
                }
                else
                {
                    return "基本工资错误";
                }

                string formulaStr = formulaObj?.ToString() ?? "";
                decimal coefficient = 0;
                decimal upperLimit = 0;
                decimal finalValue = 0;

                // 安全解析参数
                TryParseDecimal(coefficientObj, out coefficient);
                TryParseDecimal(upperLimitObj, out upperLimit);

                // 处理三险一金项目
                if (new[] { "住房公积金", "医疗保险", "失业保险", "养老保险" }.Contains(salaryItem))
                {
                    if (baseSalary <= 0) return "基本工资错误";

                    if (baseSalary <= upperLimit)
                    {
                        finalValue = baseSalary * coefficient;
                    }
                    else
                    {
                        finalValue = upperLimit * coefficient;
                    }

                    return $"{finalValue:N2} 元<br/>({formulaStr})";
                }
                else
                {
                    // 其他项目：如果是公式描述则显示描述，否则显示计算值
                    if (IsFormulaDescription(formulaStr))
                    {
                        return formulaStr; // 直接显示公式描述
                    }
                    else if (TryParseDecimal(formulaStr, out finalValue))
                    {
                        return finalValue.ToString("N2") + " 元";
                    }
                    else
                    {
                        return formulaStr; // 显示原始内容
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"格式化工资值出错: {ex.Message}");
                return "计算错误";
            }
        }
    }
}