using Biblioteca.Dominio.Entidades;
using FluentNHibernate.Mapping;

namespace Biblioteca.NHibernate.Mapping
{
    public class AutorMap : ClassMap<Autor>
    {
        public AutorMap()
        {
            Table("tb_autor");
            Id(x => x.Id).Column("cod_autor").GeneratedBy.Native();

            Map(x => x.Nome).Not.Nullable().Length(100);
            Map(x => x.Data_Criacao).Not.Nullable();

            HasManyToMany(x => x.Livros).AsBag().Table("tb_livros_autor")
    .LazyLoad().Cascade.SaveUpdate();
        }
    }
}