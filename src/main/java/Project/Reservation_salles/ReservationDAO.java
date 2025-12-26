package Project.Reservation_salles;

import java.sql.*;
import java.time.LocalDate;
import java.util.*;
import java.sql.Date;

public class ReservationDAO {

    private Reservation map(ResultSet rs) throws Exception {
        return new Reservation(
            rs.getLong("id"),
            rs.getLong("salle_id"),
            rs.getDate("date_reservation").toLocalDate(),
            rs.getString("motif"),
            rs.getString("personne")
        );
    }

    public List<Reservation> findAll() throws Exception {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT * FROM reservation ORDER BY date_reservation, id";

        try (Connection c = DBUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) list.add(map(rs));
        }
        return list;
    }

    public List<Reservation> findBySalleAndDate(long salleId, LocalDate d) throws Exception {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT * FROM reservation WHERE salle_id=? AND date_reservation=?";

        try (Connection c = DBUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setLong(1, salleId);
            ps.setDate(2, Date.valueOf(d));

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) list.add(map(rs));
            }
        }
        return list;
    }

    public void insert(Reservation r) throws Exception {
        String sql = "INSERT INTO reservation (salle_id, date_reservation, motif, personne) VALUES (?, ?, ?, ?)";

        try (Connection c = DBUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setLong(1, r.getSalleId());
            ps.setDate(2, Date.valueOf(r.getDateReservation()));
            ps.setString(3, r.getMotif());
            ps.setString(4, r.getPersonne());
            ps.executeUpdate();
        }
    }

    public void delete(long id) throws Exception {
        String sql = "DELETE FROM reservation WHERE id=?";

        try (Connection c = DBUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setLong(1, id);
            ps.executeUpdate();
        }
    }
}
