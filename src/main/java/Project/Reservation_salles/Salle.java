package Project.Reservation_salles;

public class Salle {
    private Long id;
    private String nom;
    private int capacite;
    private String equipement;

    public Salle() {}
    public Salle(Long id, String nom, int capacite, String equipement) {
        this.id = id; this.nom = nom; this.capacite = capacite; this.equipement = equipement;
    }
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }
    public int getCapacite() { return capacite; }
    public void setCapacite(int capacite) { this.capacite = capacite; }
    public String getEquipement() { return equipement; }
    public void setEquipement(String equipement) { this.equipement = equipement; }
}
