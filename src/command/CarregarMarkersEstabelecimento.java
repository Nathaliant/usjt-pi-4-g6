package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.Estabelecimento;
import service.EstabelecimentoService;

public class CarregarMarkersEstabelecimento implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		EstabelecimentoService es = new EstabelecimentoService();
		ArrayList<Estabelecimento> lista = null;
		lista = es.listarEstabelecimento();
		ArrayList<String> res = new ArrayList<String>();
		for (Estabelecimento e : lista) {
            String jsonObject = "{"
    				+ "\"id\":  \"" + e.getId() + "\", "
    				+ "\"nome\": \"" + e.getNome() + "\", "
    				+ "\"endereco\": \"" + e.getEndereco() + "\", "
    				+ "\"lat\": \"" + e.getLat() + "\", "
    				+ "\"lng\": \"" + e.getLng() + "\"}";
            res.add(jsonObject);
        }
		String json = new Gson().toJson(res);
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write(json);
		request.getRequestDispatcher("index.jsp");
		

	}

}
