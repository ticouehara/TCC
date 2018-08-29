using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SiteTCC
{
    public partial class Login : System.Web.UI.Page
    {
        Conexao con = new Conexao();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            con = new Conexao();
            dt = new DataTable();

            dt = con.executa_sql("select * from Cliente where cnpj like '" + txtCNPJ.Text + "' and senhaCli like '" + txtSenha.Text + "'");
            if (dt.Rows.Count > 0)
            {
                Response.Redirect("index.aspx");
            }
            else
                Response.Write("<script>alert('Usuário ou senha incorreto')</script>");
        }
    }
}