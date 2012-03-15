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
                <asp:TextBox ID="txbLivro" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Autor
            </td>
            <td>
                <asp:DropDownList ID="DropDownListAutor" runat="server" DataTextField="Nome" DataValueField="Id"
                    ViewStateMode="Disabled">
                </asp:DropDownList>
                <asp:Button ID="ButtonCriarAutor" runat="server" Text="Criar" OnClick="ButtonCriarAutor_Click" />
            </td>
        </tr>
        <tr>
            <td>
                Prateleira
            </td>
            <td>
                <asp:DropDownList ID="DropDownListPrateleira" runat="server" DataTextField="Classe"
                    DataValueField="Id" ViewStateMode="Disabled">
                </asp:DropDownList>
                <asp:Button ID="ButtonCriarPrateleira" runat="server" Text="Criar" OnClick="ButtonCriarPrateleira_Click" />
            </td>
        </tr>
    </table>
    <br />
    <input type="button" id="btInsDadosForm" value="Salvar" />
    <asp:Button ID="ButtonAssociacao" runat="server" Text="Associar Livro Existente" OnClick="ButtonCriarAssociacao_Click" />
           
    <script src="././././../../Scripts/jquery-1.6.4.min.js" type="text/javascript"> </script>
    <script src="././././../../Scripts/jquery.noty.js" type="text/javascript"> </script>
    <script type="text/javascript">
        $("#btInsDadosForm").click(function () {

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
    </script>
</asp:Content>
