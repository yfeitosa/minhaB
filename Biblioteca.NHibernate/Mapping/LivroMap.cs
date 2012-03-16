using Biblioteca.Dominio.Entidades;
using FluentNHibernate.Mapping;

namespace Biblioteca.NHibernate.Mapping
{
    public class LivroMap : ClassMap<Livro>
    {
        public LivroMap()
        {
            Table("tb_livro");
            Id(x => x.Id).Column("cod_livro").GeneratedBy.Native();

            Map(x => x.Titulo).Not.Nullable().Length(100);
            Map(x => x.Data_Criacao).Not.Nullable();

            References(x => x.Prateleira).Not.Nullable();
            
            HasManyToMany(x => x.Autores).AsBag().Table("tb_livros_autor")
                .LazyLoad().Cascade.SaveUpdate();
        }
    }
}