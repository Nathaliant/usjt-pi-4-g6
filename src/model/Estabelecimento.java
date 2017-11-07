package model;

public class Estabelecimento extends Categoria
{
	int id;
	String nome;
	String endereco;
	float lat; // latitude
	float lng; // longitude
	Categoria categoria = new Categoria();
	String horario;
	String telefone;
	String email;
	String site;

	public Estabelecimento()
	{

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

	public String getEndereco()
	{
		return endereco;
	}

	public void setEndereco(String endereco)
	{
		this.endereco = endereco;
	}

	public float getLat()
	{
		return lat;
	}

	public void setLat(float lat)
	{
		this.lat = lat;
	}

	public float getLng()
	{
		return lng;
	}

	public void setLng(float lng)
	{
		this.lng = lng;
	}

	public Categoria getCategoria()
	{
		return categoria;
	}

	public void setCategoria(Categoria categoria)
	{
		this.categoria = categoria;
	}

	public String getHorario()
	{
		return horario;
	}

	public void setHorario(String horario)
	{
		this.horario = horario;
	}

	public String getTelefone()
	{
		return telefone;
	}

	public void setTelefone(String telefone)
	{
		this.telefone = telefone;
	}

	public String getSite()
	{
		return site;
	}

	public void setSite(String site)
	{
		this.site = site;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public int getIdCategoria()
	{

		return categoria.getId();
	}

	public void setIdCategoria(int id)
	{
		this.categoria.setId(id);
	}

}
