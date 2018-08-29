<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SiteTCC.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title></title>
</head>
<body>
    <script type="text/javascript" src="js/materialize.min.js"></script>
   <form id="form1" runat="server">
        <center>
        <div class="section"></div>
            <div class="section"></div>
            <div class="section"></div>
            <div class="container">
            <div class="z-depth-1 row" style="display: inline-block; padding: 32px 40px 0px 40px; border: 1px solid #EEE; background: rgba(0,0,0,0.04)">
                <h3 class="red-text text-lighten-3">Login</h3>
                <div class='row'>
                    <div class='col s12'>
                    </div>
                </div>
                
                <div class='row'>
                    <div class='input-field col s12'>
                        
                        <asp:TextBox ID="txtCNPJ" CssClass="validate" runat="server"></asp:TextBox>
                        <label for='txtCNPJ'>CNPJ</label>
                    </div>
                </div>

                <div class='row'>
                    <div class='input-field col s12'>
                    <asp:TextBox ID="txtSenha" type="password" CssClass="validate" runat="server"></asp:TextBox>

                        <label for='txtSenha'>Senha</label>
                     </asp:Panel>

                    </div>
                <label style='float: right;'>
                    <b><asp:LinkButton ID="btnRecSenha" runat="server" CssClass="red-text text-lighten-3">Esqueceu sua senha?</asp:LinkButton></b>
				</label>
            </div>

                
                <br />
                <center>
                <div class='row'>
                    <asp:LinkButton ID="btnLogin" class='col s12 btn btn-large waves-effect red lighten-3' runat="server" OnClick="btnLogin_Click">Login</asp:LinkButton>
                    
                </div>              
                </center>
                <div class="section"></div>
        </div>
      </div>
    </center>
    </form>

</body>
</html>
