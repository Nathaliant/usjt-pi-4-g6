package service;

import java.util.ArrayList;

import model.Estabelecimento;
import dao.ListarEstabelecimentoDAO;

public class ListarEstabelecimentoService
{
	ListarEstabelecimentoDAO dao = new ListarEstabelecimentoDAO();

	public ArrayList<Estabelecimento> listarEstabelecimento()
	{
		return dao.listarEstabelecimento();
	}

	public ArrayList<Estabelecimento> listarEstabelecimento(String chave)
	{
		return dao.listarEstabelecimento(chave);

	}
}
