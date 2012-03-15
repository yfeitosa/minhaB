<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="InserirDados.aspx.cs" Inherits="Biblioteca.WebApplication.View.Configuracoes.InserirDados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Auto criar banco de dados</h2>
    <h3>
        cuidado!! todos os dados e tabelas serão apagados</h3>
    <table>
        <tr>
            <td colspan="2">
                <h2>
                    Livros</h2>
            </td>
        </tr>
        <tr>
            <td>
                <h3>
                    Titulo</h3>
            </td>
            <td>
                <h3>
                    Autor</h3>
            </td>
        </tr>
        <tr>
            <td>
                Era uma Vez
            </td>
            <td>
                Mario
            </td>
        </tr>
        <tr>
            <td>
                João e Maria
            </td>
            <td>
                Mario
            </td>
        </tr>
        <tr>
            <td>
                João e o pé de feijão
            </td>
            <td>
                Luis
            </td>
        </tr>
        <tr>
            <td>
                Os três porquinhos
            </td>
            <td>
                Luis
            </td>
        </tr>
    </table>
    <br />
    <input type="button" id="btInsAutor" value="Criar DB" />
    
    <script src="././././../../Scripts/jquery-1.6.4.min.js" type="text/javascript"> </script>
    <script src="././././../../Scripts/jquery.noty.js" type="text/javascript"> </script>
    <script type="text/javascript">

        $("#btInsAutor").click(function () {

            var dados = {};

            var request = $.ajax({
                type: "POST",
                url: "InserirDados.aspx?Inserir=1",
                data: dados
            });

            request.done(function (data) {
                $("#divResultado").html(data);
                noty({ "text": "Banco de Dados Criado com Sucesso!!!", "layout": "bottom", "type": "success", "textAlign": "center", "easing": "swing", "animateOpen": { "height": "toggle" }, "animateClose": { "height": "toggle" }, "speed": "500", "timeout": "5000", "closable": true, "closeOnSelfClick": true });

                /*alert('Banco de Dados Criado com Sucesso!!!');*/
            });

            request.fail(function (jqXHR, textStatus) {
                noty({ "text": "Request failed: " + textStatus, "layout": "bottom", "type": "error", "textAlign": "center", "easing": "swing", "animateOpen": { "height": "toggle" }, "animateClose": { "height": "toggle" }, "speed": "500", "timeout": "5000", "closable": true, "closeOnSelfClick": true });
            });
        });
    </script>
    <br />
</asp:Content>
