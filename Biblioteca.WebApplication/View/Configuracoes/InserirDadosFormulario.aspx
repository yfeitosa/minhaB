<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    ViewStateMode="Disabled" ClientIDMode="Static" CodeBehind="InserirDadosFormulario.aspx.cs"
    Inherits="Biblioteca.WebApplication.View.Configuracoes.InserirDadosFormulario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        criar dados</h2>
    <table>
        <tr>
            <td colspan="2">
            </td>
        </tr>
        <tr>
            <td>
                Nome do Livro
            </td>
            <td>
                <input type="text" id="txbLivro" title="Nome do Livro" />
            </td>
        </tr>
        <tr>
            <td>
                Autor
            </td>
            <td>
                <asp:DropDownList ID="DropDownListAutor" runat="server" DataTextField="Nome" DataValueField="Id"
                    ViewStateMode="Disabled" title="Selecione o Autor">
                </asp:DropDownList>
                <img src="../../img/add.png" id="ImageButtonCriarAutor" align="Top" width="16" height="16"
                    style="cursor: pointer" title="Criar Autor" />
            </td>
        </tr>
        <tr>
            <td>
                Prateleira
            </td>
            <td>
                <asp:DropDownList ID="DropDownListPrateleira" runat="server" DataTextField="Classe"
                    DataValueField="Id" ViewStateMode="Disabled" title="Selecione a Prateleira">
                </asp:DropDownList>
                <img src="../../img/add.png" id="ImageButtonCriarPrateleira" title="Criar Prateleira" align="Top" width="16"
                    height="16" style="cursor: pointer" />
            </td>
        </tr>
    </table>
    <br />
    <img src="../../img/save-as.png" id="ImageInsDadosForm" align="Top" width="24" height="24" style="cursor: pointer" title="Salvar"/>
    <img src="../../img/main-menu.png" id="ImageButtonAssociacao" align="Top" width="24" height="24" style="cursor: pointer" title="Associar Livro a Autor"/>
    <script src="././././../../Scripts/jquery-1.6.4.min.js" type="text/javascript"> </script>
    <script src="././././../../Scripts/jquery.noty.js" type="text/javascript"> </script>
    <script type="text/javascript">
        $("#ImageInsDadosForm").click(function () {

            var dados = {
                Autor: $("#DropDownListAutor").val(),
                Prat: $("#DropDownListPrateleira").val(),
                Livro: $("#txbLivro").val()
            };

            var request = $.ajax({
                type: "POST",
                url: "InserirDadosFormulario.aspx?Inserir=1",
                data: dados
            });

            request.done(function (data) {
                $("#divResultado").html(data);
                noty({ "text": "Salvo com Sucesso!!!", "layout": "bottom", "type": "success", "textAlign": "center", "easing": "swing", "animateOpen": { "height": "toggle" }, "animateClose": { "height": "toggle" }, "speed": "500", "timeout": "5000", "closable": true, "closeOnSelfClick": true });
                $("#DropDownListAutor").val(0);
                $("#DropDownListPrateleira").val(0);
                $("#txbLivro").val('');
            });

            request.fail(function (jqXHR, textStatus) {
                noty({ "text": "Request failed: " + textStatus, "layout": "bottom", "type": "error", "textAlign": "center", "easing": "swing", "animateOpen": { "height": "toggle" }, "animateClose": { "height": "toggle" }, "speed": "500", "timeout": "5000", "closable": true, "closeOnSelfClick": true });
            });
        });

        $("#ImageButtonCriarPrateleira").click(function () {
            location.href = "CriarDados.aspx";
        });

        $("#ImageButtonCriarAutor").click(function () {
            location.href = "CriarDados.aspx";
        });

        $("#ImageButtonAssociacao").click(function () {
            location.href = "AssociarAutorLivro.aspx";
        });

    </script>
</asp:Content>
