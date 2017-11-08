package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Avaliacao;
import model.Estabelecimento;

public class EstabelecimentoDAO
{

	public Estabelecimento criar(Estabelecimento estabelecimento)
	{
		String sqlInsert = "INSERT INTO tbl_estabelecimento(nome, endereco, lat, lng, horario_funcionamento, telefone, email, site,tbl_categoria_id_categoria ) "
				+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlInsert);)
		{
			stm.setString(1, estabelecimento.getNome());
			stm.setString(2, estabelecimento.getEndereco());
			stm.setFloat(3, estabelecimento.getLat());
			stm.setFloat(4, estabelecimento.getLng());
			stm.setString(5, estabelecimento.getHorario());
			stm.setString(6, estabelecimento.getTelefone());
			stm.setString(7, estabelecimento.getEmail());
			stm.setString(8, estabelecimento.getSite());
			stm.setInt(9, estabelecimento.getIdCategoria());

			stm.execute();
			String sqlQuery = "SELECT LAST_INSERT_ID()";
			try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery); ResultSet rs = stm2.executeQuery();)
			{
				if (rs.next())
				{
					estabelecimento.setId(rs.getInt(1));
				}
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		
		return estabelecimento;
	}

	public void atualizar(Estabelecimento estabelecimento)
	{
		String sqlUpdate = "UPDATE tbl_estabelecimento SET nome=?, endereco=?, lat=?, lng=? horario_funcionamento=?, telefone=?, email=?, site=?, tbl_categoria_id_categoria=?  WHERE id_estabelecimento=?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlUpdate);)
		{
			stm.setString(1, estabelecimento.getNome());
			stm.setString(2, estabelecimento.getEndereco());
			stm.setFloat(3, estabelecimento.getLat());
			stm.setFloat(4, estabelecimento.getLng());
			stm.setString(5, estabelecimento.getHorario());
			stm.setString(6, estabelecimento.getTelefone());
			stm.setString(7, estabelecimento.getEmail());
			stm.setString(8, estabelecimento.getSite());
			stm.setInt(9, estabelecimento.getIdCategoria());
			stm.setInt(10, estabelecimento.getId());
			stm.execute();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	public void excluir(Estabelecimento estabelecimento)
	{
		String sqlDelete = "DELETE FROM tbl_estabelecimento WHERE id_estabelecimento = ?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlDelete);)
		{
			stm.setInt(1, estabelecimento.getId());
			stm.execute();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	public Estabelecimento carregar(int id)
	{
		Estabelecimento estabelecimento = new Estabelecimento();
		estabelecimento.setId(id);
		String sqlSelect = "SELECT nome, endereco, lat, lng, horario_funcionamento, telefone, email, site, tbl_categoria_id_categoria FROM tbl_estabelecimento WHERE tbl_estabelecimento.id_estabelecimento = ?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);)
		{
			stm.setInt(1, estabelecimento.getId());
			try (ResultSet rs = stm.executeQuery();)
			{
				if (rs.next())
				{
					estabelecimento.setNome(rs.getString("nome"));
					estabelecimento.setEndereco(rs.getString("endereco"));
					estabelecimento.setLat(rs.getFloat("lat"));
					estabelecimento.setLng(rs.getFloat("lng"));
					estabelecimento.setHorario(rs.getString("horario_funcionamento"));
					estabelecimento.setTelefone(rs.getString("telefone"));
					estabelecimento.setEmail(rs.getString("email"));
					estabelecimento.setSite(rs.getString("site"));
					estabelecimento.setIdCategoria(rs.getInt("tbl_categoria_id_categoria"));

				} else
				{
					estabelecimento.setId(-1);
					estabelecimento.setNome(null);
					estabelecimento.setEndereco(null);
					estabelecimento.setLat(-1);
					estabelecimento.setLng(-1);
					estabelecimento.setHorario(null);
					estabelecimento.setTelefone(null);
					estabelecimento.setEmail(null);
					estabelecimento.setSite(null);
					estabelecimento.setIdCategoria(-1);
				}
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
		} catch (SQLException e1)
		{
			System.out.print(e1.getStackTrace());
		}
		return estabelecimento;
	}

	public ArrayList<Estabelecimento> listarEstabelecimento()
	{
		Estabelecimento estabelecimento;

		ArrayList<Estabelecimento> lista = new ArrayList<>();
		String sqlSelect = "SELECT id_estabelecimento, nome, endereco, horario_funcionamento, telefone, email, site from tbl_estabelecimento";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);)
		{
			try (ResultSet rs = stm.executeQuery();)
			{
				while (rs.next())
				{
					estabelecimento = new Estabelecimento();
					estabelecimento.setId(rs.getInt("id_estabelecimento"));
					estabelecimento.setNome(rs.getString("nome"));
					estabelecimento.setEndereco(rs.getString("endereco"));
					estabelecimento.setHorario(rs.getString("horario_funcionamento"));
					estabelecimento.setTelefone(rs.getString("telefone"));
					estabelecimento.setSite(rs.getString("site"));
					// estabelecimento.setIdCategoria(rs.getInt("categoria"));

					lista.add(estabelecimento);
				}
			} catch (SQLException e1)
			{
				e1.printStackTrace();
			}
		} catch (SQLException e1)
		{
			System.out.print(e1.getStackTrace());
		}
		return lista;
	}

	public ArrayList<Estabelecimento> listarEstabelecimento(String chave)
	{
		Estabelecimento estabelecimento;
		ArrayList<Estabelecimento> lista = new ArrayList<>();
		String sqlSelect = "SELECT id_estabelecimento, nome, endereco, horario_funcionamento, telefone, email, site from tbl_estabelecimento where upper(nome) like ?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);)
		{
			stm.setString(1, "%" + chave.toUpperCase() + "%");
			try (ResultSet rs = stm.executeQuery();)
			{
				while (rs.next())
				{
					estabelecimento = new Estabelecimento();
					estabelecimento.setId(rs.getInt("id_estabelecimento"));
					estabelecimento.setNome(rs.getString("nome"));
					estabelecimento.setEndereco(rs.getString("endereco"));
					estabelecimento.setHorario(rs.getString("horario_funcionamento"));
					estabelecimento.setTelefone(rs.getString("telefone"));
					estabelecimento.setSite(rs.getString("site"));
					// estabelecimento.setIdCategoria(rs.getInt("categoria"));
					lista.add(estabelecimento);
				}
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
		} catch (SQLException e1)
		{
			System.out.print(e1.getStackTrace());
		}
		return lista;
	}

	public int retornaIdCategoria(int idEstabelecimento)
	{
		Estabelecimento estabelecimento = new Estabelecimento();
		estabelecimento.setId(idEstabelecimento);
		String sqlSelect = "select tbl_categoria_id_categoria from tbl_estabelecimento where id_estabelecimento = ?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);)
		{
			stm.setInt(1, estabelecimento.getId());
			try (ResultSet rs = stm.executeQuery();)
			{
				if (rs.next())
				{
					estabelecimento.setIdCategoria(rs.getInt("tbl_categoria_id_categoria"));

				} else
				{
					estabelecimento.setIdCategoria(-1);
				}
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
		} catch (SQLException e1)
		{
			System.out.print(e1.getStackTrace());
		}
		return estabelecimento.getIdCategoria();

	}

}
