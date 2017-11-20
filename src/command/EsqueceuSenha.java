package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Usuario;
import service.UsuarioService;

import java.util.Properties;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.util.Random;

import model.Usuario;
import service.UsuarioService;

public class EsqueceuSenha implements Command{

	private static String gerarSenhaAleatoria() {
        int qtdeMaximaCaracteres = 8;
        String[] caracteres = { "a", "1", "b", "2", "4", "5", "6", "7", "8",
                "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
                "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w",
                "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I",
                "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U",
                "V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "@", "#", "%", "&"};
       
        StringBuilder senha = new StringBuilder();

        for (int i = 0; i < qtdeMaximaCaracteres; i++) {
            int posicao = (int) (Math.random() * caracteres.length);
            senha.append(caracteres[posicao]);
        }
        return senha.toString();
    }
	

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
	
		
		request.setCharacterEncoding("UTF-8");
		String uEmail = request.getParameter("email");

		Usuario usuario = new Usuario();
		usuario.setEmail(uEmail);

		// Instancia um usuário service
		UsuarioService us = new UsuarioService();
		
		
		
		int emailExistente = us.emailExistente(uEmail);

		if (emailExistente == 0)
		{
			retornaRequest(request, response, "Usuário não encontrado.", usuario, "esqueceu-senha.jsp");
		} else if (emailExistente == 1)
		{
			
			Properties props = new Properties();
		      /** Parâmetros de conexão com servidor Gmail */
		      props.put("mail.smtp.host", "smtp.gmail.com");
		      props.put("mail.smtp.socketFactory.port", "465");
		      props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		      props.put("mail.smtp.auth", "true");
		      props.put("mail.smtp.port", "465");
		   
		      Session session = Session.getDefaultInstance(props,
		                        new javax.mail.Authenticator() {
		                           protected PasswordAuthentication getPasswordAuthentication() 
		                           {
		                              return new PasswordAuthentication("ssu.usjt@gmail.com", "usjt12345");
		                           }
		                        });
		      /** Ativa Debug para sessão */
		      //session.setDebug(true);
		      try {
		    	  
		    	  
		    	  String senha = gerarSenhaAleatoria();
		    	  
		         Message message = new MimeMessage(session);
		         message.setFrom(new InternetAddress("ssu.usjt@gmail.com")); //Remetente
		      
		         Address[] toUser = InternetAddress //Destinatário(s)
		                 .parse(uEmail);  
		         message.setRecipients(Message.RecipientType.TO, toUser);
		         message.setSubject("Sem Barreiras - Esqueci a senha");//Assunto
		         message.setText("Olá, \nEssa é sua nova senha de acesso ao Sem Barreiras, esperamos que continue nos ajudando a avaliar os estabelecimentos. \nNova senha:  " + senha);
		         /**Método para enviar a mensagem criada*/
		         Transport.send(message);
        
		         
		         usuario.setSenha(senha);
		         
		         
		         int result = us.atualizarSenha(usuario);
		         HttpSession session1 = request.getSession();
		         
		        
		         
		         if (result == 0)
		 		{
		 			session1.setAttribute("usuario", usuario);
		 			session1.setAttribute("mensagem", "Senha alterada.");
		 		} else
		 		{
		 			session1.setAttribute("mensagem", "Ocorreu um erro.");
		 		}
		         
		         
		      } 
		      catch (MessagingException e) {
		         throw new RuntimeException(e);
		      }

		}

		else
		{
			// retona uma mensagem de erro generica.
			retornaRequest(request, response, "Ocorreu um erro.", usuario, "esqueceu-senha.jsp");
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
