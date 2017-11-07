package service;

import java.util.ArrayList;

import model.Avaliacao;
import dao.ListarAvaliacaoDAO;

public class ListarAvaliacaoService {
	ListarAvaliacaoDAO dao = new ListarAvaliacaoDAO();
	
	public ArrayList<Avaliacao> listarAvaliacao(int idEstabelecimento){
		return dao.listarAvaliacaoPorEstabelecimento(idEstabelecimento);
	}
	
	
	
}
