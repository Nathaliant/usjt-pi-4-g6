package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.ListarAvaliacaoService;
import service.EstabelecimentoService;
import model.Avaliacao;
import model.Estabelecimento;

public class ListarAvaliacoesPorEstabelecimento implements Command
{

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");

		int idEstabelecimento = Integer.parseInt(request.getParameter("id"));
		Estabelecimento estabelecimento;
		EstabelecimentoService eS = new EstabelecimentoService();
		ListarAvaliacaoService lAS = new ListarAvaliacaoService();
		ArrayList<Avaliacao> lista = null;
		HttpSession session = request.getSession();
		estabelecimento = eS.carregar(idEstabelecimento);
		session.setAttribute("estabelecimento", estabelecimento);
		lista = lAS.listarAvaliacao(idEstabelecimento);
		session.setAttribute("lista", lista);

		RequestDispatcher dispatcher = request.getRequestDispatcher("ListarAvaliacoes.jsp");
		dispatcher.forward(request, response);

	}

}
