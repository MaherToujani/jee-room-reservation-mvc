package Project.Reservation_salles;

import java.time.LocalDate;

public class Reservation {
    private Long id;
    private Long salleId; // simple relation by id
    private LocalDate dateReservation;
    private String motif;
    private String personne;

    public Reservation() {}
    public Reservation(Long id, Long salleId, LocalDate dateReservation, String motif, String personne) {
        this.id=id; this.salleId=salleId; this.dateReservation=dateReservation; this.motif=motif; this.personne=personne;
    }
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getSalleId() { return salleId; }
    public void setSalleId(Long salleId) { this.salleId = salleId; }
    public LocalDate getDateReservation() { return dateReservation; }
    public void setDateReservation(LocalDate dateReservation) { this.dateReservation = dateReservation; }
    public String getMotif() { return motif; }
    public void setMotif(String motif) { this.motif = motif; }
    public String getPersonne() { return personne; }
    public void setPersonne(String personne) { this.personne = personne; }
}
