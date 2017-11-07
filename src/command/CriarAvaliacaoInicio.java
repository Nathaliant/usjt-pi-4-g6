package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Avaliacao;
import service.AvaliacaoService;

public class CriarAvaliacaoInicio implements Command
{

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// String aId = request.getParameter("eId");
		/*
		 * int aNotaAcessoCadeirante =
		 * Integer.parseInt(request.getParameter("aNotaAcessoCadeirante")); int
		 * aNotaSanitarioCadeirante =
		 * Integer.parseInt(request.getParameter("aNotaSanitarioCadeirante")); int
		 * aNotaInstrucaoBraile =
		 * Integer.parseInt(request.getParameter("aNotaInstrucaoBraile")); int
		 * aNotaSinalizacaoPiso =
		 * Integer.parseInt(request.getParameter("aNotaSinalizacaoPiso")); String
		 * aComentario = request.getParameter("aComentario"); int id = -1;
		 * 
		 * 
		 * try { id = Integer.parseInt(aId); } catch (NumberFormatException e) {
		 * 
		 * }
		 */

		// dados extras ESTABELECIMENTO
		int eId = Integer.parseInt(request.getParameter("eId"));

		// dados extras USUARIO
		int uId = 1;
		// int uId=Integer.parseInt(request.getParameter("uId"));

		// dados extras CAtegoria
		int cId = 2;
		// int cId=Integer.parseInt(request.getParameter("cId"));

		Avaliacao avaliacao = new Avaliacao();
		// avaliacao.setId(aId);
		// avaliacao.setNotaAcessoCadeirante(aNotaAcessoCadeirante);
		// avaliacao.setNotaSanitarioCadeirante(aNotaSanitarioCadeirante);
		// avaliacao.setNotaInstrucaoBraile(aNotaInstrucaoBraile);
		// avaliacao.setNotaSinalizacaoPiso(aNotaSinalizacaoPiso);
		// avaliacao.setComentario(aComentario );
		avaliacao.setId_Estabelecimento(eId);
		avaliacao.setId_Usuario(uId);
		avaliacao.setId_Categoria(cId);

		// AvaliacaoService as = new AvaliacaoService();

		RequestDispatcher view = null;
		HttpSession session = request.getSession();

		// as.criar(avaliacao);
		// ArrayList<Avaliacao> lista = new ArrayList<>();
		// lista.add(avaliacao);
		session.setAttribute("avaliacao", avaliacao);
		view = request.getRequestDispatcher("avaliar.jsp");

		view.forward(request, response);

	}

	public int busca(Avaliacao avaliacao, ArrayList<Avaliacao> lista)
	{
		Avaliacao to;
		for (int i = 0; i < lista.size(); i++)
		{
			to = lista.get(i);
			if (to.getId() == avaliacao.getId())
			{
				return i;
			}
		}
		return -1;
	}

}
