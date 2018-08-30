<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SiteTCC.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
    <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css"  media="screen,projection"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <style>
        .navbar-fixed {position: absolute;z-index:999999999;}
        .input-field input:focus + label {
            color: darkslategray !important;
        }
        .row .input-field input:focus {
            border-bottom: 1px solid darkslategray !important;
            box-shadow: 0 1px 0 0 darkslategray !important
        }
    </style>
</head>
<body>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/js/materialize.min.js"></script>
    <script type="text/javascript" src="js/parallax_init.js"></script>
     <script>
         $(function () {
             $(".button-collapse").sideNav();
         });
         $(function () {
             $('.parallax').parallax();
         });
         var MIN_TEXTLENGTH = 1;

         function forcePostback(ctrl) {
             if (ctrl != null && ctrl.value && ctrl.value.length >= MIN_TEXTLENGTH) {
                 __doPostBack(ctrl.id, '');
             }
         }

 </script>

    <form id="form1" runat="server" autocomplete="off">
    <div>
        <div class="navbar-fixed">
  <nav class="z-depth-0" style="background-color: rgba(0, 0, 0, 0.3);">
    <div class="nav-wrapper">
        <div class="row">
        <div class="col s12">
           <a href="#" data-activates="menu-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
          <a href="#" class="brand-logo">Penélope</a>

          <ul class="right hide-on-med-and-down">
            <li><a href="https://github.com/dogfalo/materialize/" target="_blank">Github</a></li>
            <li><a href="https://twitter.com/MaterializeCSS" target="_blank">Twitter</a></li>
            <li><a href="http://next.materializecss.com/getting-started.html" target="_blank">Docs</a></li>
          </ul>
            </div>
            </div>
         <ul  class="side-nav" id="menu-mobile">
            <li><a href="#">Github</a></li>
            <li><a href="#">Twitter</a></li>
            <li><a href="#"">Docs</a></li>
        </ul>
        </div>
        </nav>   
        </div>
        <div class="parallax-container">
            <div class="parallax">
            <img src="img/banner22.jpg"/>
            </div>
        </div>
        <div class="section white">
            <div class="row container">
                <h3 class="header">Produtos profissionais para cabelereiros</h3>
                <p class="grey-text text-darken-3 lighten-3">Texto de apresentação xxxxxxxxxxxxxxxxx xxxxxxxxxxxxxxxxxxx xxxxxxxxxxxxxxxx xxxxxxxxxxxxxxxxxxxxxxx xxxxxxxxxxxxxxxxxxxxx xxxxxxxxxxxxxxxxxxxxxxxxx xxxxxxxxxxxxxxxxxxxx xxxxxxx</p>
            </div>
        </div>
        <div class="parallax-container">
            <div class="parallax">
                <img src="img/img2.jpg"/>
            </div>
        </div>
        <div class="section-white">
            <div class="row container">
                <h3 class="header">Produtos</h3>
                <div class="row">
                    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnPesquisa">
                    <div class="col s12">
                        <div class="input-field col s12 m6">
                            <asp:TextBox ID="txtPesquisa" runat="server"></asp:TextBox>
                            <label for="txtPesquisa">Pesquisar produto...</label>
                        </div>
                        <div class="col s12 m6">
                        <br />
                            <asp:LinkButton ID="btnPesquisa" runat="server" OnClick="btnPesquisar_Click" CssClass="waves-effect waves-light btn red lighten-3">Pesquisar</asp:LinkButton>
                        </div>
                    </div>
                </asp:Panel>
                </div>
                <div class="row">
                    <asp:ListView ID="lstProdutos" runat="server" OnPagePropertiesChanging="lstProdutos_PagePropertiesChanging">
                        <ItemTemplate>
                                <div class="col s12 m6 l4">
                                    <div class="card large">
                                        <div class="card-image waves-effect waver-block waver-light">
                                            <div class="section"></div>
                                            <asp:Image ID="imgProduto" runat="server" Height="200px" Width="200px" ImageUrl='<%# "data:image/png;base64," + Eval("imagem") %>' />
                                        </div>
                                        <div class="card-content">
                                            <asp:Label ID="lblNome" runat="server" Text='<%# Bind("nome") %>' CssClass="card-title activator grey-text text-darken-4">
                                            </asp:Label><i class="material-icons right activator">more_vert</i>                                        
                                        </div>
                                        <div class="card-action">
                                            <h5><asp:Label ID="lblPreco" runat="server" Text='<%# Bind("precoUnitario", "R$ {0:f2}") %>' CssClass="card-price"></asp:Label></h5></p>
                                            <asp:LinkButton ID="lnkAdicionar" runat="server">Adicionar ao carrinho</asp:LinkButton></p>
                                        </div>
                                        <div class="card-reveal">
                                            <span class="card-title">
                                            <asp:Label ID="lblNome2" runat="server" Text='<%# Bind("nome") %>' CssClass="grey-text text-darken-4">
                                            </asp:Label><i class="material-icons waves-effect waves-circle close-icon">close</i></span>
                                            <p><asp:Label ID="lblDesc" runat="server" Text='<%# Bind("descricao") %>'></asp:Label></p>
                                        </div>
                                    </div>
                                </div>
                        </ItemTemplate>
                    </asp:ListView>
                    </div>
                <div class="row">
                    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lstProdutos" PageSize="12">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true"
                            ShowNextPageButton="false" />
                            <asp:NumericPagerField ButtonType="Link" />
                            <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton = "false" />
                        </Fields>
                    </asp:DataPager>
                    </div>
                </div>
        </div>
</div>                               
    </form>
</body>
