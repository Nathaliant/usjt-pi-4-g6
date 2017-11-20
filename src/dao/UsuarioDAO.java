package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Usuario;

public class UsuarioDAO
{

	public void criar(Usuario usuario)
	{
		String sqlInsert = "INSERT INTO tbl_usuario(nome, sobrenome, email, senha, foto_perfil) VALUES (?, ?, ?, ?, ?)";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlInsert);)
		{
			stm.setString(1, usuario.getNome());
			stm.setString(2, usuario.getSobrenome());
			stm.setString(3, usuario.getEmail());
			stm.setString(4, usuario.getSenha());
			stm.setString(5, usuario.getFoto());
			stm.execute();
			String sqlQuery = "SELECT LAST_INSERT_ID()";
			try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery); ResultSet rs = stm2.executeQuery();)
			{
				if (rs.next())
				{
					usuario.setId(rs.getInt(1));
				}
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
	}

	public int atualizar(Usuario usuario)
	{
		String sqlUpdate = "UPDATE tbl_usuario SET nome=?, sobrenome=?, email=?, senha=?, foto_perfil=? WHERE id_usuario=?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlUpdate);)
		{
			stm.setString(1, usuario.getNome());
			stm.setString(2, usuario.getSobrenome());
			stm.setString(3, usuario.getEmail());
			stm.setString(4, usuario.getSenha());
			stm.setString(5, usuario.getFoto());
			stm.setInt(6, usuario.getId());
			stm.executeUpdate();
			if (stm.executeUpdate() > 0)
			{
				return 0;
			} else
			{
				return 1;
			}

		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return -1;
	}

	public void excluir(Usuario usuario)
	{
		String sqlDelete = "DELETE FROM tbl_usuario WHERE id_usuario = ?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlDelete);)
		{
			stm.setInt(1, usuario.getId());
			stm.execute();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	public Usuario carregar(int id)
	{
		Usuario usuario = new Usuario();
		usuario.setId(id);
		String sqlSelect = "SELECT nome, sobrenome, email, senha FROM tbl_usuario WHERE usuario.id_usuario = ?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);)
		{
			stm.setInt(1, usuario.getId());
			try (ResultSet rs = stm.executeQuery();)
			{
				if (rs.next())
				{
					usuario.setNome(rs.getString("nome"));
					usuario.setSobrenome(rs.getString("sobrenome"));
					usuario.setEmail(rs.getString("email"));
					usuario.setSenha(rs.getString("senha"));
				} else
				{
					usuario.setId(-1);
					usuario.setNome(null);
					usuario.setSobrenome(null);
					usuario.setEmail(null);
					usuario.setSenha(null);
				}
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
		} catch (SQLException e1)
		{
			System.out.print(e1.getStackTrace());
		}
		return usuario;
	}

	public int emailExistente(String email)
	{
		Usuario usuario = new Usuario();
		usuario.setEmail(email);
		String sqlSelect = "SELECT email FROM tbl_usuario WHERE email = ?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);)
		{
			stm.setString(1, usuario.getEmail());
			try (ResultSet rs = stm.executeQuery();)
			{
				if (rs.next())
				{
					return 1;
				} else
				{
					return 0;
				}
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
		} catch (SQLException e1)
		{
			System.out.print(e1.getStackTrace());
		}
		return -1;
	}

	public Usuario senhaExistente(String email)
	{
		Usuario usuario = new Usuario();
		usuario.setEmail(email);
		String sqlSelect = "SELECT id_usuario, nome, sobrenome, email, senha, foto_perfil FROM tbl_usuario WHERE email = ?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);)
		{
			stm.setString(1, usuario.getEmail());
			try (ResultSet rs = stm.executeQuery();)
			{
				if (rs.next())
				{
					usuario.setId(rs.getInt("id_usuario"));
					usuario.setNome(rs.getString("nome"));
					usuario.setSobrenome(rs.getString("sobrenome"));
					usuario.setEmail(rs.getString("email"));
					usuario.setSenha(rs.getString("senha"));
					usuario.setFoto(rs.getString("foto_perfil"));

				} else
				{
					usuario.setId(-1);
					usuario.setNome(null);
					usuario.setSobrenome(null);
					usuario.setEmail(null);
					usuario.setSenha(null);
					usuario.setFoto(rs.getString(null));
				}
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
		} catch (SQLException e1)
		{
			System.out.print(e1.getStackTrace());
		}
		return usuario;
	}
	
	
	public int atualizarSenha(Usuario usuario)
	   {
	      String sqlUpdate = "UPDATE tbl_usuario SET senha=? WHERE email=?";
	      try (Connection conn = ConnectionFactory.obtemConexao();
	      		PreparedStatement stm = conn.prepareStatement(sqlUpdate);)
	      {
	         stm.setString(1, usuario.getSenha());
	         stm.setString(2, usuario.getEmail());
	         stm.executeUpdate();
	         if (stm.executeUpdate() > 0)
	         {
	            return 0;
	         } 
	         else
	         {
	            return 1;
	         }
	      
	      } 
	      catch (Exception e)
	      {
	         e.printStackTrace();
	      }
	      return -1;
	   }

}
