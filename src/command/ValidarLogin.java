package command;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Usuario;
import service.UsuarioService;

public class ValidarLogin implements Command
{

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		String uEmail = request.getParameter("email");
		String uSenha = request.getParameter("senha");

		// instanciar o javabean
		Usuario usuario = new Usuario();
		usuario.setEmail(uEmail);

		// Instancia um usu�rio service
		UsuarioService us = new UsuarioService();

		int emailExistente = us.emailExistente(uEmail);

		if (emailExistente == 0)
		{
			retornaRequest(request, response, "Usu�rio n�o encontrado.", usuario, "login.jsp");
		} else if (emailExistente == 1)
		{
			usuario = us.senhaExistente(uEmail);
			String senhaExistente = usuario.getSenha();

			if (senhaExistente.equals(uSenha))
			{
				HttpSession session = request.getSession();
				session.setAttribute("usuario", usuario);
				System.out.println("foi");

				retornaRequest(request, response, "Efetuando login.", usuario, "index.jsp");

			} else if (senhaExistente != uSenha)
			{
				retornaRequest(request, response, "Senha inv�lida.", usuario, "login.jsp");
			} else
			{
				retornaRequest(request, response, "Ocorreu um erro.", usuario, "login.jsp");
			}
		}

		else
		{
			// retona uma mensagem de erro generica.
			retornaRequest(request, response, "Ocorreu um erro.", usuario, "login.jsp");
		}

	}

	protected void retornaRequest(HttpServletRequest request, HttpServletResponse response, String erro,
			Usuario usuario, String url) throws ServletException, IOException
	{
		if (!erro.isEmpty())
		{
			request.setAttribute("mensagem", erro);
		}

		request.setAttribute("usuario", usuario);
		RequestDispatcher viewErro = request.getRequestDispatcher(url);
		viewErro.forward(request, response);

	}

}
