using System;
using System.Data;
using System.Drawing.Imaging;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Linq;
using Bytescout.BarCode;
using System.Text.RegularExpressions;

namespace findBarcode
{
    public partial class Default : System.Web.UI.Page
    {
        private string SearchString = "";
        StringBuilder sb = new StringBuilder();
        barkodDbDataContext con = new barkodDbDataContext();
        void getMetot(string sBuilder)
        {
            try
            {
                mainHolder.Controls.Add(new Literal { Text = sBuilder });

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", ex.Message, true);
            }
        }
        string getTable(string code)
        {

            try
            {
                var q = con.PAZ_DEPOBAZLISTOKFIYATs.ToList();
                if (code != "")
                {

                    q = q.Where(x => x.NAME.Contains(code)).ToList();
              
                }
                foreach (var item in q)
                {
                    sb.Append("<tr>");
                    sb.Append("<td><a href='Default.aspx?productCode=" + item.BARCODE + "&productName="+item.NAME+"' class='btn btn-primary'>Göster</a> </td>");
                    sb.Append("<td>" + item.BARCODE + "</td>");
                    sb.Append("<td>" + item.NAME + "</td>");
                    sb.Append("<td>" + item.CODE + "</td>");
                    sb.Append("<td>" + item.BIRIM + "</td>");
                    sb.Append("</tr>");
                }
                getMetot(sb.ToString());
                return sb.ToString();
            }
            catch (Exception ex)
            {

                return ex.Message;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getTable("");
                if (Request.QueryString["productCode"] != null)
                {
                    GenerateBarcode(Request.QueryString["productCode"].ToString());
                }
            }

            if (txtFind.Text.Length > 1)
            {
                getTable(txtFind.Text.ToUpper());
            }

            if (Page.IsPostBack)
            {
                getTable(txtFind.Text);
                if (Request.QueryString["productCode"] != null)
                {
                    GenerateBarcode(Request.QueryString["productCode"].ToString());
                    //if (Session["_errCode"] != null)
                    //    ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", Session["_errCode"].ToString(), true);
                }
            }
        }
        //protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    try
        //    {
        //        int rowIndex = Convert.ToInt32(e.CommandArgument);
        //        //string barcode = GridView1.Rows[rowIndex].Cells[1].Text;
        //        //string lbl = GridView1.Rows[rowIndex].Cells[2].Text;
        //        //MessageBox.Show(barcode , "BARCODE",MessageBoxButton.OK);
        //        GenerateBarcode(barcode, lbl);

        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write(ex.Message);
        //    }
        //}
        private void GenerateBarcode(string code)
        {
            try
            {
                Barcode barcode = new Barcode();

                // Set symbology
                barcode.Symbology = SymbologyType.EAN13;
                // Set value
                barcode.Value = code;

                // Clear http output
                Response.Clear();
                // Set the content type to PNG
                Response.ContentType = "image/png";
                // Add content type header
                Response.AddHeader("Content-Type", "image/png");
                // Set the content disposition
                Response.AddHeader("Content-Disposition", "inline;filename=result.png");

                // Save image to output stream
                barcode.SaveImage(Response.OutputStream, ImageFormat.Png);

                // End response
                Response.End();
                Label1.Visible = true;
                Label1.Text = Request.QueryString["productName"].ToString();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", ex.Message, true);
                Session.Add("_errCode", ex.Message);
            }
            
        }
        //public string HighlightText(string InputTxt)
        //{
        //    string Search_Str = txtFind.Text;
        //    Regex RegExp = new Regex(Search_Str.Replace(" ", "|").Trim(), RegexOptions.IgnoreCase);
        //    return RegExp.Replace(InputTxt, new MatchEvaluator(ReplaceKeyWords));
        //}
        //public string ReplaceKeyWords(Match m)
        //{
        //    return ("<span class=highlight>" + m.Value + "</span>");
        //}

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SearchString = txtFind.Text;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtFind.Text = "";
            SearchString = "";
            //GridView1.DataBind();
        }
    }
}