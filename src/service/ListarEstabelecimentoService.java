package service;

import java.util.ArrayList;

import model.Estabelecimento;
import dao.EstabelecimentoDAO;

public class ListarEstabelecimentoService
{
	EstabelecimentoDAO dao = new EstabelecimentoDAO();

	public ArrayList<Estabelecimento> listarEstabelecimento()
	{
		return dao.listarEstabelecimento();
	}

	public ArrayList<Estabelecimento> listarEstabelecimento(String chave)
	{
		return dao.listarEstabelecimento(chave);

	}
}
