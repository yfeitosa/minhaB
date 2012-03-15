using Biblioteca.Dominio.Entidades;
using FluentNHibernate.Mapping;

namespace Biblioteca.NHibernate.Mapping
{
    public class PrateleiraMap : ClassMap<Prateleira>
    {
        public PrateleiraMap()
        {
            Id(x => x.Id).Column("Id").GeneratedBy.Native();
            Map(x => x.Classe);
            Map(x => x.Data_Criacao);
            References(x => x.Estante);
            HasMany(x => x.Livros);
        }
    }
}