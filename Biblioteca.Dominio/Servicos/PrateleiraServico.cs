﻿using System;
using System.Collections.Generic;
using Biblioteca.Dominio.Entidades;
using Biblioteca.Dominio.Repositorio;

namespace Biblioteca.Dominio.Servicos
{
    public class PrateleiraServico
    {
        private readonly IPrateleiraRepositorio _prateleiraDAO;

        public PrateleiraServico(IPrateleiraRepositorio prateleiraDAO)
        {
            _prateleiraDAO = prateleiraDAO;
        }

        public IList<Prateleira> PesquisarTodos()
        {
            return _prateleiraDAO.GetAll();
        }

        public Prateleira Pesquisar(int id)
        {
            return _prateleiraDAO.Get(id);
        }
    }
}