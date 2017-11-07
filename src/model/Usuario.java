package model;


public class Usuario
	{
		
		int id;
		String nome;
		String sobrenome;
		String email;
		String senha;
		String foto;
		
		public Usuario() {
			
		}
		
		
		public Usuario(int id, String nome, String sobrenome, String email, String foto) {
			super();
			this.id = id;
			this.nome = nome;
			this.sobrenome = sobrenome;
			this.email = email;
			this.foto = foto;
		}
		
		
		
		public int getId()
			{
				return id;
			}
		public void setId(int id)
			{
				this.id = id;
			}
		public String getNome()
			{
				return nome;
			}
		public void setNome(String nome)
			{
				this.nome = nome;
			}
		public String getSobrenome()
			{
				return sobrenome;
			}
		public void setSobrenome(String sobrenome)
			{
				this.sobrenome = sobrenome;
			}
		public String getEmail()
			{
				return email;
			}
		public void setEmail(String email)
			{
				this.email = email;
			}
		public String getSenha()
			{
				return senha;
			}
		public void setSenha(String senha)
			{
				this.senha = senha;
			}
		public String getFoto()
			{
				return foto;
			}
		public void setFoto(String uFoto)
			{
				this.foto = uFoto;
			}
		@Override
		public String toString()
			{
				return "Usuario [id=" + id + ", nome=" + nome + ", sobrenome=" + sobrenome + ", email=" + email
						+ ", senha=" + senha + ", foto=" + foto + "]";
			} 		
	}
