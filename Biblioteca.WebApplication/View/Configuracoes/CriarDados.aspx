<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    ClientIDMode="Static" ViewStateMode="Disabled" CodeBehind="CriarDados.aspx.cs"
    Inherits="Biblioteca.WebApplication.View.Configuracoes.CriarDados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        criar dados</h2>
    <table>
        <tr>
            <td colspan="2">
                <h3>
                    Autor</h3>
            </td>
        </tr>
        <tr>
            <td>
                Nome do Autor:
            </td>
            <td>
                <input type="text" id="txbAutor" />
                <input type="button" id="btInsAutor" value="Salvar" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <h3>
                    Estante</h3>
            </td>
        </tr>
        <tr>
            <td>
                Categoria:
            </td>
            <td>
                <input type="text" id="txbEstante" />
                <input type="button" id="btInsEstante" value="Salvar" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <h3>
                    Prateleira</h3>
            </td>
        </tr>
        <tr>
            <td>
                Classe:
            </td>
            <td>
                <asp:TextBox ID="txbPrateleira" runat="server"></asp:TextBox>
                <input type="button" id="btInsPrateleira" value="Salvar" />
            </td>
        </tr>
        <tr>
            <td>
                Estante
            </td>
            <td>
                <asp:DropDownList ID="DropDownListEstante" runat="server" DataTextField="Categoria"
                    DataValueField="Id" ViewStateMode="Disabled" Height="16px">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <asp:Button ID="ButtonVoltar" runat="server" OnClick="ButtonVoltar_Click" Text="Voltar" />
    <br />
    <script src="././././../../Scripts/jquery-1.6.4.min.js" type="text/javascript"> </script>
    <script src="././././../../Scripts/jquery.noty.js" type="text/javascript"> </script>
    <script type="text/javascript">

        $("#btInsAutor").click(function () {

            var dados = {
                Autor: $("#txbAutor").val()
            };

            var request = $.ajax({
                type: "POST",
                url: "CriarDados.aspx?InserirAutor=1",
                data: dados
            });

            request.done(function (data) {
                $("#divResultado").html(data);
                noty({ "text": "Salvo com Sucesso!!!", "layout": "bottom", "type": "success", "textAlign": "center", "easing": "swing", "animateOpen": { "height": "toggle" }, "animateClose": { "height": "toggle" }, "speed": "500", "timeout": "5000", "closable": true, "closeOnSelfClick": true });
                $("#txbAutor").val('');
            });

            request.fail(function (jqXHR, textStatus) {
                noty({ "text": "Request failed: " + textStatus, "layout": "bottom", "type": "error", "textAlign": "center", "easing": "swing", "animateOpen": { "height": "toggle" }, "animateClose": { "height": "toggle" }, "speed": "500", "timeout": "5000", "closable": true, "closeOnSelfClick": true });
            });
        });

        $("#btInsEstante").click(function () {

            var dados = {
                Categoria: $("#txbEstante").val()
            };

            var request = $.ajax({
                type: "POST",
                url: "CriarDados.aspx?InserirEstante=1",
                data: dados
            });

            request.done(function (data) {
                $("#divResultado").html(data);
                noty({ "text": "Salvo com Sucesso!!!", "layout": "bottom", "type": "success", "textAlign": "center", "easing": "swing", "animateOpen": { "height": "toggle" }, "animateClose": { "height": "toggle" }, "speed": "500", "timeout": "5000", "closable": true, "closeOnSelfClick": true });
                //$("#txbEstante").val('');
                AddItemInList();
            });

            request.fail(function (jqXHR, textStatus) {
                noty({ "text": "Request failed: " + textStatus, "layout": "bottom", "type": "error", "textAlign": "center", "easing": "swing", "animateOpen": { "height": "toggle" }, "animateClose": { "height": "toggle" }, "speed": "500", "timeout": "5000", "closable": true, "closeOnSelfClick": true });
            });
        });

        $("#btInsPrateleira").click(function () {

            var dados = {
                Estante: $("#DropDownListEstante").val(),
                Classe: $("#txbPrateleira").val()
            };

            var request = $.ajax({
                type: "POST",
                url: "CriarDados.aspx?InserirPrateleira=1",
                data: dados
            });

            request.done(function (data) {
                $("#divResultado").html(data);
                noty({ "text": "Salvo com Sucesso!!!", "layout": "bottom", "type": "success", "textAlign": "center", "easing": "swing", "animateOpen": { "height": "toggle" }, "animateClose": { "height": "toggle" }, "speed": "500", "timeout": "5000", "closable": true, "closeOnSelfClick": true });
                $("#txbPrateleira").val('');
                $("#DropDownListEstante").val(0);
            });

            request.fail(function (jqXHR, textStatus) {
                noty({ "text": "Request failed: " + textStatus, "layout": "bottom", "type": "error", "textAlign": "center", "easing": "swing", "animateOpen": { "height": "toggle" }, "animateClose": { "height": "toggle" }, "speed": "500", "timeout": "5000", "closable": true, "closeOnSelfClick": true });
            });
        });

        function AddItemInList() {
            var list = document.getElementById('DropDownListEstante');
            var box = document.getElementById('txbEstante');
            var newListItem = document.createElement('OPTION');

            newListItem.text = box.value;
            newListItem.value = box.value;
            list.add(newListItem);

            box.value = "";
            box.focus();
        }
    </script>
</asp:Content>
