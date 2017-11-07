package model;

public class Avaliacao
	{
		int id;
		int notaAcessoCadeirante;
		int notaSanitarioCadeirante;
		int notaInstrucaoBraile;
		int notaSinalizacaoPiso;
		double notaGeral;
		String comentario;
		int id_Usuario;
		int id_Estabelecimento;
		int id_Categoria;
		Usuario usuario;
		
		
		
		public int getId()
			{
				return id;
			}
		public void setId(int id)
			{
				this.id = id;
			}
		public int getNotaAcessoCadeirante()
			{
				return notaAcessoCadeirante;
			}
		public void setNotaAcessoCadeirante(int notaAcessoCadeirante)
			{
				this.notaAcessoCadeirante = notaAcessoCadeirante;
			}
		public int getNotaSanitarioCadeirante()
			{
				return notaSanitarioCadeirante;
			}
		public void setNotaSanitarioCadeirante(int notaSanitarioCadeirante)
			{
				this.notaSanitarioCadeirante = notaSanitarioCadeirante;
			}
		public int getNotaInstrucaoBraile()
			{
				return notaInstrucaoBraile;
			}
		public void setNotaInstrucaoBraile(int notaInstrucaoBraile)
			{
				this.notaInstrucaoBraile = notaInstrucaoBraile;
			}
		public int getNotaSinalizacaoPiso()
			{
				return notaSinalizacaoPiso;
			}
		public void setNotaSinalizacaoPiso(int notaSinalizacaoPiso)
			{
				this.notaSinalizacaoPiso = notaSinalizacaoPiso;
			}
		public double getNotaGeral()
			{
				return notaGeral;
			}
		public void setNotaGeral(double d)
			{
				this.notaGeral = d;
			}
		public String getComentario()
			{
				return comentario;
			}
		public void setComentario(String comentario)
			{
				this.comentario = comentario;
			}
		
		public int getId_Usuario() {
			return id_Usuario;
		}
		public void setId_Usuario(int id_Usuario) {
			this.id_Usuario = id_Usuario;
		}
		public int getId_Estabelecimento() {
			return id_Estabelecimento;
		}
		public void setId_Estabelecimento(int id_Estabelecimento) {
			this.id_Estabelecimento = id_Estabelecimento;
		}	
		public int getId_Categoria() {
			return id_Categoria;
		}
		public void setId_Categoria(int id_Categoria) {
			this.id_Categoria = id_Categoria;
		}
		
		public void defineNotaGeral() {
			this.notaGeral = this.notaAcessoCadeirante+this.notaSanitarioCadeirante+this.notaInstrucaoBraile+this.notaSinalizacaoPiso;
			
		}
		
		
		public void setUsuario (int id, String nome, String sobrenome, String email,  String foto) {
			usuario = new Usuario(id, nome, sobrenome,email,foto);
		}
		
		public Usuario getUsuario() {
			return usuario;
		}

		
	}
