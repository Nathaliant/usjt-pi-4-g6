package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Avaliacao;
import model.Usuario;
import service.AvaliacaoService;
import service.EstabelecimentoService;

public class CriarAvaliacao implements Command
{

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		// service estabelecimento
		EstabelecimentoService es = new EstabelecimentoService();
		request.setCharacterEncoding("UTF-8");
		// dados da avaliacão
		String aId = request.getParameter("aId");
		String aNotaAcessoCadeirante = request.getParameter("aNotaAcessoCadeirante");
		String aNotaSanitarioCadeirante = request.getParameter("aNotaSanitarioCadeirante");
		String aNotaInstrucaoBraile = request.getParameter("aNotaInstrucaoBraile");
		String aNotaSinalizacaoPiso = request.getParameter("aNotaSinalizacaoPiso");
		// String aNotaGeral = request.getParameter("aNotaGeral");
		String aComentario = request.getParameter("aComentario");
		int id = -1;
		try
		{
			id = Integer.parseInt(aId);
		} catch (NumberFormatException e)
		{

		}
		// abre a session
		HttpSession session = request.getSession();

		// dados extras ESTABELECIMENTO
		int eId = Integer.parseInt(request.getParameter("eId"));

		// dados extras USUARIO
		Usuario usuario = (Usuario) session.getAttribute("usuario");
		int uId = usuario.getId();

		// dados extras USUARIO
		int cId = es.retornaIdCategoria(eId);

		// Instanciando o JavaBean Avaliacao

		Avaliacao avaliacao = new Avaliacao();
		avaliacao.setId(id);
		avaliacao.setNotaAcessoCadeirante(Integer.parseInt(aNotaAcessoCadeirante));
		avaliacao.setNotaSanitarioCadeirante(Integer.parseInt(aNotaSanitarioCadeirante));
		avaliacao.setNotaInstrucaoBraile(Integer.parseInt(aNotaInstrucaoBraile));
		avaliacao.setNotaSinalizacaoPiso(Integer.parseInt(aNotaSinalizacaoPiso));
		// avaliacao.setNotaGeral(Double.parseDouble(aNotaGeral));
		avaliacao.setComentario(aComentario);
		avaliacao.setId_Estabelecimento(eId);
		avaliacao.setId_Usuario(uId);
		avaliacao.setId_Categoria(cId);

		// Instanciando o service
		AvaliacaoService as = new AvaliacaoService();
		RequestDispatcher view = null;

		double media = avaliacao.getNotaAcessoCadeirante() + avaliacao.getNotaInstrucaoBraile()
				+ avaliacao.getNotaSanitarioCadeirante() + avaliacao.getNotaSinalizacaoPiso();
		media = media / 4;
		avaliacao.setNotaGeral(media);
		as.criar(avaliacao);
		ArrayList<Avaliacao> lista = new ArrayList<>();
		lista.add(avaliacao);

		session.setAttribute("avaliacao", avaliacao);
		view = request.getRequestDispatcher("index.jsp");

		view.forward(request, response);
	}

}
