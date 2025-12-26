package Project.Reservation_salles;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import Project.Reservation_salles.ReservationDAO;
import Project.Reservation_salles.SalleDAO;
import Project.Reservation_salles.Reservation;
import Project.Reservation_salles.Salle;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet(name="ReservationServlet", urlPatterns={"/reservations"})
public class ReservationServlet extends HttpServlet {
    private ReservationDAO rdao = new ReservationDAO();
    private SalleDAO sdao = new SalleDAO();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        try {
            if ("create".equals(action)) {
                List<Salle> salles = sdao.findAll();
                req.setAttribute("salles", salles);
                req.getRequestDispatcher("/WEB-INF/Views/Res_form.jsp").forward(req, resp);
                return;
            } else if ("delete".equals(action)) {
                long id = Long.parseLong(req.getParameter("id"));
                rdao.delete(id);
                resp.sendRedirect(req.getContextPath() + "/reservations");
                return;
            } else {
                List<Reservation> list = rdao.findAll();
                req.setAttribute("reservations", list);
                req.getRequestDispatcher("/WEB-INF/Views/Res_list.jsp").forward(req, resp);
                return;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            long salleId = Long.parseLong(req.getParameter("salleId"));
            LocalDate date = LocalDate.parse(req.getParameter("dateReservation")); // yyyy-MM-dd
            String motif = req.getParameter("motif");
            String personne = req.getParameter("personne");

            List<Reservation> existing = rdao.findBySalleAndDate(salleId, date);
            if (!existing.isEmpty()) {
                req.setAttribute("error", "La salle n'est pas disponible à cette date.");
                req.setAttribute("salles", sdao.findAll());
                req.getRequestDispatcher("/WEB-INF/Views/Res_form.jsp").forward(req, resp);
                return;
            }

            Reservation r = new Reservation();
            r.setSalleId(salleId);
            r.setDateReservation(date);
            r.setMotif(motif);
            r.setPersonne(personne);
            rdao.insert(r);

            resp.sendRedirect(req.getContextPath() + "/reservations");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
