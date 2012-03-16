using Biblioteca.Dominio.Entidades;
using FluentNHibernate.Mapping;

namespace Biblioteca.NHibernate.Mapping
{
    public class PrateleiraMap : ClassMap<Prateleira>
    {
        public PrateleiraMap()
        {
            Table("tb_prateleira");
            Id(x => x.Id).Column("cod_prateleira").GeneratedBy.Native();
            Map(x => x.Classe).Not.Nullable().Length(100);
            Map(x => x.Data_Criacao).Not.Nullable().Length(100); 
            References(x => x.Estante);
            HasMany(x => x.Livros);
        }
    }
}