<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    ViewStateMode="Disabled" ClientIDMode="Static" CodeBehind="AssociarAutorLivro.aspx.cs"
    Inherits="Biblioteca.WebApplication.View.Configuracoes.AssociarAutorLivro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        criar dados</h2>
    <table>
        <tr>
            <td>
                Autor
            </td>
            <td>
                <asp:DropDownList ID="DropDownListAutor" runat="server" DataTextField="Nome" DataValueField="Id"
                    ViewStateMode="Disabled">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Livro
            </td>
            <td>
                <asp:DropDownList ID="DropDownListLivro" runat="server" DataTextField="Titulo" DataValueField="Id"
                    ViewStateMode="Disabled">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <br />
    <input type="button" id="btInsDadosForm" value="Salvar" />
    <script src="././././../../Scripts/jquery-1.6.4.min.js" type="text/javascript"> </script>
    <script src="././././../../Scripts/jquery.noty.js" type="text/javascript"> </script>
    <script type="text/javascript">
        $("#btInsDadosForm").click(function () {

            var dados = {
                Autor: $("#DropDownListAutor").val(),
                Livro: $("#DropDownListLivro").val()
            };

            var request = $.ajax({
                type: "POST",
                url: "AssociarAutorLivro.aspx?Inserir=1",
                data: dados
            });

            request.done(function (data) {
                $("#divResultado").html(data);
                noty({ "text": "Salvo com Sucesso!!!", "layout": "bottom", "type": "success", "textAlign": "center", "easing": "swing", "animateOpen": { "height": "toggle" }, "animateClose": { "height": "toggle" }, "speed": "500", "timeout": "5000", "closable": true, "closeOnSelfClick": true });
                $("#DropDownListAutor").val(0);
                $("#DropDownListLivro").val(0);
            });

            request.fail(function (jqXHR, textStatus) {
                noty({ "text": "Request failed: " + textStatus, "layout": "bottom", "type": "error", "textAlign": "center", "easing": "swing", "animateOpen": { "height": "toggle" }, "animateClose": { "height": "toggle" }, "speed": "500", "timeout": "5000", "closable": true, "closeOnSelfClick": true });
            });
        });
    </script>
</asp:Content>
