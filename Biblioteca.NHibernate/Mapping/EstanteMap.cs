using Biblioteca.Dominio.Entidades;
using FluentNHibernate.Mapping;

namespace Biblioteca.NHibernate.Mapping
{
    public class EstanteMap : ClassMap<Estante>
    {
        public EstanteMap()
        {
            Table("tb_estante");
            Id(x => x.Id).Column("cod_estante").GeneratedBy.Native();
            Map(x => x.Categoria).Not.Nullable().Length(100);
            Map(x => x.Data_Criacao).Not.Nullable();
            HasMany(x => x.Prateleiras);
        }
    }
}
