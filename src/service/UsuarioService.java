package service;

import dao.UsuarioDAO;

//comentario qualquer
import model.Usuario;

public class UsuarioService
	{
		UsuarioDAO dao = new UsuarioDAO();

		public void criar(Usuario usuario)
			{
				dao.criar(usuario);
			}

		public int atualizar(Usuario usuario)
			{
				return dao.atualizar(usuario);
			}

		public void excluir(Usuario usuario)
			{
				dao.excluir(usuario);
			}

		public Usuario carregar(int id)
			{
				return dao.carregar(id);
			}
		public int emailExistente(String email)
			{
				return dao.emailExistente(email);
			}
		
		public Usuario senhaExistente(String email)
		{
			 return dao.senhaExistente(email);
		} 
		
		public int atualizarSenha(Usuario usuario)
		   {
		   
		      return dao.atualizarSenha(usuario);
		   }
	}
