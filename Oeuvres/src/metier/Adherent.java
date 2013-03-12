package metier;

// Generated 12 mars 2013 16:04:39 by Hibernate Tools 4.0.0

import java.util.HashSet;
import java.util.Set;

/**
 * Adherent generated by hbm2java
 */
public class Adherent implements java.io.Serializable {

	private Integer idAdherent;
	private String nomAdherent;
	private String prenomAdherent;
	private Set<Reservation> reservations = new HashSet<Reservation>(0);

	public Adherent() {
	}

	public Adherent(String nomAdherent) {
		this.nomAdherent = nomAdherent;
	}

	public Adherent(String nomAdherent, String prenomAdherent,
			Set<Reservation> reservations) {
		this.nomAdherent = nomAdherent;
		this.prenomAdherent = prenomAdherent;
		this.reservations = reservations;
	}

	public Integer getIdAdherent() {
		return this.idAdherent;
	}

	public void setIdAdherent(Integer idAdherent) {
		this.idAdherent = idAdherent;
	}

	public String getNomAdherent() {
		return this.nomAdherent;
	}

	public void setNomAdherent(String nomAdherent) {
		this.nomAdherent = nomAdherent;
	}

	public String getPrenomAdherent() {
		return this.prenomAdherent;
	}

	public void setPrenomAdherent(String prenomAdherent) {
		this.prenomAdherent = prenomAdherent;
	}

	public Set<Reservation> getReservations() {
		return this.reservations;
	}

	public void setReservations(Set<Reservation> reservations) {
		this.reservations = reservations;
	}

}
