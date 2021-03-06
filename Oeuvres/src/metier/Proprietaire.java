package metier;

// Generated 12 mars 2013 16:04:39 by Hibernate Tools 4.0.0

import java.util.HashSet;
import java.util.Set;

/**
 * Proprietaire generated by hbm2java
 */
public class Proprietaire implements java.io.Serializable {

	private Integer idProprietaire;
	private String nomProprietaire;
	private String prenomProprietaire;
	private Set<Oeuvrepret> oeuvreprets = new HashSet<Oeuvrepret>(0);
	private Set<Oeuvrevente> oeuvreventes = new HashSet<Oeuvrevente>(0);

	public Proprietaire() {
	}

	public Proprietaire(String nomProprietaire) {
		this.nomProprietaire = nomProprietaire;
	}

	public Proprietaire(String nomProprietaire, String prenomProprietaire,
			Set<Oeuvrepret> oeuvreprets, Set<Oeuvrevente> oeuvreventes) {
		this.nomProprietaire = nomProprietaire;
		this.prenomProprietaire = prenomProprietaire;
		this.oeuvreprets = oeuvreprets;
		this.oeuvreventes = oeuvreventes;
	}

	public Integer getIdProprietaire() {
		return this.idProprietaire;
	}

	public void setIdProprietaire(Integer idProprietaire) {
		this.idProprietaire = idProprietaire;
	}

	public String getNomProprietaire() {
		return this.nomProprietaire;
	}

	public void setNomProprietaire(String nomProprietaire) {
		this.nomProprietaire = nomProprietaire;
	}

	public String getPrenomProprietaire() {
		return this.prenomProprietaire;
	}

	public void setPrenomProprietaire(String prenomProprietaire) {
		this.prenomProprietaire = prenomProprietaire;
	}

	public Set<Oeuvrepret> getOeuvreprets() {
		return this.oeuvreprets;
	}

	public void setOeuvreprets(Set<Oeuvrepret> oeuvreprets) {
		this.oeuvreprets = oeuvreprets;
	}

	public Set<Oeuvrevente> getOeuvreventes() {
		return this.oeuvreventes;
	}

	public void setOeuvreventes(Set<Oeuvrevente> oeuvreventes) {
		this.oeuvreventes = oeuvreventes;
	}

}
