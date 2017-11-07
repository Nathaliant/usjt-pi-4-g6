package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.EstabelecimentoService;
import model.Estabelecimento;

public class ListarEstabelecimento implements Command
{

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		//
		String chave = request.getParameter("data[search]");
		String acao = request.getParameter("acao");
		EstabelecimentoService estabelecimento = new EstabelecimentoService();
		ArrayList<Estabelecimento> lista = null;
		HttpSession session = request.getSession();
		if (acao.equals("buscar"))
		{
			if (chave != null && chave.length() > 0)
			{
				lista = estabelecimento.listarEstabelecimento(chave);
			} else
			{
				lista = estabelecimento.listarEstabelecimento();
			}
			session.setAttribute("lista", lista);
		} else if (acao.equals("reiniciar"))
		{
			session.setAttribute("lista", null);
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("ListarEstabelecimento.jsp");
		dispatcher.forward(request, response);

	}

}
