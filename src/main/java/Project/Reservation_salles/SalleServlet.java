	package Project.Reservation_salles;
	
	import jakarta.servlet.*;
	import jakarta.servlet.http.*;
	import jakarta.servlet.annotation.*;
	import Project.Reservation_salles.SalleDAO;
	import Project.Reservation_salles.Salle;
	import java.io.IOException;
	import java.util.List;
	
	@WebServlet(name="SalleServlet", urlPatterns={"/salles"})
	public class SalleServlet extends HttpServlet {
	    private SalleDAO dao = new SalleDAO();
	
	    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        String action = req.getParameter("action");
	        try {
	            if ("create".equals(action)) {
	                req.getRequestDispatcher("/WEB-INF/Views/Salle_form.jsp").forward(req, resp);
	                return;
	            } else if ("edit".equals(action)) {
	                long id = Long.parseLong(req.getParameter("id"));
	                Salle s = dao.findById(id);
	                req.setAttribute("salle", s);
	                req.getRequestDispatcher("/WEB-INF/Views/Salle_form.jsp").forward(req, resp);
	                return;
	            } else if ("delete".equals(action)) {
	                long id = Long.parseLong(req.getParameter("id"));
	                dao.delete(id);
	                resp.sendRedirect(req.getContextPath() + "/salles");
	                return;
	            } else {
	                List<Salle> list = dao.findAll();
	                req.setAttribute("salles", list);
	                req.getRequestDispatcher("/WEB-INF/Views/Salle_list.jsp").forward(req, resp);
	     
	                
	                //DEBUG
	                System.out.println("DEBUG: Salle list size is: " + list.size());
	                
	                req.setAttribute("salles", list); 
	                req.getRequestDispatcher("/WEB-INF/Views/Salle_list.jsp").forward(req, resp);
	                return;
	         
	                
	            }
	        } catch (Exception e) {
	            throw new ServletException(e);
	        }
	    }
	
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        try {
	            String idStr = req.getParameter("id");
	            String nom = req.getParameter("nom");
	            int capacite = Integer.parseInt(req.getParameter("capacite"));
	            String equip = req.getParameter("equipement");
	
	            if (idStr == null || idStr.isEmpty()) {
	                Salle s = new Salle(null, nom, capacite, equip);
	                dao.insert(s);
	            } else {
	                Salle s = new Salle(Long.parseLong(idStr), nom, capacite, equip);
	                dao.update(s);
	            }
	            resp.sendRedirect(req.getContextPath() + "/salles");
	        } catch (Exception e) {
	            throw new ServletException(e);
	        }
	    }
	}
