package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Avaliacao;

public class ListarAvaliacaoDAO {

	
	public ArrayList<Avaliacao> listarAvaliacaoPorEstabelecimento(int idEstabelecimento){
		ArrayList<Avaliacao> avaliacoes = new ArrayList<>();
		String sqlSelect ="select  tbl_avaliacao.id_avaliacao, tbl_avaliacao.nota_acesso_cadeirante, tbl_avaliacao.nota_sanitario_cadeirante, tbl_avaliacao.nota_instrucao_braile,tbl_avaliacao.nota_sinalizacao_piso, tbl_avaliacao.media_nota, tbl_avaliacao.comentario,tbl_usuario.id_usuario, tbl_usuario.nome, tbl_usuario.sobrenome, tbl_usuario.email, tbl_usuario.foto_perfil from ((tbl_avaliacao inner join tbl_estabelecimento on tbl_avaliacao.tbl_estabelecimento_id_estabelecimento = tbl_estabelecimento.id_estabelecimento) inner join tbl_usuario on tbl_avaliacao.tbl_usuario_Id_usuario = tbl_usuario.id_usuario) where tbl_estabelecimento.id_estabelecimento=?";
		Avaliacao avaliacao;
		
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
				stm.setInt(1, idEstabelecimento);
				try(ResultSet rs = stm.executeQuery();) {
					while(rs.next()) {
						avaliacao = new Avaliacao();
						avaliacao.setId(rs.getInt("tbl_avaliacao.id_avaliacao"));
						avaliacao.setNotaAcessoCadeirante(rs.getInt("tbl_avaliacao.nota_acesso_cadeirante"));
						avaliacao.setNotaSanitarioCadeirante(rs.getInt("tbl_avaliacao.nota_sanitario_cadeirante"));
						avaliacao.setNotaInstrucaoBraile(rs.getInt("tbl_avaliacao.nota_instrucao_braile"));
						avaliacao.setNotaSinalizacaoPiso(rs.getInt("tbl_avaliacao.nota_sinalizacao_piso"));
						avaliacao.setNotaGeral(rs.getDouble("tbl_avaliacao.media_nota"));
						avaliacao.setComentario(rs.getString("tbl_avaliacao.comentario"));
						avaliacao.setUsuario(rs.getInt("tbl_usuario.id_usuario"),rs.getString("tbl_usuario.nome"),rs.getString("tbl_usuario.sobrenome"), rs.getString("tbl_usuario.email"), rs.getString("tbl_usuario.foto_perfil"));
						avaliacoes.add(avaliacao);
					}
				
				} catch (SQLException e1){
					System.out.print(e1.getStackTrace());
				}	
			
		} catch (SQLException e) {
			System.out.print(e.getStackTrace());
		}
		return avaliacoes;
			
	}
	
	
}
