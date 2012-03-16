using System;
using System.Collections.Generic;
using Biblioteca.Dominio.Entidades;
using Biblioteca.Dominio.Servicos;
using Biblioteca.NHibernate.NHibernateHelpers;
using Castle.Components.DictionaryAdapter;
using NHibernate.Criterion;

namespace Biblioteca.WebApplication.View.Configuracoes
{
    public partial class CriarDados : System.Web.UI.Page
    {
        private IAdministradorServico _administradorServico;

        protected void Page_Init(object sender, EventArgs e)
        {
            CriarContainer();
            CarregarDados();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["InserirAutor"] != null)
            {
                if (_administradorServico == null)
                    CriarContainer();

                _administradorServico.InserirAutor(Request.Form["Autor"].ToString());
                Response.Write("sucesso");
                Response.End();
            }

            if (Request["InserirEstante"] != null)
            {
                if (_administradorServico == null)
                    CriarContainer();

                _administradorServico.InserirEstante(Request.Form["Categoria"].ToString());
                //Response.Write("sucesso");
                //Response.End();
            }

            if (Request["InserirPrateleira"] != null)
            {
                if (_administradorServico == null)
                    CriarContainer();

                var estante = _administradorServico.PesquisarEstantePor(Convert.ToInt32(Request.Form["Estante"]));
                var prateleira = Request.Form["Classe"].ToString();
                _administradorServico.InserirPrateleira(prateleira, estante);
                Response.Write("sucesso");
                Response.End();
            }

        }

        private void CriarContainer()
        {
            var container = Global.InicializarContainer();
            _administradorServico = container.Resolve<IAdministradorServico>();
        }


        public void CarregarDados()
        {
            //DropDownListEstante.DataSource = _administradorServico.PesquisarEstantes();
            //DropDownListEstante.DataBind();
        }

        protected void ButtonVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/View/Configuracoes/InserirDadosFormulario.aspx");
            Response.Write("sucesso");
            Response.End();
        }

        [System.Web.Services.WebMethod]
        public static IList<Estante> CarregarListaEstantes()
        {
            IAdministradorServico _administradorServico;
            var container = Global.InicializarContainer();
            _administradorServico = container.Resolve<IAdministradorServico>();

            IList<Estante> listaAtualizada =  _administradorServico.PesquisarEstantes();

            foreach (var estante in listaAtualizada)
            {
                estante.Prateleiras = new List<Prateleira>();
                //IList<Prateleira> buscarPrateleira = _administradorServico.PesquisarPrateleiras();
                //foreach (var prateleira in buscarPrateleira)
                //{
                //    if (estante.Id == prateleira.Estante.Id)
                //    {
                //        estante.Prateleiras.Add(prateleira);
                //    }
                //}
            }

            return listaAtualizada;
        }
    }
}