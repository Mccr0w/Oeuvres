package metier;

// Generated 12 mars 2013 16:04:39 by Hibernate Tools 4.0.0

import java.util.HashSet;
import java.util.Set;

/**
 * Oeuvrevente generated by hbm2java
 */
public class Oeuvrevente implements java.io.Serializable {

	private Integer idOeuvrevente;
	private Proprietaire proprietaire;
	private String titreOeuvrevente;
	private String etatOeuvrevente;
	private float prixOeuvrevente;
	private Set<Reservation> reservations = new HashSet<Reservation>(0);

	public Oeuvrevente() {
	}

	public Oeuvrevente(String titreOeuvrevente, String etatOeuvrevente,
			float prixOeuvrevente) {
		this.titreOeuvrevente = titreOeuvrevente;
		this.etatOeuvrevente = etatOeuvrevente;
		this.prixOeuvrevente = prixOeuvrevente;
	}

	public Oeuvrevente(Proprietaire proprietaire, String titreOeuvrevente,
			String etatOeuvrevente, float prixOeuvrevente,
			Set<Reservation> reservations) {
		this.proprietaire = proprietaire;
		this.titreOeuvrevente = titreOeuvrevente;
		this.etatOeuvrevente = etatOeuvrevente;
		this.prixOeuvrevente = prixOeuvrevente;
		this.reservations = reservations;
	}

	public Integer getIdOeuvrevente() {
		return this.idOeuvrevente;
	}

	public void setIdOeuvrevente(Integer idOeuvrevente) {
		this.idOeuvrevente = idOeuvrevente;
	}

	public Proprietaire getProprietaire() {
		return this.proprietaire;
	}

	public void setProprietaire(Proprietaire proprietaire) {
		this.proprietaire = proprietaire;
	}

	public String getTitreOeuvrevente() {
		return this.titreOeuvrevente;
	}

	public void setTitreOeuvrevente(String titreOeuvrevente) {
		this.titreOeuvrevente = titreOeuvrevente;
	}

	public String getEtatOeuvrevente() {
		return this.etatOeuvrevente;
	}

	public void setEtatOeuvrevente(String etatOeuvrevente) {
		this.etatOeuvrevente = etatOeuvrevente;
	}

	public float getPrixOeuvrevente() {
		return this.prixOeuvrevente;
	}

	public void setPrixOeuvrevente(float prixOeuvrevente) {
		this.prixOeuvrevente = prixOeuvrevente;
	}

	public Set<Reservation> getReservations() {
		return this.reservations;
	}

	public void setReservations(Set<Reservation> reservations) {
		this.reservations = reservations;
	}

}
