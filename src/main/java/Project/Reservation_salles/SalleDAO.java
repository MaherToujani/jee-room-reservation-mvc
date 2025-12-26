package Project.Reservation_salles;

import java.sql.*;
import java.util.*;

public class SalleDAO {

    public List<Salle> findAll() throws Exception {
        List<Salle> list = new ArrayList<>();
        String sql = "SELECT id, nom, capacite, equipement FROM salle ORDER BY id";

        try (Connection c = DBUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new Salle(
                    rs.getLong("id"),
                    rs.getString("nom"),
                    rs.getInt("capacite"),
                    rs.getString("equipement")
                ));
            }
        }
        return list;
    }

    public Salle findById(long id) throws Exception {
        String sql = "SELECT id, nom, capacite, equipement FROM salle WHERE id=?";
        try (Connection c = DBUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setLong(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Salle(
                        rs.getLong("id"),
                        rs.getString("nom"),
                        rs.getInt("capacite"),
                        rs.getString("equipement")
                    );
                }
            }
        }
        return null;
    }

    public void insert(Salle s) throws Exception {
        String sql = "INSERT INTO salle (nom, capacite, equipement) VALUES (?, ?, ?)";
        try (Connection c = DBUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setString(1, s.getNom());
            ps.setInt(2, s.getCapacite());
            ps.setString(3, s.getEquipement());
            ps.executeUpdate();
        }
    }

    public void update(Salle s) throws Exception {
        String sql = "UPDATE salle SET nom=?, capacite=?, equipement=? WHERE id=?";
        try (Connection c = DBUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setString(1, s.getNom());
            ps.setInt(2, s.getCapacite());
            ps.setString(3, s.getEquipement());
            ps.setLong(4, s.getId());
            ps.executeUpdate();
        }
    }

    public void delete(long id) throws Exception {
        String sql = "DELETE FROM salle WHERE id=?";
        try (Connection c = DBUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setLong(1, id);
            ps.executeUpdate();
        }
    }
}
