package service;

import java.util.ArrayList;

import dao.EstabelecimentoDAO;
import model.Estabelecimento;

public class EstabelecimentoService
{
	EstabelecimentoDAO dao = new EstabelecimentoDAO();

	public EstabelecimentoService()
	{
		dao = new EstabelecimentoDAO();
	}

	public Estabelecimento criar(Estabelecimento estabelecimento)
	{
		dao.criar(estabelecimento);
		return estabelecimento;
	}

	public void atualizar(Estabelecimento estabelecimento)
	{
		dao.atualizar(estabelecimento);
	}

	public void excluir(Estabelecimento estabelecimento)
	{
		dao.excluir(estabelecimento);
	}

	public Estabelecimento carregar(int id)
	{
		return dao.carregar(id);
	}

	public ArrayList<Estabelecimento> listarEstabelecimento()
	{
		return dao.listarEstabelecimento();
	}

	public ArrayList<Estabelecimento> listarEstabelecimento(String chave)
	{
		return dao.listarEstabelecimento(chave);

	}

	public int retornaIdCategoria(int idEstabelecimento)
	{
		return dao.retornaIdCategoria(idEstabelecimento);
	}
}
