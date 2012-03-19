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
            <input type="text" id="txbAutor" title="Nome do Autor" />
            <img src="../../img/save-as.png" id="ImageInsAutor" align="Top" width="24" height="24"
                style="cursor: pointer" title="Salvar" />
        </div>
        <br />
        <h3>
            Estante</h3>
        <div class="tgl">
            Categoria:
            <input type="text" id="txbEstante" title="Categoria da Estante" />
            <img src="../../img/save-as.png" id="ImageInsEstante" align="Top" width="24" height="24"
                style="cursor: pointer" title="Salvar" />
        </div>
        <br />
        <h3>
            Prateleira</h3>
        <div class="tgl">
            Classe:
            <asp:TextBox ID="txbPrateleira" runat="server" title="Classe da Prateleira"></asp:TextBox>
            <img src="../../img/save-as.png" id="ImageInsPrateleira" align="Top" width="24" height="24"
                style="cursor: pointer" title="Salvar" />
            <br />
            Estante:
            <select id="DropDownListEstante" title="Selecionar a Estante">
            </select>
        </div>
    </div>
    <br />
    <img src="../../img/back.png" id="ImageButtonVoltar" align="Top" width="24" height="24"
        style="cursor: pointer" title="Voltar" /><br />
    <script src="../../Scripts/jquery-1.6.4.min.js" type="text/javascript"> </script>
    <script src="../../Scripts/jquery.noty.js" type="text/javascript"> </script>
    <script type="text/javascript">
        jQuery.fn.toggleText = function (a, b) {
            return this.html(this.html().replace(new RegExp("(" + a + "|" + b + ")"), function (x) { return (x == a) ? b : a; }));
        };

        $(document).ready(function () {
            CarregarLista();

            $('.tgl').before('<img id="imagesExample" title="Exibir formulário" src="../../img/view_text.png" style="cursor:pointer"></img>');
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

        $("#ImageInsAutor").click(function () {

            var dados = {
                Autor: $("#txbAutor").val()
            };
            if ($("#txbAutor").val() != '') {
                var request = $.ajax({
                    type: "POST",
                    url: "CriarDados.aspx?InserirAutor=1",
                    clearForm: true,
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

            } 
            else {
                noty({ "text": "Informe o nome do livro", "layout": "bottom", "type": "error", "textAlign": "center", "easing": "swing", "animateOpen": { "height": "toggle" }, "animateClose": { "height": "toggle" }, "speed": "500", "timeout": "3000", "closable": true, "closeOnSelfClick": true });
            }
        });

        $("#ImageInsEstante").click(function () {

            var dados = {
                Categoria: $("#txbEstante").val()
            };

            if ($("#txbEstante").val() != '') {
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

            } 
            else {
                noty({ "text": "Informe a descrição da estante", "layout": "bottom", "type": "error", "textAlign": "center", "easing": "swing", "animateOpen": { "height": "toggle" }, "animateClose": { "height": "toggle" }, "speed": "500", "timeout": "3000", "closable": true, "closeOnSelfClick": true });
            }
        });

        $("#ImageInsPrateleira").click(function () {

            var dados = {
                Estante: $("#DropDownListEstante").val(),
                Classe: $("#txbPrateleira").val()
            };

            if ($("#txbPrateleira").val() != '') {

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

            } 
            else {
                noty({ "text": "Informe a descrição da prateleira", "layout": "bottom", "type": "error", "textAlign": "center", "easing": "swing", "animateOpen": { "height": "toggle" }, "animateClose": { "height": "toggle" }, "speed": "500", "timeout": "3000", "closable": true, "closeOnSelfClick": true });
            }
        });

        $("#ImageButtonVoltar").click(function () {
            location.href = "InserirDadosFormulario.aspx";
        });
        
    </script>
</asp:Content>
