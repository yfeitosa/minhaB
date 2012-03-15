﻿using Biblioteca.Dominio.Entidades;
using Biblioteca.Dominio.Repositorio;
using Biblioteca.NHibernate.NHibernateHelpers;
using System.Collections.Generic;

namespace Biblioteca.NHibernate.Repositorios
{
    public class PrateleiraRepositorio : Repositorio<Prateleira>, IPrateleiraRepositorio
    {
        public PrateleiraRepositorio(SessionProvider sessionProvider)
            : base(sessionProvider)
        {
        }
    }
}
