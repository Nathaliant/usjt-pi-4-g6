package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.*;

import model.Estabelecimento;
import service.EstabelecimentoService;

public class ListarEstabelecimentoBuscar implements Command
{

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String chave = request.getParameter("data[search]");
		EstabelecimentoService estabelecimento = new EstabelecimentoService();
		ArrayList<Estabelecimento> lista = null;
		HttpSession session = request.getSession();
		if (chave != null && chave.length() > 0)
		{
			lista = estabelecimento.listarEstabelecimento(chave);
		} else
		{
			lista = estabelecimento.listarEstabelecimento();
		} 	
		session.setAttribute("lista", lista);    
	    RequestDispatcher dispatcher = null;
        dispatcher = request.getRequestDispatcher("listar-estabelecimento.jsp");
        dispatcher.forward(request, response);
	}	
	String toJSON(ArrayList<Estabelecimento> lista) {
	    Gson gson = new Gson();
	    StringBuilder sb = new StringBuilder();
	    for(Estabelecimento e : lista) {
	        sb.append(gson.toJson(e));
	    }
	    return sb.toString();
	}
}