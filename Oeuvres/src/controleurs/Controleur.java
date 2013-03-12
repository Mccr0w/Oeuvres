package controleurs;

import java.awt.List;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import outils.GenericHibernate;
import outils.Utilitaire;
import outils.hibernateUtil;


import metier.*;

/**
 * Servlet implementation class Controleur
 */
@WebServlet("/Controleur")
public class Controleur extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String ACTION_TYPE = "action";
	private static final String SAISIE_OEUVRE = "saisieOeuvre";
	private static final String AJOUT_OEUVRE = "ajoutOeuvre";
	private static final String CATALOGUE_OEUVRE = "catalogueOeuvre";
	private static final String RESERVER_OEUVRE = "reserverOeuvre";
	private static final String LISTE_RESERVATION = "listerReservation";
	private static final String VALIDER_RESERVATION = "validerReservation";
	private static final String CONFIRMER_RESERVATION = "confirmerReservation";
	private static final String MODIFIER_OEUVRE = "modifierOeuvre";
	private static final String AJOUT_ADHERENT = "ajoutAdherent";
	private static final String DECONNEXION = "deconnexion";
	private static final String ERROR_PAGE = "/Erreur.jsp";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Controleur() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {

			hibernateUtil.getSessionFactory().getCurrentSession()
					.beginTransaction();
			processusTraiteRequete(request, response);
			hibernateUtil.getSessionFactory().getCurrentSession()
					.getTransaction().commit();

		} catch (Exception e) {
			hibernateUtil.getSessionFactory().getCurrentSession()
					.getTransaction().rollback();
			// Redirection vers la page jsp appropriee
			request.setAttribute("erreur", e.getMessage());
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/Erreur.jsp");
			dispatcher.forward(request, response);
			System.out.println(e.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			hibernateUtil.getSessionFactory().getCurrentSession()
					.beginTransaction();
			processusTraiteRequete(request, response);
			hibernateUtil.getSessionFactory().getCurrentSession()
					.getTransaction().commit();

		} catch (Exception e) {
			hibernateUtil.getSessionFactory().getCurrentSession()
					.getTransaction().rollback();
			// Redirection vers la page jsp appropriee
			request.setAttribute("erreur", e.getMessage());
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/Erreur.jsp");
			dispatcher.forward(request, response);
			System.out.println(e.getMessage());
		}

	}

	protected void processusTraiteRequete(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,
			Exception {
		String actionName = request.getParameter(ACTION_TYPE);
		String destinationPage = ERROR_PAGE;
		System.out.println("Action: <" + actionName + ">");

		// execute l'action
		if (LISTE_RESERVATION.equals(actionName)) {

			Reservation r = new Reservation();
			GenericHibernate<Reservation> rh = new GenericHibernate<Reservation>(r);
			ArrayList<Reservation> liste = new ArrayList<Reservation>();
			liste = (ArrayList<Reservation>) rh.findAll(r);
			
			request.setAttribute("liste", liste);
			
			destinationPage = "/listereservations.jsp";
			
		}else if (CATALOGUE_OEUVRE.equals(actionName)) {

			Oeuvrevente r = new Oeuvrevente();
			GenericHibernate<Oeuvrevente> rh = new GenericHibernate<Oeuvrevente>(r);
			ArrayList<Oeuvrevente> liste = new ArrayList<Oeuvrevente>();
			liste = (ArrayList<Oeuvrevente>) rh.findAll(r);

			request.setAttribute("liste", liste);
			
			destinationPage = "/catalogue.jsp";
		}
		else if(AJOUT_ADHERENT.equals(actionName)){
			
			Adherent a = new Adherent(request.getParameter("nom"), request.getParameter("prenom"),new TreeSet<Reservation>());
			GenericHibernate<Adherent> ah = new GenericHibernate<Adherent>(a);
			ah.persist(a);
			destinationPage = "/accueil.jsp";
			
		}
		else if(SAISIE_OEUVRE.equals(actionName)){
			
		    Proprietaire p = new Proprietaire();
			GenericHibernate<Proprietaire> ph = new GenericHibernate<Proprietaire>(p);
			ArrayList<Proprietaire> liste = new ArrayList<Proprietaire>();
			liste = (ArrayList<Proprietaire>) ph.findAll(p);
			
			destinationPage = "/oeuvre.jsp";
			
			request.setAttribute("listeproprietaires", liste);
			request.setAttribute("titre", "Ajouter une Oeuvre");
			
		}
		else if(MODIFIER_OEUVRE.equals(actionName)){
			
			Oeuvrevente o = new Oeuvrevente();
			GenericHibernate<Oeuvrevente> oh = new GenericHibernate<Oeuvrevente>(o);
			o=oh.findById(o, Integer.parseInt(request.getParameter("id")));
			
		    Proprietaire p = new Proprietaire();
			GenericHibernate<Proprietaire> ph = new GenericHibernate<Proprietaire>(p);
			ArrayList<Proprietaire> liste = new ArrayList<Proprietaire>();
			liste = (ArrayList<Proprietaire>) ph.findAll(p);
			
			destinationPage = "/oeuvre.jsp";
			
			request.setAttribute("listeproprietaires", liste);
			request.setAttribute("titre", "Modifier une Oeuvre");
			request.setAttribute("oeuvre", o);
		}
		else if(AJOUT_OEUVRE.equals(actionName)){
			
			Oeuvrevente r = new Oeuvrevente();
			GenericHibernate<Oeuvrevente> rh = new GenericHibernate<Oeuvrevente>(r);
			
			if (request.getParameter("id") != ""){

				r=rh.findById(r, Integer.parseInt(request.getParameter("id")));
				
			}
			else{
				r.setEtatOeuvrevente("L");
			}
			
			r.setPrixOeuvrevente(Float.parseFloat(request.getParameter("txtPrix")));
			r.setTitreOeuvrevente(request.getParameter("txtTitre"));				
		    Proprietaire p = new Proprietaire();
			GenericHibernate<Proprietaire> ph = new GenericHibernate<Proprietaire>(p);
			p = ph.findById(p,Integer.parseInt(request.getParameter("proprietaire")));
			
			r.setProprietaire(p);
			
			rh.persist(r);
			
			destinationPage = "/accueil.jsp";
		}else if(RESERVER_OEUVRE.equals(actionName)){
			
		    Adherent a = new Adherent();
			GenericHibernate<Adherent> ah = new GenericHibernate<Adherent>(a);
			ArrayList<Adherent> liste = new ArrayList<Adherent>();
			liste = (ArrayList<Adherent>) ah.findAll(a);
			
			Oeuvrevente o = new Oeuvrevente();
			GenericHibernate<Oeuvrevente> oh = new GenericHibernate<Oeuvrevente>(o);
			o=oh.findById(o, Integer.parseInt(request.getParameter("id")));
			
			destinationPage = "/reservation.jsp";
			
			Date date = new Date();
			
			request.setAttribute("listeadherent", liste);
			request.setAttribute("oeuvre", o);
			request.setAttribute("date", Utilitaire.DateToStr(date, "dd/MM/yyyy"));
		}
		else if(VALIDER_RESERVATION.equals(actionName)){
		    Adherent a = new Adherent();
			GenericHibernate<Adherent> ah = new GenericHibernate<Adherent>(a);
			a = ah.findById(a, Integer.parseInt(request.getParameter("lstAdherents")) );
			
			Oeuvrevente o = new Oeuvrevente();
			GenericHibernate<Oeuvrevente> oh = new GenericHibernate<Oeuvrevente>(o);
			o=oh.findById(o, Integer.parseInt(request.getParameter("id")));
			o.setEtatOeuvrevente("R");
			oh.persist(o);
			
			destinationPage = "/accueil.jsp";
			
			Date date = Utilitaire.StrToDate(request.getParameter("txtDate"), "dd/MM/yyyy");
			
			Reservation r = new Reservation();
			r.setAdherent(a);
			r.setDateReservation(date);
			r.setOeuvrevente(o);
			r.setStatut("A");
			ReservationId id = new ReservationId(o.getIdOeuvrevente(), a.getIdAdherent());			
			r.setId(id);
	
			
			GenericHibernate<Reservation> rh = new GenericHibernate<Reservation>(r);
			rh.persist(r);
		}	else if(CONFIRMER_RESERVATION.equals(actionName)){

			Reservation r = new Reservation();
			GenericHibernate<Reservation> rh = new GenericHibernate<Reservation>(r);
			ReservationId ri = new ReservationId(Integer.parseInt(request.getParameter("idO")), Integer.parseInt(request.getParameter("idA")));
			r = rh.findById(r, ri);
			
			r.setStatut("C");
			
			rh.persist(r);
			
			destinationPage = "/accueil.jsp";
		}

		

		/*
		 * if (SAISIE_STAGE.equals(actionName)) { destinationPage =
		 * "/SaisieStage.jsp"; } else if (AFFICHER_STAGE.equals(actionName)) {
		 * Stage monStage = new Stage(); ArrayList<Stage> stages = new
		 * ArrayList<Stage>(); stages.addAll(monStage.afficheLesStages()); //
		 * Permet d'utiliser les stages dans le .JSP !!!
		 * request.setAttribute("stages", stages); destinationPage =
		 * "/AfficherStage.jsp"; } else if (RECHERCHER_STAGE.equals(actionName))
		 * { destinationPage = "/RechercherStage.jsp"; } else if
		 * (SAUVER_STAGE.equals(actionName)) { SimpleDateFormat sdf = new
		 * SimpleDateFormat("dd/mm/yyyy");
		 * 
		 * Stage monStage = new Stage(request.getParameter("id"),
		 * request.getParameter("libelle"), sdf.parse(request
		 * .getParameter("datedebut")), sdf.parse(request
		 * .getParameter("datefin")), Integer.parseInt(request
		 * .getParameter("nbplaces")),
		 * Integer.parseInt(request.getParameter("nbinscrits")));
		 * monStage.insertionStage(); destinationPage = "/index.jsp"; } else if
		 * (CHERCHER_STAGE.equals(actionName)) { Stage monStage = new Stage();
		 * ArrayList<Stage> stages = new ArrayList<Stage>();
		 * stages.addAll(monStage.rechercheLesStages(request
		 * .getParameter("stageChercher"))); // Permet d'utiliser les stages
		 * dans le .JSP !!!!!!!!!!!!!!!!!!!!!!! request.setAttribute("stages",
		 * stages); destinationPage = "/AfficherStage.jsp"; } else if
		 * (SUPPRIMER_STAGE.equals(actionName)) { Stage monStage = new Stage();
		 * monStage.supprimeLesStages(request.getParameter(ID_TYPE));
		 * destinationPage = "/index.jsp"; } else if
		 * (MODIFIER_STAGE.equals(actionName)) { Stage monStage = new Stage();
		 * monStage.modifierStage( request.getParameter("id"),
		 * request.getParameter("libelle"), request.getParameter("datedebut"),
		 * request.getParameter("datefin"), request.getParameter("nbplaces"),
		 * request.getParameter("nbinscrits") ); destinationPage = "/index.jsp";
		 * 
		 * } else if (EDITER_STAGE.equals(actionName)) { Stage stageAModifier =
		 * new Stage(); if (!request.getParameter(ID_TYPE).isEmpty()) {
		 * stageAModifier = stageAModifier.chargerUnStages(request
		 * .getParameter(ID_TYPE)); request.setAttribute("stage",
		 * stageAModifier); } destinationPage = "/SaisieStage.jsp"; }
		 */

		//Redirection vers la page jsp appropriee
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(destinationPage);
		dispatcher.forward(request, response);

	}

}
