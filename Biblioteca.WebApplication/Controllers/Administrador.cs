using Biblioteca.Dominio.Entidades;
using System.Linq;

namespace Biblioteca.WebApplication.Controllers
{
    public class Administrador
    {
        public struct LivrosConsultaModelView
        {
            public LivrosConsultaModelView(Livro x) : this()
            {
                Titulo = x.Titulo;
                Autor = x.Autores.Select(y => y.Nome).ToList().FirstOrDefault();
                Classe = x.Prateleira.Classe;
                Categoria = x.Prateleira.Estante.Categoria;
            }

            public string Titulo { get; set; }
            public string Autor { get; set; }
            public string Classe { get; set; }
            public string Categoria { get; set; }
            
        }

        public struct PratileiraConsultaModelView
        {
            public PratileiraConsultaModelView(Prateleira x): this()
            {
                Classe = x.Classe;
                Categoria = x.Estante.Categoria;
            }

            public string Classe { get; set; }
            public string Categoria { get; set; }


        }
    }
}