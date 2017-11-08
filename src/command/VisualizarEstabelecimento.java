package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Estabelecimento;
import service.EstabelecimentoService;

public class VisualizarEstabelecimento implements Command
{

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		String vId = request.getParameter("id");
		String vNome = request.getParameter("nome");
		String vEndereco = request.getParameter("endereco");
		String vHorario = request.getParameter("horario");
		String vTelefone = request.getParameter("telefone");
		String vEmail = request.getParameter("email");
		String vSite = request.getParameter("site");

		int id = -1;
		try
		{
			id = Integer.parseInt(vId);
		} catch (NumberFormatException e)
		{

		}

		Estabelecimento estabelecimento = new Estabelecimento();
		estabelecimento.setId(id);
		estabelecimento.setNome(vNome);
		estabelecimento.setEndereco(vEndereco);
		estabelecimento.setHorario(vHorario);
		estabelecimento.setTelefone(vTelefone);
		estabelecimento.setEmail(vEmail);
		estabelecimento.setSite(vSite);
		EstabelecimentoService cs = new EstabelecimentoService();

		RequestDispatcher view = null;

		estabelecimento = cs.carregar(estabelecimento.getId());
		request.setAttribute("estabelecimento", estabelecimento);
		view = request.getRequestDispatcher("VisualizarEstabelecimento.jsp");

		view.forward(request, response);

	}

}
