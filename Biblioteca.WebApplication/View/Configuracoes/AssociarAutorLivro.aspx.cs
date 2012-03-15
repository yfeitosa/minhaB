using System;
using Biblioteca.Dominio.Servicos;

namespace Biblioteca.WebApplication.View.Configuracoes
{
    public partial class AssociarAutorLivro : System.Web.UI.Page
    {
        private IAdministradorServico _administradorServico;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["Inserir"] != null)
            {
                CriarContainer();

                var autor = _administradorServico.PesquisarAutorPor(Convert.ToInt32(Request.Form["Autor"]));
                var livro = _administradorServico.PesquisarLivroPor(Convert.ToInt32(Request.Form["Livro"]));

                _administradorServico.AssociarAutorcomLivro(autor,livro);
                Response.Write("sucesso");
                Response.End();
            }
        }

        private void CriarContainer()
        {
            var container = Global.InicializarContainer();
            _administradorServico = container.Resolve<IAdministradorServico>();
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            CriarContainer();
            CarregarDados();
        }

        public void CarregarDados()
        {
            DropDownListAutor.DataSource = _administradorServico.PesquisarAutores();
            DropDownListLivro.DataSource = _administradorServico.PesquisarLivros();
            DropDownListAutor.DataBind();
            DropDownListLivro.DataBind();
        }
    }
}