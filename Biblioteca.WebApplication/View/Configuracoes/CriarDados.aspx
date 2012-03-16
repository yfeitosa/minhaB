<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    ClientIDMode="Static" ViewStateMode="Disabled" CodeBehind="CriarDados.aspx.cs"
    Inherits="Biblioteca.WebApplication.View.Configuracoes.CriarDados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="box-toggle">
        <h2>
            criar dados</h2>
        <h3>
            Autor</h3>
        <div class="tgl">
            Nome do Autor:
            <input type="text" id="txbAutor" />
            <input type="button" id="btInsAutor" value="Salvar" />
        </div>
        <br />
        <h3>
            Estante</h3>
        <div class="tgl">
            Categoria:
            <input type="text" id="txbEstante" />
            <input type="button" id="btInsEstante" value="Salvar" />
        </div>
        <br />
        <h3>
            Prateleira</h3>
        <div class="tgl">
            Classe:
            <asp:TextBox ID="txbPrateleira" runat="server"></asp:TextBox>
            <input type="button" id="btInsPrateleira" value="Salvar" />
            <br />
            Estante
            <select id="DropDownListEstante">
            </select>
        </div>
    </div>
    <asp:Button ID="ButtonVoltar" runat="server" OnClick="ButtonVoltar_Click" Text="Voltar" />
    <br />
    <script src="././././../../Scripts/jquery-1.6.4.min.js" type="text/javascript"> </script>
    <script src="././././../../Scripts/jquery.noty.js" type="text/javascript"> </script>
    <script type="text/javascript">
        jQuery.fn.toggleText = function (a, b) {
            return this.html(this.html().replace(new RegExp("(" + a + "|" + b + ")"), function (x) { return (x == a) ? b : a; }));
        };

        $(document).ready(function () {
            CarregarLista();

            $('.tgl').before('<img id="imagesExample" tooltip="Exibir grid" src="././././../../img/view_text.png" style="cursor:pointer"></img>');
            $('.tgl').css('display', 'none');
            $('#imagesExample', '#box-toggle').click(function () {
                $(this).next().slideToggle('slow')
                    .siblings('.tgl:visible').slideToggle('fast');
                // aqui começa o funcionamento do plugin
                $(this).toggleText('Exibir', 'Fechar')
                    .siblings('span').next('.tgl:visible').prev()
                    .toggleText('Exibir', 'Fechar');
            });
        });

        function CarregarLista() {
            var dados = {};
            var request = $.ajax({
                type: "POST",
                url: "CriarDados.aspx/CarregarListaEstantes",
                data: dados,
                contentType: "application/json"
            });

            request.done(function (data) {
                $("#DropDownListEstante").find("option").remove();
                $.each(data.d, function (index, value) {
                    $('#DropDownListEstante').append("<option value='" + value.Id + "'>" + value.Categoria + "</option>");
                });
            });

            request.fail(function (jqXHR, textStatus) {
                noty({ "text": "Request failed: " + textStatus, "layout": "bottom", "type": "error", "textAlign": "center", "easing": "swing", "animateOpen": { "height": "toggle" }, "animateClose": { "height": "toggle" }, "speed": "500", "timeout": "5000", "closable": true, "closeOnSelfClick": true });
            });

        }

        $("#btInsAutor").click(function () {

            var dados = {
                Autor: $("#txbAutor").val()
            };

            var request = $.ajax({
                type: "POST",
                url: "CriarDados.aspx?InserirAutor=1",
                clearForm: true,
                data: dados
            });

            request.done(function (data) {
                $("#divResultado").html(data);
                noty({ "text": "Salvo com Sucesso!!!", "layout": "bottom", "type": "success", "textAlign": "center", "easing": "swing", "animateOpen": { "height": "toggle" }, "animateClose": { "height": "toggle" }, "speed": "500", "timeout": "5000", "closable": true, "closeOnSelfClick": true });
                //$("#txbAutor").val('');
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
                CarregarLista();
                $("#divResultado").html(data);
                noty({ "text": "Salvo com Sucesso!!!", "layout": "bottom", "type": "success", "textAlign": "center", "easing": "swing", "animateOpen": { "height": "toggle" }, "animateClose": { "height": "toggle" }, "speed": "500", "timeout": "5000", "closable": true, "closeOnSelfClick": true });
                $("#txbEstante").val('');

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
                $("#DropDownListEstante").val('');
            });

            request.fail(function (jqXHR, textStatus) {
                noty({ "text": "Request failed: " + textStatus, "layout": "bottom", "type": "error", "textAlign": "center", "easing": "swing", "animateOpen": { "height": "toggle" }, "animateClose": { "height": "toggle" }, "speed": "500", "timeout": "5000", "closable": true, "closeOnSelfClick": true });
            });
        });

        //        function AddItemInList() {
        //            var list = document.getElementById('DropDownListEstante');
        //            var box = document.getElementById('txbEstante');
        //            var newListItem = document.createElement('OPTION');

        //            newListItem.text = box.value;
        //            newListItem.value = box.value;
        //            list.add(newListItem);

        //            box.value = "";
        //            box.focus();
        //        }
        
    </script>
</asp:Content>
